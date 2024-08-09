import { useBackend } from 'tgui/backend';
import { Button } from 'tgui/components';
import { Window } from 'tgui/layouts';
import { Box, Flex, Knob, LabeledList, Section } from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';

enum OreAction {
  Storing = 0,
  Smelting = 1,
  Compressing = 2,
  Alloying = 3,
}

type Ore = {
  name: string;
  id: string;
  amount: number;
  current_action: OreAction;
  current_action_string: string;
};

type Alloy = {
  name: string;
  creating: BooleanLike;
};

type Data = {
  materials_data: Ore[];
  alloy_data: Alloy[];
  currently_alloying: string;
  running: BooleanLike;
  sheet_rate: number;
  machine: BooleanLike;
};

export const Processor = (props) => {
  const { act, data } = useBackend<Data>();
  // Extract `health` and `color` variables from the `data` object.
  const {
    materials_data = [],
    alloy_data = [],
    currently_alloying,
    running,
    sheet_rate,
    machine,
  } = data;
  if (machine) {
    return (
      <Window>
        <Window.Content scrollable>
          <Flex frex-wrap="wrap">
            <Flex.Item>
              <Button
                onClick={() => act('set_running')}
                width={5}
                height={5}
                mb={2}
                color={running ? 'green' : 'red'}
                icon="power-off"
                fontSize={2}
                tooltipPosition="right"
                tooltip={running ? 'Turn off' : 'Turn on'}
                verticalAlignContent="middle"
                textAlign="center"
              />
              <Box>
                <Knob
                  size={2}
                  minValue={5}
                  maxValue={30}
                  value={sheet_rate}
                  unit="Sheets"
                  step={1}
                  stepPixelSize={2}
                  onDrag={(e, value) =>
                    act('set_rate', {
                      sheets: value,
                    })
                  }
                />
                <br />
                <center>Melting Rate</center>
              </Box>
            </Flex.Item>
            <Flex.Item>
              <Section title="Loaded Materials">
                <LabeledList>
                  {materials_data.map((material) => (
                    <LabeledList.Item
                      key={material.name}
                      label={material.name}
                      buttons={
                        <Button
                          key={material.name}
                          onClick={() =>
                            act('set_smelting', {
                              id: material.id,
                              action_type: material.current_action + 1,
                            })
                          }
                        >
                          {material.current_action_string}
                        </Button>
                      }
                    >
                      {material.amount}
                    </LabeledList.Item>
                  ))}
                </LabeledList>
              </Section>
              <Section title="Alloy Menu">
                <LabeledList>
                  {alloy_data.map((alloy) => (
                    <LabeledList.Item
                      key={alloy.name}
                      label={alloy.name}
                      buttons={
                        <Button
                          key={alloy.name}
                          selected={alloy.name === currently_alloying}
                          onClick={() =>
                            act('set_alloying', {
                              id: alloy.name,
                            })
                          }
                        >
                          {alloy.name}
                        </Button>
                      }
                    />
                  ))}
                </LabeledList>
              </Section>
            </Flex.Item>
          </Flex>
        </Window.Content>
      </Window>
      // Incase theres no machine
    );
  } else {
    <Window>
      <Window.Content>
        No machine linked! There must be a material processor within 3 tiles for
        the wireless link to connect.
        <Button onClick={() => act('machine_link')}>Attempt linking</Button>
      </Window.Content>
    </Window>;
  }
};
