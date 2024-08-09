import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import {
  AnimatedNumber,
  Button,
  Knob,
  LabeledControls,
  LabeledList,
  Section,
  Slider,
  Stack,
} from 'tgui-core/components';
import { round } from 'tgui-core/math';
import { BooleanLike } from 'tgui-core/react';

type Data = {
  on: BooleanLike;
  gasPressure: number;
  gasTemperature: number;
  minGasTemperature: number;
  maxGasTemperature: number;
  targetGasTemperature: number;
  powerSetting: number;
  gasTemperatureClass: string;
};

export const GasTemperatureControl = (props) => {
  const { act, data } = useBackend<Data>();

  const {
    on,
    gasPressure,
    gasTemperature,
    minGasTemperature,
    maxGasTemperature,
    targetGasTemperature,
    powerSetting,
    gasTemperatureClass,
  } = data;

  return (
    <Window width={280} height={290}>
      <Window.Content>
        <Section
          title="Controls"
          buttons={
            <Button
              icon="power-off"
              selected={on}
              onClick={() => act('toggleStatus')}
            >
              {on ? 'On' : 'Off'}
            </Button>
          }
        >
          <LabeledControls justify="space-around">
            <LabeledControls.Item label="Power Level">
              <Stack vertical>
                <Stack.Item>
                  <Knob
                    size={1.5}
                    minValue={0}
                    maxValue={100}
                    value={powerSetting}
                    format={(val) => `${val}%`}
                    onChange={(e, val) => act('setPower', { setPower: val })}
                  />
                </Stack.Item>
                <Stack.Item>{powerSetting}%</Stack.Item>
              </Stack>
            </LabeledControls.Item>
            <LabeledControls.Item label="Gas Pressure">
              <AnimatedNumber
                value={gasPressure}
                format={(val) => `${round(val, 2)} kPa`}
              />
            </LabeledControls.Item>
          </LabeledControls>
        </Section>
        <Section title="Gas Temperature">
          <LabeledList>
            <LabeledList.Item label="Current Temperature">
              <AnimatedNumber
                value={gasTemperature}
                format={(val) => `${round(val, 2)} K`}
              />
            </LabeledList.Item>
            <LabeledList.Item label="Target Temperature">
              <AnimatedNumber
                value={targetGasTemperature}
                format={(val) => `${round(val, 2)} K`}
              />
            </LabeledList.Item>
          </LabeledList>
          <Slider
            mt={1}
            color={gasTemperatureClass}
            value={targetGasTemperature}
            minValue={minGasTemperature}
            maxValue={maxGasTemperature}
            fillValue={gasTemperature}
            onChange={(e, temp) => act('temp', { temp })}
          >
            <AnimatedNumber
              value={gasTemperature}
              format={(val) => round(val, 2).toString()}
            />{' '}
            /{' '}
            <AnimatedNumber
              value={targetGasTemperature}
              format={(val) => round(val, 2).toString()}
            />{' '}
            K
          </Slider>
        </Section>
      </Window.Content>
    </Window>
  );
};
