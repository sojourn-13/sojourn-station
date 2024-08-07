import { useBackend } from 'tgui/backend';
import { Button } from 'tgui/components';
import { Window } from 'tgui/layouts';
import { LabeledList, Section, Stack } from 'tgui-core/components';

const MODE2COLOR = {
  Off: 'bad',
  Panel: 'bad',
  Ready: 'good',
  Pressurizing: 'average',
};

type DisposalUnitData = {
  isai: boolean;
  mode: string;
  panel: boolean;
  eject: boolean;
  handle: boolean;
};

export const DisposalUnit = (props) => {
  const { act, data } = useBackend<DisposalUnitData>();
  const { isai, mode, handle, panel, eject } = data;
  let modeColor = MODE2COLOR[panel ? 'Panel' : mode];
  let modeText = panel ? 'Power Disabled' : mode;

  return (
    <Window width={300} height={155} title="Waste Disposal Unit">
      <Window.Content>
        <Section>
          <Stack fill vertical>
            <Stack.Item>
              <LabeledList>
                <LabeledList.Item label="Status" color={modeColor}>
                  {modeText}
                </LabeledList.Item>
                <LabeledList.Item label="Handle">
                  <Button
                    icon={handle ? 'toggle-on' : 'toggle-off'}
                    content={handle ? 'Disengage' : 'Engage'}
                    onClick={() => {
                      act('toggle', { handle: true });
                    }}
                    disabled={isai}
                  />
                </LabeledList.Item>
                <LabeledList.Item label="Pump">
                  <Button
                    icon="power-off"
                    selected={mode !== 'Off'}
                    onClick={() => {
                      act('toggle', { pump: true });
                    }}
                    disabled={panel}
                  />
                </LabeledList.Item>
              </LabeledList>
            </Stack.Item>
            <Stack.Item>
              <Button
                fluid
                icon="eject"
                disabled={!eject}
                content="Eject"
                textAlign="center"
                style={{ fontSize: '15px' }}
                onClick={() => {
                  act('eject');
                }}
              />
            </Stack.Item>
          </Stack>
        </Section>
      </Window.Content>
    </Window>
  );
};
