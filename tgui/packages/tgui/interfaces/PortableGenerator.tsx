import { useBackend } from 'tgui/backend';
import { Button } from 'tgui/components';
import { Window } from 'tgui/layouts';
import {
  Box,
  LabeledList,
  NoticeBox,
  ProgressBar,
  Section,
} from 'tgui-core/components';
import { formatPower } from 'tgui-core/format';
import { round } from 'tgui-core/math';
import { BooleanLike } from 'tgui-core/react';

type Data = {
  active: BooleanLike;
  is_ai: BooleanLike;
  fuel_is_reagent: BooleanLike;
  fuel_type: string;
  fuel_stored: number;
  fuel_capacity: number;
  fuel_usage: number;
  anchored: BooleanLike;
  connected: BooleanLike;
  ready_to_boot: BooleanLike;
  power_generated: number;
  max_power_output: number;
  power_output: number;
  unsafe_output: BooleanLike;
  power_available: number;
  temperature_current: number;
  temperature_max: number;
  temperature_overheat: BooleanLike;
};

export const PortableGenerator = (props) => {
  const { act, data } = useBackend<Data>();

  const {
    active,
    is_ai,
    fuel_is_reagent,
    fuel_type,
    fuel_stored,
    fuel_capacity,
    fuel_usage,
    anchored,
    connected,
    ready_to_boot,
    power_generated,
    max_power_output,
    power_output,
    unsafe_output,
    power_available,
    temperature_current,
    temperature_max,
    temperature_overheat,
  } = data;

  const stack_percent = fuel_stored / fuel_capacity;
  const stackPercentState =
    (stack_percent >= 0.5 && 'good') ||
    (stack_percent > 0.15 && 'average') ||
    'bad';

  return (
    <Window width={400} height={280}>
      <Window.Content>
        {!anchored && (
          <NoticeBox>Generator must be anchored to operate.</NoticeBox>
        )}
        <Section
          title="Status"
          buttons={
            <Button
              icon="power-off"
              onClick={() => act('toggle_power')}
              selected={active}
              disabled={!ready_to_boot}
            >
              {active ? 'Stop' : 'Start'}
            </Button>
          }
        >
          <LabeledList>
            <LabeledList.Item label="Current fuel level">
              <ProgressBar
                value={fuel_stored / fuel_capacity}
                ranges={{
                  good: [0.5, Infinity],
                  average: [0.15, 0.5],
                  bad: [-Infinity, 0.15],
                }}
              >
                {fuel_is_reagent ? (
                  <>
                    {round(fuel_stored / 1000, 1)}u / {fuel_capacity / 1000}u
                  </>
                ) : (
                  <>
                    {round(fuel_stored, 1)}cm&sup3; / {fuel_capacity}cm&sup3;
                  </>
                )}
              </ProgressBar>
            </LabeledList.Item>
            <LabeledList.Item
              label="Fuel Type"
              buttons={
                fuel_stored >= 1 && (
                  <Button
                    ml={1}
                    icon="eject"
                    disabled={active || is_ai}
                    onClick={() => act('eject')}
                  >
                    Eject
                  </Button>
                )
              }
            >
              {fuel_is_reagent ? (
                <Box color={stackPercentState}>
                  {round(fuel_stored / 1000, 1)}u {fuel_type}
                </Box>
              ) : (
                <Box color={stackPercentState}>
                  {round(fuel_stored, 1)}cm&sup3; {fuel_type}
                </Box>
              )}
            </LabeledList.Item>
            <LabeledList.Item label="Fuel Usage">
              {fuel_is_reagent ? (
                <>{round(fuel_usage, 3) / 1000}L/s</>
              ) : (
                <>{round(fuel_usage, 3)} cm&sup3;/s</>
              )}
            </LabeledList.Item>
            <LabeledList.Item label="Temperature">
              <ProgressBar
                value={temperature_current}
                maxValue={temperature_max + 30}
                color={temperature_overheat ? 'bad' : 'good'}
              >
                {round(temperature_current, 1)}&deg;C
              </ProgressBar>
            </LabeledList.Item>
          </LabeledList>
        </Section>
        <Section title="Output">
          <LabeledList>
            <LabeledList.Item
              label="Current output"
              color={unsafe_output ? 'bad' : ''}
              buttons={
                <>
                  <Button icon="minus" onClick={() => act('lower_power')} />
                  <Button icon="plus" onClick={() => act('higher_power')} />
                </>
              }
            >
              {power_output / power_generated} / {max_power_output} (
              {formatPower(power_output)})
            </LabeledList.Item>
            <LabeledList.Item label="Power available">
              <Box inline color={!connected && 'bad'}>
                {connected ? formatPower(power_available) : 'Unconnected'}
              </Box>
            </LabeledList.Item>
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
