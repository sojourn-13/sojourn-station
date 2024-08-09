import { useBackend } from 'tgui/backend';
import { Button } from 'tgui/components';
import { Window } from 'tgui/layouts';
import { Box, LabeledList, Section, Slider } from 'tgui-core/components';

import { Data as GeneralAirControlData, Sensors } from './GeneralAirControl';

type Data = {
  input_flow_setting: number;
  pressure_setting: number;
  input: {
    name: string;
    power: number;
    volume_rate: number;
    max: number;
  } | null;
  output: {
    name: string;
    power: number;
    pressure: number;
    max: number;
  };
} & GeneralAirControlData;

export const GeneralAirControlInputOutput = (props) => {
  const { act, data } = useBackend<Data>();

  return (
    <Window width={350} height={420}>
      <Window.Content>
        <Sensors />
        <Section title="Controls">
          <InputPort />
          <OutputPort />
        </Section>
      </Window.Content>
    </Window>
  );
};

export const InputPort = (props) => {
  const { act, data } = useBackend<Data>();

  const { input } = data;

  return (
    <Section
      title={
        <Box inline color={input ? '' : 'bad'}>
          {input ? input.name : 'Input - NOT DETECTED'}
        </Box>
      }
      buttons={
        <>
          {input && (
            <Button
              icon="power-off"
              selected={input.power}
              onClick={() => act('in_toggle_injector')}
            >
              {input.power ? 'Injecting' : 'On Hold'}
            </Button>
          )}
          <Button
            ml={1}
            icon={input ? 'sync' : 'search'}
            onClick={() => act('in_refresh_status')}
            tooltip={input ? 'Refresh' : ''}
          >
            {!input && 'Search'}
          </Button>
        </>
      }
    >
      {input ? (
        <LabeledList>
          <LabeledList.Item
            label="Flow Rate"
            buttons={
              <Button
                ml={1}
                icon="plus"
                onClick={() => act('in_set_flowrate', { value: input.max })}
              >
                Max
              </Button>
            }
          >
            <Slider
              value={input.volume_rate}
              fillValue={input.volume_rate}
              minValue={0}
              maxValue={input.max}
              format={(val) => `${val} L/s`}
              onChange={(e, value) => {
                act('in_set_flowrate', { value });
              }}
            />
          </LabeledList.Item>
        </LabeledList>
      ) : (
        <Box color="bad">No Input Detected</Box>
      )}
    </Section>
  );
};

export const OutputPort = (props) => {
  const { act, data } = useBackend<Data>();

  const { output } = data;

  return (
    <Section
      title={
        <Box inline color={output ? '' : 'bad'}>
          {output ? output.name : 'Output - NOT DETECTED'}
        </Box>
      }
      buttons={
        <>
          {output && (
            <Button
              icon="power-off"
              selected={output.power}
              onClick={() => act('out_toggle_power')}
            >
              {output.power ? 'Open' : 'On Hold'}
            </Button>
          )}
          <Button
            ml={1}
            icon={output ? 'sync' : 'search'}
            onClick={() => act('out_refresh_status')}
            tooltip={output ? 'Refresh' : ''}
          >
            {!output && 'Search'}
          </Button>
        </>
      }
    >
      {output ? (
        <LabeledList>
          <LabeledList.Item
            label="Output Pressure"
            buttons={
              <Button
                ml={1}
                icon="plus"
                onClick={() => act('out_set_pressure', { value: output.max })}
              >
                Max
              </Button>
            }
          >
            <Slider
              value={output.pressure}
              fillValue={output.pressure}
              minValue={0}
              maxValue={output.max}
              format={(val) => `${val} kPa`}
              onChange={(e, value) => {
                act('out_set_pressure', { value });
              }}
            />
          </LabeledList.Item>
        </LabeledList>
      ) : (
        <Box color="bad">No Output Detected</Box>
      )}
    </Section>
  );
};
