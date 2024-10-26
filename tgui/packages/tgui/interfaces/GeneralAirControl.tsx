import { useBackend } from 'tgui/backend';
import { Button } from 'tgui/components';
import { Window } from 'tgui/layouts';
import {
  AnimatedNumber,
  Box,
  LabeledList,
  Section,
} from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';

export type SensorGasInfo = {
  oxygen: number | null;
  plasma: number | null;
  nitrogen: number | null;
  carbon_dioxide: number | null;
};

export type Sensor = {
  long_name: string;
  pressure: number | null;
  temperature: number | null;
  gas: SensorGasInfo;
};

export type Data = {
  sensors: Sensor[];
  waiting_on_signal: BooleanLike;
};

export const GeneralAirControl = (props) => {
  const { act, data } = useBackend<Data>();

  return (
    <Window width={350} height={230}>
      <Window.Content>
        <Sensors />
      </Window.Content>
    </Window>
  );
};

const anyGasPresent = (gas: SensorGasInfo) => {
  return (
    gas.oxygen !== null ||
    gas.plasma !== null ||
    gas.nitrogen !== null ||
    gas.carbon_dioxide !== null
  );
};

export const Sensors = (props) => {
  const { data } = useBackend<Data>();

  const { sensors, waiting_on_signal } = data;

  return (
    <Section
      title="Sensor Data"
      buttons={
        !!waiting_on_signal && (
          <Button
            color="transparent"
            icon="sync"
            iconSpin
            tooltip="Waiting on return signal..."
          />
        )
      }
    >
      {sensors && sensors.length > 0 ? (
        sensors.map((sensor) => (
          <Section title={sensor.long_name} key={sensor.long_name}>
            <LabeledList>
              <LabeledList.Item label="Pressure">
                {sensor.pressure !== null ? (
                  <AnimatedNumber value={sensor.pressure} />
                ) : (
                  'UNK'
                )}{' '}
                kPa
              </LabeledList.Item>
              <LabeledList.Item label="Temperature">
                {sensor.temperature !== null ? (
                  <AnimatedNumber value={sensor.temperature} />
                ) : (
                  'UNK'
                )}{' '}
                K
              </LabeledList.Item>
              <LabeledList.Item label="Gas Composition">
                {!anyGasPresent(sensor.gas) && (
                  <Box color="average">Unavailable</Box>
                )}
                {sensor.gas.oxygen !== null && (
                  <Box>
                    <AnimatedNumber value={sensor.gas.oxygen} />% O2
                  </Box>
                )}
                {sensor.gas.nitrogen !== null && (
                  <Box>
                    <AnimatedNumber value={sensor.gas.nitrogen} />% N
                  </Box>
                )}
                {sensor.gas.carbon_dioxide !== null && (
                  <Box color="average">
                    <AnimatedNumber value={sensor.gas.carbon_dioxide} />% CO2
                  </Box>
                )}
                {sensor.gas.plasma !== null && (
                  <Box color="average">
                    <AnimatedNumber value={sensor.gas.plasma} />% TX
                  </Box>
                )}
              </LabeledList.Item>
            </LabeledList>
          </Section>
        ))
      ) : (
        <Box color="average">No Sensors Detected</Box>
      )}
    </Section>
  );
};
