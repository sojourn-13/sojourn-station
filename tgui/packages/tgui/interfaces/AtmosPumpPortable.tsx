import { useBackend } from 'tgui/backend';
import { formatPressureKpa } from 'tgui/format';
import { Window } from 'tgui/layouts';
import {
  AnimatedNumber,
  Box,
  Button,
  LabeledList,
  ProgressBar,
  Section,
  Stack,
} from 'tgui-core/components';
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
  pumpDir: PumpDirection;
  targetpressure: number;
  defaultPressure: number;
  minPressure: number;
  maxPressure: number;
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

export const AtmosPumpPortable = (props) => {
  const { act, data } = useBackend<Data>();

  const {
    on,
    connected,
    pressure,
    pumpDir,
    targetpressure,
    defaultPressure,
    minPressure,
    maxPressure,
    powerDraw,
    cell,
    holding,
  } = data;

  return (
    <Window width={340} height={400}>
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
              <Stack vertical align="center">
                <Stack.Item color="label">Pump Direction</Stack.Item>
                <Stack.Item>
                  <Button
                    fontSize={1.25}
                    icon={pumpDir === PumpDirection.Release ? 'wind' : 'fan'}
                    onClick={() => act('direction')}
                    color={
                      pumpDir === PumpDirection.Release ? 'good' : 'average'
                    }
                  >
                    {pumpDir === PumpDirection.Release ? 'Out' : 'In'}
                  </Button>
                </Stack.Item>
              </Stack>
            </Stack.Item>
            <Stack.Item>
              <PressureRegulator
                highlightRing=""
                pressure={targetpressure}
                minPressure={minPressure}
                maxPressure={maxPressure}
                onChange={(e, pressure) => act('set_pressure', { pressure })}
                onDefault={() =>
                  act('set_pressure', { pressure: defaultPressure })
                }
                onMax={() => act('set_pressure', { pressure: maxPressure })}
              />
            </Stack.Item>
          </Stack>
        </Section>
      </Window.Content>
    </Window>
  );
};
