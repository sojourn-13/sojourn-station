import { useBackend } from 'tgui/backend';
import { Button } from 'tgui/components';
import { Window } from 'tgui/layouts';
import { Box, LabeledList, Section, Slider, Stack } from 'tgui-core/components';
import { round } from 'tgui-core/math';
import { BooleanLike } from 'tgui-core/react';

import {
  ColoredSecurityLevel,
  SecurityLevelEnum,
} from './common/ColoredSecurityLevel';

type Data = {
  seclevel: SecurityLevelEnum;
  time: number;
  timing: BooleanLike;
  active: BooleanLike;
};

export const FireAlarm = (props) => {
  const { act, data } = useBackend<Data>();

  const { seclevel, time, timing, active } = data;

  return (
    <Window width={275} height={300}>
      <Window.Content>
        <Section
          fill
          title={
            <Box inline>
              Current alert level:{' '}
              <ColoredSecurityLevel security_level={seclevel} />
            </Box>
          }
        >
          <Stack mt={1} mb={3} align="center" justify="center">
            <Stack.Item>
              <Button
                icon="fire"
                fontSize={8}
                color={active ? 'bad' : ''}
                iconSpin={active}
                onClick={() => act('alarm_toggle')}
              />
            </Stack.Item>
          </Stack>

          <LabeledList>
            {!active && (
              <LabeledList.Item
                label="Timer"
                buttons={
                  <Button onClick={() => act('timer_toggle')}>
                    {timing ? 'Stop' : 'Start'}
                  </Button>
                }
              >
                <Slider
                  animated
                  value={time}
                  minValue={0}
                  maxValue={120}
                  step={1}
                  stepPixelSize={2}
                  format={(value) => `${round(value, 0)} seconds`}
                  onChange={(e, val) => act('timer_set', { time: val })}
                />
              </LabeledList.Item>
            )}
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
