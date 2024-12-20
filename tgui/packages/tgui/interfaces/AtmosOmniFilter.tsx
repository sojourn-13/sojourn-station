import { useBackend } from 'tgui/backend';
import { Button } from 'tgui/components';
import { Window } from 'tgui/layouts';
import { Box, LabeledList, Section } from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';

const getStatusText = (port) => {
  if (port.input) {
    return 'Input';
  }
  if (port.output) {
    return 'Output';
  }
  if (port.f_type) {
    return port.f_type;
  }
  return 'Disabled';
};

type Port = {
  dir: string;
  input: BooleanLike;
  output: BooleanLike;
  f_type: string;
};

// Also used for filter
type Data = {
  power: BooleanLike;
  config: BooleanLike;
  ports: Port[];
  set_flow_rate: number;
  last_flow_rate: number;
};

export const AtmosOmniFilter = (props) => {
  const { act, data } = useBackend<Data>();

  const { power, config, ports, set_flow_rate, last_flow_rate } = data;

  return (
    <Window width={360} height={330}>
      <Window.Content>
        <Section
          title={config ? 'Configuration' : 'Status'}
          buttons={
            <>
              <Button
                icon="power-off"
                selected={power}
                disabled={config}
                onClick={() => act('power')}
              >
                {power ? 'On' : 'Off'}
              </Button>
              <Button
                icon="wrench"
                selected={config}
                onClick={() => act('configure')}
              />
            </>
          }
        >
          {ports && ports.length > 0 ? (
            <LabeledList>
              {ports.map((port) => (
                <LabeledList.Item key={port.dir} label={port.dir + ' Port'}>
                  {config ? (
                    <>
                      <Button
                        selected={port.input}
                        icon="compress-arrows-alt"
                        onClick={() =>
                          act('switch_mode', {
                            mode: 'in',
                            dir: port.dir,
                          })
                        }
                      >
                        IN
                      </Button>
                      <Button
                        selected={port.output}
                        icon="expand-arrows-alt"
                        onClick={() =>
                          act('switch_mode', {
                            mode: 'out',
                            dir: port.dir,
                          })
                        }
                      >
                        OUT
                      </Button>
                      <Button
                        icon="wrench"
                        disabled={port.input || port.output}
                        selected={!!port.f_type}
                        onClick={() =>
                          act('switch_filter', {
                            mode: port.f_type,
                            dir: port.dir,
                          })
                        }
                      >
                        {port.f_type || 'None'}
                      </Button>
                    </>
                  ) : (
                    getStatusText(port)
                  )}
                </LabeledList.Item>
              ))}
            </LabeledList>
          ) : (
            <Box color="average">No Ports Configured/Detected</Box>
          )}
        </Section>
        <Section title="Flow Rate">
          <LabeledList>
            <LabeledList.Item label="Current Flow Rate">
              {last_flow_rate} L/s
            </LabeledList.Item>
            <LabeledList.Item label="Flow Rate Limit">
              {config ? (
                <Button icon="wrench" onClick={() => act('set_flow_rate')}>
                  {set_flow_rate / 10 + ' L/s'}
                </Button>
              ) : (
                set_flow_rate / 10 + ' L/s'
              )}
            </LabeledList.Item>
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
