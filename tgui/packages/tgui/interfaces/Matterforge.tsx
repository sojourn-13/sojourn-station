import { useState } from 'react';
import { useBackend, useSharedState } from 'tgui/backend';
import { Button } from 'tgui/components';
import { Window } from 'tgui/layouts';
import {
  Box,
  LabeledList,
  ProgressBar,
  Section,
  Stack,
  VirtualList,
} from 'tgui-core/components';
import { round } from 'tgui-core/math';
import { BooleanLike } from 'tgui-core/react';
import { toTitleCase } from 'tgui-core/string';

import { SearchBar } from './Fabrication/SearchBar';

export type MaterialData = {
  mat_capacity: number;
  materials: {
    name: string;
    id: string;
    amount: number;
    ejectable: BooleanLike;
  }[];
};

export const LoadedMaterials = (props: MaterialData) => {
  const { act } = useBackend<MaterialData>();

  const { materials, mat_capacity } = props;

  return (
    <Section
      fill
      scrollable
      height={materials.length <= 1 ? 5 : 18}
      title="Loaded Materials"
      buttons={
        <Button
          icon="arrow-up"
          tooltip="Load Materials From Hand"
          onClick={() => act('insert_material')}
        />
      }
    >
      {(materials.length > 0 && (
        <LabeledList>
          {materials.map((material) => {
            return (
              <LabeledList.Item
                key={material.id}
                buttons={
                  material.ejectable && (
                    <Button
                      icon="eject"
                      onClick={() => act('eject_material', { id: material.id })}
                    />
                  )
                }
                label={toTitleCase(material.name)}
              >
                {material.amount} / {mat_capacity}
              </LabeledList.Item>
            );
          })}
        </LabeledList>
      )) || <Box>None loaded.</Box>}
    </Section>
  );
};

export type Design = {
  id: string;
  name: string;
  desc: string;
  time: number;
  category: string | null;
  adjust_materials: number;
  materials: {
    id: string;
    name: string;
    req: number;
  }[];
  chemicals: {
    id: string;
    name: string;
    req: number;
  }[];
  icon: string;
  copy_protected: BooleanLike;
  filename: string;
  point_cost: number;
};

export type AutolatheItemProps = {
  design: Design;
  mat_efficiency: number;
};

export const AutolatheItemDetails = (props: AutolatheItemProps) => {
  const { design, mat_efficiency } = props;

  return (
    <>
      {design.materials ? (
        <Section title="Materials">
          {design.materials.map((mat) => (
            <LabeledList.Item key={mat.id} label={mat.name}>
              {round(mat.req * mat_efficiency, 2)}
            </LabeledList.Item>
          ))}
        </Section>
      ) : null}
      {design.chemicals ? (
        <Section title="Chemicals">
          {design.chemicals.map((chem) => (
            <LabeledList.Item key={chem.id} label={chem.name}>
              {chem.req}
            </LabeledList.Item>
          ))}
        </Section>
      ) : null}
      <Section title="Other information">
        <LabeledList>
          <LabeledList.Item label="Build time">{design.time}</LabeledList.Item>
          {design.point_cost ? (
            <LabeledList.Item label="Point cost">
              {design.point_cost}
            </LabeledList.Item>
          ) : null}
        </LabeledList>
      </Section>
    </>
  );
};

export const AutolatheItem = (props: AutolatheItemProps) => {
  const { act, config } = useBackend();
  const { design, mat_efficiency } = props;

  const [showDetails, setShowDetails] = useState(false);

  return (
    <Box style={{ borderBottom: '2px solid #444', padding: '4px' }}>
      <Stack vertical>
        <Stack.Item>
          <Stack align="center">
            {!config.window.toaster && (
              <Stack.Item>
                <Stack
                  width="32px"
                  height="32px"
                  align="center"
                  justify="center"
                  backgroundColor="black"
                  overflow="hidden"
                  style={{ border: '1px solid #3e6189 ' }}
                >
                  <Stack.Item className={design.icon} />
                </Stack>
              </Stack.Item>
            )}
            <Stack.Item grow>{design.name}</Stack.Item>
            <Stack.Item>
              <Button
                icon="print"
                tooltip="Print"
                onClick={() => {
                  act('add_to_queue', {
                    id: design.id,
                    filename: design.filename,
                    several: false,
                  });
                }}
              />
            </Stack.Item>
            <Stack.Item>
              <Button
                icon="th"
                tooltip="Print Several"
                onClick={() => {
                  act('add_to_queue', {
                    id: design.id,
                    filename: design.filename,
                    several: true,
                  });
                }}
              />
            </Stack.Item>
            <Stack.Item>
              <Button
                tooltip="Show Details"
                icon={showDetails ? 'arrow-up' : 'arrow-down'}
                onClick={() => setShowDetails(!showDetails)}
              />
            </Stack.Item>
          </Stack>
        </Stack.Item>
        {showDetails && (
          <Stack.Item backgroundColor="black" style={{ padding: '10px' }}>
            <AutolatheItemDetails
              design={design}
              mat_efficiency={mat_efficiency}
            />
          </Stack.Item>
        )}
      </Stack>
    </Box>
  );
};

export type AutolatheQueueData = {
  error: string;
  current: Design | null;
  progress: number;
  queue: (Design & {
    ind: number;
    error: number;
  })[];
  queue_max: number;
  paused: BooleanLike;
  mat_efficiency: number;
};

export const AutolatheQueue = (props: AutolatheQueueData) => {
  const { act, config } = useBackend<Data>();
  const { error, current, progress, queue, queue_max, paused, mat_efficiency } =
    props;

  return (
    <Stack vertical height="100%">
      <Stack.Item>
        <Section title="Current Item">
          {current ? (
            <Stack vertical>
              <Stack.Item>
                <Stack align="center">
                  {!config.window.toaster && (
                    <Stack.Item>
                      <Stack
                        width="32px"
                        height="32px"
                        align="center"
                        justify="center"
                        backgroundColor="black"
                        overflow="hidden"
                        style={{ border: '1px solid #3e6189 ' }}
                      >
                        <Stack.Item className={current.icon} />
                      </Stack>
                    </Stack.Item>
                  )}
                  <Stack.Item grow>
                    <Stack vertical>
                      <Stack.Item>Printing {current.name}</Stack.Item>
                      {error ? (
                        <Stack.Item textColor="bad">{error}</Stack.Item>
                      ) : (
                        <Stack.Item>
                          <ProgressBar
                            value={progress / current.time}
                            color="good"
                          />
                        </Stack.Item>
                      )}
                    </Stack>
                  </Stack.Item>
                  <Stack.Item>
                    <Button
                      icon={paused ? 'play' : 'pause'}
                      onClick={() => {
                        act('pause');
                      }}
                    />
                    <Button
                      icon="times"
                      onClick={() => {
                        act('abort_print');
                      }}
                    />
                  </Stack.Item>
                </Stack>
              </Stack.Item>
              <Stack.Item backgroundColor="black" style={{ padding: '10px' }}>
                <AutolatheItemDetails
                  design={current}
                  mat_efficiency={mat_efficiency}
                />
              </Stack.Item>
            </Stack>
          ) : (
            <>Nothing printing.</>
          )}
        </Section>
      </Stack.Item>
      <Stack.Item grow>
        <Section
          fill
          title="Queue"
          buttons={
            <Stack align="center">
              <Stack.Item>
                Queue: {queue.length} / {queue_max}
              </Stack.Item>
              <Stack.Item>
                <Button
                  color="bad"
                  icon="times"
                  tooltip="Clear Queue"
                  onClick={() => {
                    act('clear_queue');
                  }}
                />
              </Stack.Item>
            </Stack>
          }
          scrollable
        >
          <Stack vertical>
            {queue.map((item) => (
              <Stack.Item
                key={item.name + item.ind}
                style={{ borderBottom: '2px solid #444' }}
              >
                <Stack align="center">
                  <Stack.Item grow color={errorToColor(item.error)}>
                    {item.name}
                  </Stack.Item>
                  {item.ind > 1 && (
                    <Stack.Item>
                      <Button
                        icon="arrow-up"
                        onClick={() => {
                          act('move_up_queue', { index: item.ind });
                        }}
                      />
                    </Stack.Item>
                  )}
                  {item.ind < queue.length && (
                    <Stack.Item>
                      <Button
                        icon="arrow-down"
                        onClick={() => {
                          act('move_down_queue', { index: item.ind });
                        }}
                      />
                    </Stack.Item>
                  )}
                  <Stack.Item>
                    <Button
                      icon="times"
                      onClick={() => {
                        act('remove_from_queue', { index: item.ind });
                      }}
                    />
                  </Stack.Item>
                  <Stack.Item>
                    <Stack
                      width="32px"
                      height="32px"
                      align="center"
                      justify="center"
                      backgroundColor="black"
                      overflow="hidden"
                      style={{ border: '1px solid #3e6189 ' }}
                    >
                      <Stack.Item className={item.icon} />
                    </Stack>
                  </Stack.Item>
                </Stack>
              </Stack.Item>
            ))}
          </Stack>
        </Section>
      </Stack.Item>
    </Stack>
  );
};

type Data = MaterialData &
  AutolatheQueueData & {
    unfolded: string | null;
    mat_efficiency: number;
    designs: Design[];
    current: Design | null;
  };

const errorToColor = (error: number) => {
  if (error >= 2) {
    return 'bad';
  } else if (error === 1) {
    return 'average';
  } else {
    return 'good';
  }
};

export const Matterforge = (props) => {
  const { act, data } = useBackend<Data>();
  const {
    error,
    designs,
    current,
    progress,
    queue,
    queue_max,
    paused,
    mat_efficiency,
  } = data;

  const [searchText, setSearchText] = useSharedState('search_text', '');

  return (
    <Window width={720} height={700}>
      <Window.Content>
        <LoadedMaterials
          mat_capacity={data.mat_capacity}
          materials={data.materials}
        />
        <Stack height="85%">
          <Stack.Item grow>
            <Section title="Recipes" fill>
              <Box style={{ paddingBottom: '8px' }}>
                <SearchBar
                  searchText={searchText}
                  onSearchTextChanged={setSearchText}
                  hint={'Search all designs...'}
                />
              </Box>
              <Section
                style={{ paddingRight: '4px', paddingBottom: '30px' }}
                fill
                scrollable
              >
                <Stack vertical>
                  <VirtualList>
                    {searchText.length > 0
                      ? designs
                          .filter((design) =>
                            design.name.toLowerCase().includes(searchText),
                          )
                          .map((design) => {
                            return (
                              <Stack.Item key={design.id}>
                                <AutolatheItem
                                  design={design}
                                  mat_efficiency={mat_efficiency}
                                />
                              </Stack.Item>
                            );
                          })
                      : designs.map((design) => {
                          return (
                            <Stack.Item key={design.id}>
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
          </Stack.Item>
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
        </Stack>
      </Window.Content>
    </Window>
  );
};
