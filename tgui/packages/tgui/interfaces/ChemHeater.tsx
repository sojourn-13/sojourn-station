import { useBackend } from 'tgui/backend';
import { Button } from 'tgui/components';
import { Window } from 'tgui/layouts';
import {
  AnimatedNumber,
  Box,
  Knob,
  LabeledControls,
  LabeledList,
  Section,
} from 'tgui-core/components';
import { round } from 'tgui-core/math';
import { BooleanLike } from 'tgui-core/react';

import { Reagents } from './common/Reagents';

type Data = {
  target_temperature: number;
  on: BooleanLike;
  beaker: Reagents;
};

export const ChemHeater = (props) => {
  const { act, data } = useBackend<Data>();

  const { target_temperature, on, beaker } = data;

  return (
    <Window width={275} height={400}>
      <Window.Content scrollable style={{ overflowY: 'auto' }}>
        <Section title="Controls">
          <LabeledControls justify="space-around">
            <LabeledControls.Item label="Power">
              <Button
                fontSize={2}
                icon="power-off"
                selected={on}
                onClick={() => act('power')}
              />
            </LabeledControls.Item>
            <LabeledControls.Item label="Temperature">
              <Knob
                value={target_temperature}
                minValue={0}
                maxValue={1000}
                onChange={(e, temp) => act('temperature', { temp })}
                size={2}
                format={(v) => round(v, 1) + 'K'}
                className="ChemHeater--knob"
              />
              <AnimatedNumber
                value={target_temperature}
                format={(v) => round(v, 1) + 'K'}
              />
            </LabeledControls.Item>
          </LabeledControls>
        </Section>
        <Section
          title={
            'Beaker ' +
            (beaker ? ` (${beaker.total_volume}/${beaker.maximum_volume})` : '')
          }
          buttons={
            <Button icon="eject" onClick={() => act('eject')}>
              Eject
            </Button>
          }
        >
          {beaker ? (
            <Box>
              <LabeledList>
                <LabeledList.Item label="Temperature">
                  <AnimatedNumber
                    value={beaker.chem_temp}
                    format={(val) => round(val, 1) + 'K'}
                  />
                </LabeledList.Item>
              </LabeledList>
              {beaker.contents.length ? (
                beaker.contents.map((r) => (
                  <Box key={r.id} color="label">
                    {r.volume} unit{r.volume === 1 ? '' : 's'} {r.name}
                  </Box>
                ))
              ) : (
                <Box color="bad">Beaker Empty</Box>
              )}
            </Box>
          ) : (
            <Box color="average">No Beaker Loaded.</Box>
          )}
        </Section>
      </Window.Content>
    </Window>
  );
};
