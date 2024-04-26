import { useBackend, useLocalState, useSharedState } from '../backend';
import {
  Box,
  Button,
  Collapsible,
  Flex,
  Knob,
  LabeledControls,
  LabeledList,
  ProgressBar,
  Section,
  Stack,
} from '../components';
import { Window } from '../layouts';
import { BooleanLike } from '../../common/react';
import { toTitleCase } from '../../common/string';
import { SearchBar } from './Fabrication/SearchBar';
import { ScrollableSection } from './LibraryConsole';

type MaterialData = {
  mat_capacity: number;
  materials: {
    name: string;
    id: string;
    amount: number;
    ejectable: BooleanLike;
  }[];
};

export const LoadedMaterials = (props, context) => {
  const { act, data } = useBackend<MaterialData>(context);

  const { materials, mat_capacity } = data;

  return (
    <Section title="Loaded Materials">
      {(materials.length > 0 && (
        <LabeledList>
          {materials.map((material) => {
            return (
              <LabeledList.Item
                buttons={
                  <Button
                    icon="eject"
                    onClick={() => act('eject_material', { id: material.id })}
                  />
                }
                label={toTitleCase(material.name)}>
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
  icon: string;
};

export type AutolatheItemProps = {
  design: Design;
};

export const AutolatheItemDetails = (props: AutolatheItemProps, context) => {
  const { design } = props;

  return (
    <>
      <Section title="Materials">
        <LabeledList>
          {design.materials.map((material) => (
            <LabeledList.Item label={material.name}>
              {material.req}
            </LabeledList.Item>
          ))}
        </LabeledList>
      </Section>
      <Section title="Other information">
        <LabeledList>
          <LabeledList.Item label="Build time">{design.time}</LabeledList.Item>
        </LabeledList>
      </Section>
    </>
  );
};

export const AutolatheItem = (props: AutolatheItemProps, context) => {
  const { act } = useBackend(context);
  const { design } = props;

  const [showDetails, setShowDetails] = useLocalState(
    context,
    'showDetails-' + design.id,
    false
  );

  return (
    <Box style={{ 'border-bottom': '2px solid #444', 'padding': '4px' }}>
      <Stack vertical>
        <Stack.Item>
          <Stack align="center">
            <Stack.Item>
              <Box
                as="img"
                width="24px"
                height="24px"
                src={design.icon}
                style={{
                  '-ms-interpolation-mode': 'nearest-neighbor',
                  'vertical-align': 'middle',
                  'object-fit': 'cover',
                  'margin': '4px',
                  'background-color': 'black',
                  'border': '1px solid #3e6189',
                }}
              />
            </Stack.Item>
            <Stack.Item grow>{design.name}</Stack.Item>
            <Stack.Item>
              <Button
                icon="print"
                tooltip="Print"
                onClick={() => {
                  act('add_to_queue', { 'id': design.id, 'several': false });
                }}
              />
            </Stack.Item>
            <Stack.Item>
              <Button
                icon="th"
                tooltip="Print Several"
                onClick={() => {
                  act('add_to_queue', { 'id': design.id, 'several': true });
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
          <Stack.Item backgroundColor="black" style={{ 'padding': '10px' }}>
            <AutolatheItemDetails design={design} />
          </Stack.Item>
        )}
      </Stack>
    </Box>
  );
};

type Data = {
  error: string;
  paused: BooleanLike;
  unfolded: string | null;
  mat_efficiency: number;
  mat_capacity: number;
  designs: Design[];
  queue: (Design & {
    ind: number;
    error: number;
  })[];
  queue_max: number;
  current: Design | null;
  progress: number;
};

const errorToColor = (error: number) => {
  if (error >= 2) {
    return 'bad';
  } else if (error == 1) {
    return 'average';
  } else {
    return 'good';
  }
};

export const Matterforge = (props, context) => {
  const { act, data } = useBackend<Data>(context);
  const { error, designs, current, progress, queue, queue_max, paused } = data;

  const [searchText, setSearchText] = useSharedState(
    context,
    'search_text',
    ''
  );

  return (
    <Window width={720} height={700}>
      <Window.Content>
        <LoadedMaterials />
        <Stack height="85%">
          <Stack.Item grow>
            <Section title="Recipes" fill>
              <Box style={{ 'padding-bottom': '8px' }}>
                <SearchBar
                  searchText={searchText}
                  onSearchTextChanged={setSearchText}
                  hint={'Search all designs...'}
                />
              </Box>
              <Section
                style={{ 'padding-right': '4px', 'padding-bottom': '30px' }}
                fill
                scrollable>
                <Stack vertical>
                  {searchText.length > 0
                    ? designs
                        .filter((design) =>
                          design.name.toLowerCase().includes(searchText)
                        )
                        .map((design) => {
                          return (
                            <Stack.Item>
                              <AutolatheItem design={design} />
                            </Stack.Item>
                          );
                        })
                    : designs.map((design) => {
                        return (
                          <Stack.Item>
                            <AutolatheItem design={design} />
                          </Stack.Item>
                        );
                      })}
                </Stack>
              </Section>
            </Section>
          </Stack.Item>
          <Stack.Item grow>
            <Stack vertical height="100%">
              <Stack.Item>
                <Section title="Current Item">
                  {current ? (
                    <Stack vertical>
                      <Stack.Item>
                        <Stack align="center">
                          <Stack.Item>
                            <Box
                              as="img"
                              width="48px"
                              height="48px"
                              src={current.icon}
                              style={{
                                '-ms-interpolation-mode': 'nearest-neighbor',
                                'vertical-align': 'middle',
                                'object-fit': 'cover',
                                'margin': '4px',
                                'background-color': 'black',
                                'border': '1px solid #3e6189',
                              }}
                            />
                          </Stack.Item>
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
                      <Stack.Item
                        backgroundColor="black"
                        style={{ 'padding': '10px' }}>
                        <AutolatheItemDetails design={current} />
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
                    <Box>
                      Queue: {queue.length} / {queue_max}
                    </Box>
                  }
                  scrollable>
                  <Stack vertical>
                    {queue.map((item) => (
                      <Stack.Item style={{ 'border-bottom': '2px solid #444' }}>
                        <Stack align="center">
                          <Stack.Item grow color={errorToColor(item.error)}>
                            {item.name}
                          </Stack.Item>
                          {item.ind > 1 && (
                            <Stack.Item>
                              <Button
                                icon="arrow-up"
                                onClick={() => {
                                  act('move_up_queue', { 'index': item.ind });
                                }}
                              />
                            </Stack.Item>
                          )}
                          {item.ind < queue.length && (
                            <Stack.Item>
                              <Button
                                icon="arrow-down"
                                onClick={() => {
                                  act('move_down_queue', { 'index': item.ind });
                                }}
                              />
                            </Stack.Item>
                          )}
                          <Stack.Item>
                            <Button
                              icon="times"
                              onClick={() => {
                                act('remove_from_queue', { 'index': item.ind });
                              }}
                            />
                          </Stack.Item>
                          <Stack.Item>
                            <Box
                              as="img"
                              width="24px"
                              height="24px"
                              src={item.icon}
                              style={{
                                '-ms-interpolation-mode': 'nearest-neighbor',
                                'vertical-align': 'middle',
                                'object-fit': 'cover',
                                'margin': '4px',
                                'background-color': 'black',
                                'border': '1px solid #3e6189',
                              }}
                            />
                          </Stack.Item>
                        </Stack>
                      </Stack.Item>
                    ))}
                  </Stack>
                </Section>
              </Stack.Item>
            </Stack>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
