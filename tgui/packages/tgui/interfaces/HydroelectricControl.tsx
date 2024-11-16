import { useBackend } from 'tgui/backend';
import { Button } from 'tgui/components';
import { Window } from 'tgui/layouts';
import {
  AnimatedNumber,
  Box,
  LabeledList,
  ProgressBar,
  Section,
  Stack,
} from 'tgui-core/components';
import { formatPower } from 'tgui-core/format';
import { BooleanLike } from 'tgui-core/react';

type Data = {
  waterheld: number;
  watermax: number;
  hydrostatus: string;
  is_open: BooleanLike;
  generated: number;
};

export const HydroelectricControl = (props) => {
  const { act, data } = useBackend<Data>();

  const { waterheld, watermax, hydrostatus, is_open, generated } = data;

  return (
    <Window width={350} height={300}>
      <Window.Content>
        <Section title="Stored Capacity">
          <ProgressBar value={waterheld} maxValue={watermax} />
          <Section title="Flood Gates">
            <Stack mt={1} align="center" justify="center">
              <Stack.Item basis="50%">
                <Button
                  fluid
                  textAlign="center"
                  selected={is_open}
                  fontSize={1.2}
                  icon={is_open ? 'door-open' : 'door-closed'}
                  onClick={() => act('togglegate')}
                >
                  {is_open ? 'Opened' : 'Closed'}
                </Button>
              </Stack.Item>
            </Stack>
          </Section>
        </Section>
        <Section
          title="Turbines"
          buttons={
            <Button
              icon="search"
              tooltip="Detect Connected Turbines"
              onClick={() => act('detect_turbines')}
            />
          }
        >
          <Box color="label" fontSize={1.2} mb={1}>
            {hydrostatus}
          </Box>
          <LabeledList>
            <LabeledList.Item label="Generated Power">
              <AnimatedNumber
                value={generated}
                format={(val) => formatPower(val)}
              />
            </LabeledList.Item>
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
