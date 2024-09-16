import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import { Box, Button, LabeledList, Section } from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';
import { capitalize } from 'tgui-core/string';

type Wire = {
  color: string;
  color_name: string;
  desc: string;
  cut: BooleanLike;
  attached: BooleanLike;
};

type Data = {
  wires: Wire[];
  status: string[];
};

export const Wires = (props) => {
  const { act, data } = useBackend<Data>();

  const wires = data.wires || [];
  const statuses = data.status || [];

  return (
    <Window width={350} height={150 + wires.length * 30}>
      <Window.Content>
        <Section>
          <LabeledList>
            {wires.map((wire) => (
              <LabeledList.Item
                key={wire.color}
                className="candystripe"
                label={capitalize(wire.color_name)}
                labelColor={wire.color}
                color={wire.color}
                buttons={
                  <>
                    <Button
                      onClick={() =>
                        act('cut', {
                          wire: wire.color,
                        })
                      }
                    >
                      {wire.cut ? 'Mend' : 'Cut'}
                    </Button>
                    <Button
                      onClick={() =>
                        act('pulse', {
                          wire: wire.color,
                        })
                      }
                    >
                      Pulse
                    </Button>
                    <Button
                      onClick={() =>
                        act('attach', {
                          wire: wire.color,
                        })
                      }
                    >
                      {wire.attached ? 'Detach' : 'Attach'}
                    </Button>
                  </>
                }
              >
                {!!wire.desc && <i>({wire.desc})</i>}
              </LabeledList.Item>
            ))}
          </LabeledList>
        </Section>

        {!!statuses.length && (
          <Section>
            {statuses.map((status) => (
              <Box key={status} color="lightgray" mt={0.1}>
                {status}
              </Box>
            ))}
          </Section>
        )}
      </Window.Content>
    </Window>
  );
};
