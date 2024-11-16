import { useEffect, useState } from 'react';
import { useBackend } from 'tgui/backend';
import { formatPower } from 'tgui/format';
import { Window } from 'tgui/layouts';
import {
  AnimatedNumber,
  Box,
  Divider,
  Icon,
  LabeledList,
  NoticeBox,
  ProgressBar,
  Section,
  Stack,
} from 'tgui-core/components';
import { round } from 'tgui-core/math';
import { BooleanLike } from 'tgui-core/react';

export type CirculatorData = {
  dir: string;
  output: number;
  flowCapacity: number;
  inletPressure: number;
  inletTemperature: number;
  outletPressure: number;
  outletTemperature: number;
};

type Data = {
  totalOutput: number;
  maxTotalOutput: number;
  thermalOutput: number;
  circConnected: BooleanLike;
  primary: CirculatorData | null;
  secondary: CirculatorData | null;
};

export const ThermoelectricGenerator = (props) => {
  const { act, data } = useBackend<Data>();

  const {
    totalOutput,
    maxTotalOutput,
    thermalOutput,
    circConnected,
    primary,
    secondary,
  } = data;

  return (
    <Window width={500} height={360}>
      <Window.Content>
        <Section title="Output">
          <LabeledList>
            <LabeledList.Item label="Total Output">
              <ProgressBar value={totalOutput} maxValue={maxTotalOutput}>
                <AnimatedNumber
                  value={totalOutput}
                  format={(val) => formatPower(val)}
                />
              </ProgressBar>
            </LabeledList.Item>
            <LabeledList.Item label="Thermal Output">
              <AnimatedNumber
                value={thermalOutput}
                format={(val) => formatPower(val)}
              />
            </LabeledList.Item>
          </LabeledList>
        </Section>
        {circConnected ? (
          <Stack>
            {primary && (
              <Stack.Item grow>
                <Circulator name="Primary Circulator" circulator={primary} />
              </Stack.Item>
            )}
            {secondary && (
              <Stack.Item grow>
                <Circulator
                  name="Secondary Circulator"
                  circulator={secondary}
                />
              </Stack.Item>
            )}
          </Stack>
        ) : (
          <NoticeBox danger>
            ERROR: Both circulators must be connected!
          </NoticeBox>
        )}
      </Window.Content>
    </Window>
  );
};

export type CirculatorProps = {
  circulator: CirculatorData;
  name: string;
};

export const Circulator = (props: CirculatorProps) => {
  const { config } = useBackend();
  const { circulator, name } = props;

  return (
    <Section title={`${name} (${circulator.dir})`}>
      <Stack justify="space-around" align="center">
        <Stack.Item>
          {config.window.toaster ? (
            <Icon
              size={4}
              name="fan"
              spin={circulator.flowCapacity > 0}
              color={
                circulator.flowCapacity > 80
                  ? 'good'
                  : circulator.flowCapacity > 50
                    ? 'average'
                    : 'bad'
              }
            />
          ) : (
            <CirculatorFanSpinner value={circulator.flowCapacity} />
          )}
        </Stack.Item>
        <Stack.Item>
          <Box color="label" fontSize={1.2}>
            Flow Capacity
          </Box>
          <Box>
            <AnimatedNumber
              value={circulator.flowCapacity}
              format={(val) => round(val, 2) + '%'}
            />
          </Box>
        </Stack.Item>
      </Stack>
      <Divider />
      <LabeledList>
        <LabeledList.Item label="Turbine Output">
          <AnimatedNumber
            value={circulator.output}
            format={(val) => formatPower(val)}
          />
        </LabeledList.Item>
        <LabeledList.Item label="Inlet Pressure">
          <AnimatedNumber
            value={circulator.inletPressure}
            format={(val) => `${round(val, 2)} kPa`}
          />
        </LabeledList.Item>
        <LabeledList.Item label="Inlet Temperature">
          <AnimatedNumber
            value={circulator.inletTemperature}
            format={(val) => `${round(val, 1)} K`}
          />
        </LabeledList.Item>
        <LabeledList.Item label="Outlet Pressure">
          <AnimatedNumber
            value={circulator.outletPressure}
            format={(val) => `${round(val, 2)} kPa`}
          />
        </LabeledList.Item>
        <LabeledList.Item label="Outlet Temperature">
          <AnimatedNumber
            value={circulator.outletTemperature}
            format={(val) => `${round(val, 1)} K`}
          />
        </LabeledList.Item>
      </LabeledList>
    </Section>
  );
};

const CirculatorFanSpinner = (props: { value: number }) => {
  const { value } = props;
  const [rotation, setRotation] = useState(0);

  const SPEED_MULTIPLIER = 0.2;
  const FLOW_MODIFIER = 4;
  const STEP_SIZE = 4;

  useEffect(() => {
    const id = setInterval(
      () => {
        setRotation((rot) => (rot + STEP_SIZE) % 359);
      },
      SPEED_MULTIPLIER * (100 * FLOW_MODIFIER - value * FLOW_MODIFIER),
    );
    return () => clearInterval(id);
  }, [value]);

  return (
    <Icon
      rotation={rotation}
      size={4}
      name="fan"
      color={value > 80 ? 'good' : value > 50 ? 'average' : 'bad'}
    />
  );
};
