import { useBackend } from 'tgui/backend';
import { formatPressureKpa } from 'tgui/format';
import { Window } from 'tgui/layouts';
import {
  AnimatedNumber,
  Box,
  Button,
  LabeledList,
  Section,
  Stack,
} from 'tgui-core/components';
import { round } from 'tgui-core/math';
import { BooleanLike } from 'tgui-core/react';

import { PortConnector, PressureRegulator } from './common/AtmosComponents';

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
                    format={(value) => formatPressureKpa(round(value, 2))}
                  />
                </LabeledList.Item>
                <LabeledList.Item label="Port" verticalAlign="middle">
                  <PortConnector connected={connected} />
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
              <PressureRegulator
                highlightRing={valveOpen ? 'yellow' : ''}
                pressure={data.releasePressure}
                minPressure={data.minReleasePressure}
                maxPressure={data.maxReleasePressure}
                onChange={(e, pressure) =>
                  act('pressure', {
                    pressure,
                  })
                }
                onDefault={() =>
                  act('pressure', { pressure: data.defaultReleasePressure })
                }
                onMax={() =>
                  act('pressure', { pressure: data.maxReleasePressure })
                }
              />
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
