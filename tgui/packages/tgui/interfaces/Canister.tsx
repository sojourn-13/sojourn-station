import { toFixed } from 'common/math';
import { BooleanLike } from 'common/react';
import { useBackend } from 'tgui/backend';
import {
  AnimatedNumber,
  Box,
  Button,
  Icon,
  Knob,
  LabeledList,
  Section,
  Stack,
} from 'tgui/components';
import { formatSiUnit } from 'tgui/format';
import { Window } from 'tgui/layouts';

type Data = {
  connected: BooleanLike;
  canLabel: BooleanLike;
  pressure: number;
  releasePressure: number;
  defaultReleasePressure: number;
  minReleasePressure: number;
  maxReleasePressure: number;
  valveOpen: BooleanLike;
  holding: {
    name: string;
    pressure: number;
  } | null;
};

export const Canister = (props) => {
  const { act, data } = useBackend<Data>();
  const { connected, canLabel, pressure, valveOpen, holding } = data;
  return (
    <Window width={280} height={260}>
      <Window.Content>
        <Section
          title="Canister"
          buttons={
            <Button
              icon="pencil-alt"
              disabled={!canLabel}
              onClick={() => act('relabel')}
              tooltip={canLabel ? '' : 'This canister cannot be relabeled.'}
              tooltipPosition="bottom"
            >
              Relabel
            </Button>
          }
        >
          <Stack align="center">
            <Stack.Item>
              <LabeledList>
                <LabeledList.Item label="Pressure">
                  <AnimatedNumber
                    value={pressure}
                    format={(value) => {
                      if (value < 10000) {
                        return toFixed(value) + ' kPa';
                      }
                      return formatSiUnit(value * 1000, 1, 'Pa');
                    }}
                  />
                </LabeledList.Item>
                <LabeledList.Item label="Port" verticalAlign="middle">
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
                </LabeledList.Item>
                <LabeledList.Item label="Valve">
                  {holding ? (
                    <Button
                      color="average"
                      icon={valveOpen ? 'wind' : 'tint-slash'}
                      onClick={() => act('valve')}
                    >
                      {valveOpen ? 'Open' : 'Closed'}
                    </Button>
                  ) : (
                    <Button.Confirm
                      color="bad"
                      icon={valveOpen ? 'wind' : 'tint-slash'}
                      onClick={() => act('valve')}
                    >
                      {valveOpen ? 'Open' : 'Closed'}
                    </Button.Confirm>
                  )}
                </LabeledList.Item>
              </LabeledList>
            </Stack.Item>
            <Stack.Item>
              <Regulator />
            </Stack.Item>
          </Stack>
        </Section>
        <Section
          title="Holding Tank"
          buttons={
            !!holding && (
              <Button
                icon="eject"
                color={valveOpen && 'danger'}
                onClick={() => act('eject')}
              >
                Eject
              </Button>
            )
          }
        >
          {!!holding && (
            <LabeledList>
              <LabeledList.Item label="Label">{holding.name}</LabeledList.Item>
              <LabeledList.Item label="Pressure">
                <AnimatedNumber value={holding.pressure} /> kPa
              </LabeledList.Item>
            </LabeledList>
          )}
          {!holding && <Box color="average">No Holding Tank</Box>}
        </Section>
      </Window.Content>
    </Window>
  );
};

export const Regulator = (props) => {
  const { act, data } = useBackend<Data>();

  const {
    valveOpen,
    releasePressure,
    minReleasePressure,
    maxReleasePressure,
    defaultReleasePressure,
  } = data;

  return (
    <Stack vertical align="center">
      <Stack.Item color="label">Regulator</Stack.Item>
      <Stack.Item>
        <Stack>
          <Stack.Item mr={-1}>
            <Knob
              className="Canister--knob"
              size={1.25}
              mr={1}
              color={!!valveOpen && 'yellow'}
              value={releasePressure}
              fillValue={releasePressure}
              unit="kPa"
              minValue={minReleasePressure}
              maxValue={maxReleasePressure}
              stepPixelSize={1}
              onChange={(e, pressure) =>
                act('pressure', {
                  pressure,
                })
              }
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
                  onClick={() =>
                    act('pressure', {
                      pressure: maxReleasePressure,
                    })
                  }
                />
              </Stack.Item>
              <Stack.Item>
                <Button
                  fluid
                  color="transparent"
                  icon="undo"
                  tooltip="Reset to default"
                  onClick={() =>
                    act('pressure', {
                      pressure: defaultReleasePressure,
                    })
                  }
                />
              </Stack.Item>
            </Stack>
          </Stack.Item>
        </Stack>
      </Stack.Item>
      <Stack.Item>
        <AnimatedNumber
          value={releasePressure}
          format={(value) => {
            if (value < 10000) {
              return toFixed(value) + ' kPa';
            }
            return formatSiUnit(value * 1000, 1, 'Pa');
          }}
        />
      </Stack.Item>
    </Stack>
  );
};
