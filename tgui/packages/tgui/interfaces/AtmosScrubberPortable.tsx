import { useBackend } from 'tgui/backend';
import {
  AnimatedNumber,
  Box,
  Button,
  LabeledList,
  ProgressBar,
  Section,
  Stack,
} from 'tgui/components';
import { formatPressureKpa } from 'tgui/format';
import { Window } from 'tgui/layouts';
import { formatPower } from 'tgui-core/format';
import { round } from 'tgui-core/math';
import { BooleanLike } from 'tgui-core/react';

import { PortConnector, PressureRegulator } from './common/AtmosComponents';

enum PumpDirection {
  Siphon = 0,
  Release = 1,
}

type Data = {
  on: BooleanLike;
  connected: BooleanLike;
  pressure: number;
  rate: number;
  defaultRate: number;
  minRate: number;
  maxRate: number;
  powerDraw: number;
  cell: {
    charge: number;
    maxCharge: number;
  } | null;
  holding: {
    name: string;
    pressure: number;
  } | null;
};

export const AtmosScrubberPortable = (props) => {
  const { act, data } = useBackend<Data>();

  const {
    on,
    connected,
    pressure,
    rate,
    defaultRate,
    minRate,
    maxRate,
    powerDraw,
    cell,
    holding,
  } = data;

  return (
    <Window width={300} height={400}>
      <Window.Content>
        <Section title="Status">
          <LabeledList>
            <LabeledList.Item label="Pressure">
              <AnimatedNumber
                value={pressure}
                format={(f) => formatPressureKpa(round(f, 2))}
              />
            </LabeledList.Item>
            <LabeledList.Item label="Port" verticalAlign="middle">
              <PortConnector connected={connected} />
            </LabeledList.Item>
            <LabeledList.Item label="Load">
              <AnimatedNumber
                value={powerDraw}
                format={(val) => formatPower(round(val, 2))}
              />
            </LabeledList.Item>
            <LabeledList.Item label="Cell">
              {cell ? (
                <ProgressBar
                  value={cell.charge}
                  maxValue={cell.maxCharge}
                  ranges={{
                    good: [cell.maxCharge * 0.5, Number.POSITIVE_INFINITY],
                    average: [cell.maxCharge * 0.25, cell.maxCharge * 0.5],
                    bad: [Number.NEGATIVE_INFINITY, cell.maxCharge * 0.25],
                  }}
                >
                  {cell.charge} / {cell.maxCharge}
                </ProgressBar>
              ) : (
                <Box color="bad">No Cell Installed</Box>
              )}
            </LabeledList.Item>
          </LabeledList>
        </Section>
        <Section
          title="Holding Tank"
          buttons={
            <Button
              icon="eject"
              disabled={!holding}
              onClick={() => act('remove_tank')}
            >
              Eject
            </Button>
          }
        >
          {holding ? (
            <LabeledList>
              <LabeledList.Item label="Tank Label">
                {holding.name}
              </LabeledList.Item>
              <LabeledList.Item label="Pressure">
                {formatPressureKpa(round(holding.pressure, 2))}
              </LabeledList.Item>
            </LabeledList>
          ) : (
            <Box color="average">No Tank Inserted</Box>
          )}
        </Section>
        <Section title="Power Regulator">
          <Stack align="flex-start" justify="space-around">
            <Stack.Item>
              <Stack vertical align="center">
                <Stack.Item color="label">Power</Stack.Item>
                <Stack.Item>
                  <Button
                    fontSize={1.25}
                    icon="power-off"
                    selected={on}
                    onClick={() => act('power')}
                  >
                    {on ? 'On' : 'Off'}
                  </Button>
                </Stack.Item>
              </Stack>
            </Stack.Item>
            <Stack.Item>
              <PressureRegulator
                highlightRing=""
                pressure={rate}
                minPressure={minRate}
                maxPressure={maxRate}
                onChange={(e, volume) => act('set_volume', { volume })}
                onDefault={() => act('set_volume', { volume: defaultRate })}
                onMax={() => act('set_volume', { volume: maxRate })}
                unit="L/s"
                format={(val) => `${round(val, 2)} L/s`}
              />
            </Stack.Item>
          </Stack>
        </Section>
      </Window.Content>
    </Window>
  );
};
