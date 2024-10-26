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

import { Data as GeneralAirControlData, Sensors } from './GeneralAirControl';

type Data = {
  automation: BooleanLike;
  device: {
    power: number;
    volume_rate: number;
  };
} & GeneralAirControlData;

export const GeneralAirControlFuelInjection = (props) => {
  const { act, data } = useBackend<Data>();

  const { automation, device } = data;

  return (
    <Window width={350} height={500}>
      <Window.Content>
        <Sensors />
        <Section
          title={
            <Box inline color={device ? '' : 'bad'}>
              {device ? 'Injector' : 'Injector - NOT FOUND'}
            </Box>
          }
          buttons={
            <>
              {device && (
                <Button
                  icon="power-off"
                  selected={device.power}
                  onClick={() => act('toggle_injector')}
                >
                  {device.power ? 'Injecting' : 'On Hold'}
                </Button>
              )}
              <Button
                ml={1}
                icon={device ? 'sync' : 'search'}
                onClick={() => act('refresh_status')}
                tooltip={device ? 'Refresh' : ''}
              >
                {!device && 'Search'}
              </Button>
            </>
          }
        >
          <LabeledList>
            <LabeledList.Item label="Automated Fuel Injection">
              <Button
                icon="robot"
                selected={automation}
                onClick={() => act('toggle_automation')}
              >
                {automation ? 'Engaged' : 'Disengaged'}
              </Button>
            </LabeledList.Item>
            {device && (
              <LabeledList.Item
                label="Injector"
                buttons={
                  !automation && (
                    <Button
                      icon="syringe"
                      onClick={() => act('injection')}
                      tooltip="Inject (1 Cycle)"
                    />
                  )
                }
              >
                {automation ? (
                  <Box color="average">Injector Controls Locked Out</Box>
                ) : (
                  <AnimatedNumber
                    value={device.volume_rate}
                    format={(val) => `${val} L/s`}
                  />
                )}
              </LabeledList.Item>
            )}
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
