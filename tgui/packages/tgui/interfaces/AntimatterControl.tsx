import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import {
  AnimatedNumber,
  Button,
  Knob,
  LabeledList,
  ProgressBar,
  Section,
  Stack,
} from 'tgui-core/components';
import { formatPower } from 'tgui-core/format';
import { BooleanLike } from 'tgui-core/react';

type Data = {
  active: BooleanLike;
  instability: number;
  linked_shielding: number;
  cores: number;
  efficiency: number;
  stability: number;
  stored_power: number;
  fuel: number | null;
  fuel_max: number;
  fuel_injection: number;
};

export const AntimatterControl = (props) => {
  const { act, data } = useBackend<Data>();
  const {
    active,
    instability,
    linked_shielding,
    cores,
    efficiency,
    stability,
    stored_power,
    fuel,
    fuel_max,
    fuel_injection,
  } = data;

  return (
    <Window width={420} height={500}>
      <Window.Content>
        <Section
          title="Antimatter Control Panel"
          buttons={
            <Button
              color="average"
              icon="shield-alt"
              tooltip="Force Shielding Update"
              onClick={() => act('refreshicons')}
            />
          }
        >
          <Stack align="center" justify="space-between">
            <Stack.Item basis="70%">
              <Button
                fluid
                icon="power-off"
                color={active ? 'bad' : 'good'}
                fontSize={2}
                mb={2}
                onClick={() => act('togglestatus')}
              >
                {active ? 'Power Off' : 'Power On'}
              </Button>
            </Stack.Item>
            <Stack.Item basis="30%">
              <Stack vertical align="center">
                <Stack.Item>
                  <Knob
                    step={1}
                    stepPixelSize={6}
                    value={fuel_injection}
                    minValue={0}
                    maxValue={cores * 4}
                    size={2}
                    onChange={(e, value) =>
                      act('set_fuel_injection', { value: value })
                    }
                  />
                </Stack.Item>
                <Stack.Item>
                  <AnimatedNumber value={fuel_injection} /> units/sec
                </Stack.Item>
              </Stack>
            </Stack.Item>
          </Stack>
          <LabeledList>
            <LabeledList.Item label="Status" color={active ? 'good' : 'grey'}>
              {active ? 'Injecting' : 'Standby'}
            </LabeledList.Item>
            <LabeledList.Divider />
            <LabeledList.Item label="Instability">
              <AnimatedNumber value={instability} />%
            </LabeledList.Item>
            <LabeledList.Item label="Reactor parts">
              {linked_shielding}
            </LabeledList.Item>
            <LabeledList.Item label="Cores">{cores}</LabeledList.Item>
            <LabeledList.Divider />
            <LabeledList.Item label="Current Efficiency">
              <AnimatedNumber value={efficiency} />
            </LabeledList.Item>
            <LabeledList.Item
              label="Average Stability"
              buttons={
                <Button
                  color="average"
                  icon="bug"
                  onClick={() => act('refreshstability')}
                >
                  Check Stability
                </Button>
              }
            >
              <AnimatedNumber value={stability} />
            </LabeledList.Item>
            <LabeledList.Item label="Last Produced">
              {formatPower(stored_power)}
            </LabeledList.Item>
          </LabeledList>
          <Section
            title="Fuel"
            mt={2}
            buttons={
              fuel !== null && (
                <Button icon="eject" onClick={() => act('ejectjar')}>
                  Eject Container
                </Button>
              )
            }
          >
            {fuel === null ? (
              'No fuel receptacle detected.'
            ) : (
              <LabeledList>
                <LabeledList.Item label="Fuel">
                  <ProgressBar
                    value={fuel}
                    maxValue={fuel_max}
                    ranges={{
                      good: [fuel_max * 0.75, fuel_max],
                      average: [fuel_max * 0.25, fuel_max * 0.75],
                      bad: [0, fuel_max * 0.25],
                    }}
                  />
                </LabeledList.Item>
              </LabeledList>
            )}
          </Section>
        </Section>
      </Window.Content>
    </Window>
  );
};
