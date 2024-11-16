import { round } from 'common/math';
import { BooleanLike } from 'common/react';
import { AnimatedNumber, Button, Icon, Knob, Stack } from 'tgui/components';
import { formatPressureKpa } from 'tgui/format';

export type PortConnectorProps = {
  connected: BooleanLike;
};

export const PortConnector = (props: PortConnectorProps) => {
  const { connected } = props;

  return (
    <Stack align="center">
      <Stack.Item mt={connected ? 0 : 0.3}>
        <Icon
          color={connected ? 'good' : 'bad'}
          name={connected ? 'plug' : 'times'}
          size={1.25}
        />
      </Stack.Item>
      <Stack.Item color={connected ? 'good' : 'bad'}>
        {connected ? 'Connected' : 'Disconnected'}
      </Stack.Item>
    </Stack>
  );
};

export type PressureRegulatorProps = {
  highlightRing: string;
  pressure: number;
  minPressure: number;
  maxPressure: number;
  onChange: (event: Event, value: number) => void;
  onMax: () => void;
  onDefault: () => void;
  unit?: string;
  format?: (val: number) => string;
};

export const PressureRegulator = (props: PressureRegulatorProps) => {
  const {
    highlightRing,
    pressure,
    minPressure,
    maxPressure,
    onChange,
    onMax,
    onDefault,
    unit = 'kPa',
    format = (val) => formatPressureKpa(round(val, 2)),
  } = props;

  return (
    <Stack vertical align="center">
      <Stack.Item color="label">Regulator</Stack.Item>
      <Stack.Item>
        <Stack>
          <Stack.Item>
            <Knob
              className="Canister--knob"
              size={1.25}
              color={highlightRing}
              value={pressure}
              // Specifying this here makes it only update when they actually submit the change, subtly highlights
              // distinction between client and server state
              fillValue={pressure}
              minValue={minPressure}
              maxValue={maxPressure}
              unit={unit}
              stepPixelSize={1}
              onChange={onChange}
            />
          </Stack.Item>
          <Stack.Item>
            <Stack vertical>
              <Stack.Item mb={-1}>
                <Button
                  fluid
                  color="transparent"
                  icon="fast-forward"
                  tooltip="Set to max"
                  onClick={onMax}
                />
              </Stack.Item>
              <Stack.Item>
                <Button
                  fluid
                  color="transparent"
                  icon="undo"
                  tooltip="Reset to default"
                  onClick={onDefault}
                />
              </Stack.Item>
            </Stack>
          </Stack.Item>
        </Stack>
      </Stack.Item>
      <Stack.Item>
        <AnimatedNumber value={pressure} format={format} />
      </Stack.Item>
    </Stack>
  );
};
