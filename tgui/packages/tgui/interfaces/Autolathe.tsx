import { useBackend, useSharedState } from 'tgui/backend';
import { Button } from 'tgui/components';
import { Window } from 'tgui/layouts';
import {
  Box,
  LabeledList,
  Section,
  Stack,
  VirtualList,
} from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';
import { decodeHtmlEntities } from 'tgui-core/string';

import { SearchBar } from './Fabrication/SearchBar';
import {
  AutolatheItem,
  AutolatheQueue,
  AutolatheQueueData,
  Design,
  LoadedMaterials,
  MaterialData,
} from './Matterforge';

export type ReagentData = {
  container: BooleanLike;
  reagents: { name: string; amount: number }[];
};

export const Reagents = (props: ReagentData) => {
  const { act } = useBackend();

  const { container, reagents } = props;

  return (
    <Section
      height="100%"
      title="Inserted beaker"
      buttons={
        container ? (
          <Button
            icon="eject"
            tooltip="Eject Beaker"
            onClick={() => act('eject_beaker')}
          />
        ) : null
      }
    >
      {container ? (
        reagents.length > 0 ? (
          <LabeledList>
            {reagents.map((reagent) => (
              <LabeledList.Item key={reagent.name} label={reagent.name}>
                {reagent.amount}
              </LabeledList.Item>
            ))}
          </LabeledList>
        ) : (
          'Empty.'
        )
      ) : (
        'Not inserted.'
      )}
    </Section>
  );
};

export type DiskData = {
  disk: {
    name: string;
    license: number;
    read_only: BooleanLike;
  };
};

export const Disk = (props: DiskData) => {
  const { act } = useBackend();

  const { disk } = props;

  return (
    <Section>
      <LabeledList>
        <LabeledList.Item
          label="Disk"
          color={disk ? 'white' : 'grey'}
          buttons={
            disk ? (
              <Button
                icon="eject"
                tooltip="Eject Disk"
                onClick={() => {
                  act('eject_disk');
                }}
              />
            ) : null
          }
        >
          {disk ? decodeHtmlEntities(disk.name) : 'Not inserted.'}
        </LabeledList.Item>
        {disk && disk.license > 0 ? (
          <LabeledList.Item label="License Points">
            {disk.license}
          </LabeledList.Item>
        ) : null}
      </LabeledList>
    </Section>
  );
};

type Data = MaterialData &
  ReagentData &
  DiskData &
  AutolatheQueueData & {
    have_reagents: BooleanLike;
    have_materials: BooleanLike;
    have_design_selector: BooleanLike;
    designs: Design[];
    error: string | null;
    paused: BooleanLike;
    speed: number;
    special_actions: { name: string; icon: string; action: string }[];
    mat_efficiency: number;
    queue_max: number;
    have_disk: BooleanLike;
    categories: string[];
    show_category: string;
  };

export const Autolathe = (props) => {
  const { act, data } = useBackend<Data>();

  const {
    have_design_selector,
    have_disk,
    disk,
    mat_capacity,
    materials,
    container,
    reagents,
    have_materials,
    have_reagents,
    designs,
    current,
    error,
    paused,
    progress,
    queue,
    queue_max,
    special_actions,
    categories,
    show_category,
    mat_efficiency,
  } = data;

  const [searchText, setSearchText] = useSharedState('search_text', '');

  return (
    <Window width={720} height={700}>
      <Window.Content>
        <Stack vertical height="100%">
          <Stack.Item>
            <Stack>
              {have_materials ? (
                <Stack.Item grow>
                  <LoadedMaterials
                    mat_capacity={mat_capacity}
                    materials={materials}
                  />
                </Stack.Item>
              ) : null}
              {have_reagents ? (
                <Stack.Item grow>
                  <Reagents container={container} reagents={reagents} />
                </Stack.Item>
              ) : null}
            </Stack>
          </Stack.Item>
          {have_disk ? (
            <Stack.Item>
              <Disk disk={disk} />
            </Stack.Item>
          ) : null}
          {special_actions ? (
            <Stack.Item>
              <Section title="Special Actions">
                <Stack>
                  {special_actions.map((action) => (
                    <Stack.Item key={action.action}>
                      <Button
                        icon={action.icon}
                        onClick={() => {
                          act('special_action', { action: action.action });
                        }}
                      >
                        {action.name}
                      </Button>
                    </Stack.Item>
                  ))}
                </Stack>
              </Section>
            </Stack.Item>
          ) : null}
          {categories ? (
            <Stack.Item>
              <Section>
                <Stack fill wrap justify="center" align="center">
                  {categories.map((category) => (
                    <Stack.Item key={category} mb={0.5} mt={0.5}>
                      <Button
                        selected={category === show_category}
                        onClick={() =>
                          act('switch_category', { category: category })
                        }
                      >
                        {category}
                      </Button>
                    </Stack.Item>
                  ))}
                </Stack>
              </Section>
            </Stack.Item>
          ) : null}
          <Stack.Item grow>
            <Stack height="95%">
              {designs ? (
                <Stack.Item grow height="100%">
                  {have_design_selector ? (
                    <Section title="Recipes" fill>
                      <Box style={{ paddingBottom: '8px' }}>
                        <SearchBar
                          searchText={searchText}
                          onSearchTextChanged={setSearchText}
                          hint={'Search all designs...'}
                        />
                      </Box>
                      <Section
                        style={{
                          paddingRight: '4px',
                          paddingBottom: '30px',
                        }}
                        fill
                        scrollable
                      >
                        <Stack vertical>
                          <VirtualList>
                            {searchText.length > 0
                              ? designs
                                  .filter((design) =>
                                    design.name
                                      .toLowerCase()
                                      .includes(searchText),
                                  )
                                  .map((design) => {
                                    return (
                                      <Stack.Item key={design.id + design.name}>
                                        <AutolatheItem
                                          design={design}
                                          mat_efficiency={mat_efficiency}
                                        />
                                      </Stack.Item>
                                    );
                                  })
                              : designs.map((design) => {
                                  return (
                                    <Stack.Item key={design.id + design.name}>
                                      <AutolatheItem
                                        design={design}
                                        mat_efficiency={mat_efficiency}
                                      />
                                    </Stack.Item>
                                  );
                                })}
                          </VirtualList>
                        </Stack>
                      </Section>
                    </Section>
                  ) : (
                    <Section color="bad">
                      This equipment is operated remotely.
                    </Section>
                  )}
                </Stack.Item>
              ) : null}
              {queue ? (
                <Stack.Item grow>
                  <AutolatheQueue
                    current={current}
                    error={error}
                    paused={paused}
                    progress={progress}
                    queue={queue}
                    queue_max={queue_max}
                    mat_efficiency={mat_efficiency}
                  />
                </Stack.Item>
              ) : null}
            </Stack>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
