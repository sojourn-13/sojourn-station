import { sortBy } from 'common/collections';
import { round } from 'common/math';
import { BooleanLike } from 'common/react';
import { useBackend } from 'tgui/backend';
import {
  Box,
  Button,
  LabeledList,
  ProgressBar,
  Section,
  Slider,
} from 'tgui/components';
import { formatPower } from 'tgui/format';
import { NtosWindow } from 'tgui/layouts';
import { NTOSData } from 'tgui/layouts/NtosWindow';

type SMESData = {
  charge: number;
  input_set: BooleanLike;
  input_val: number;
  input_load: number;
  input_max: number;
  output_set: BooleanLike;
  output_val: number;
  output_load: number;
  output_max: number;
  RCON_tag: string;
};

type BreakerData = {
  RCON_tag: string;
  enabled: BooleanLike;
};

type Data = {
  smeses: SMESData[];
  breakers: BreakerData[];
} & NTOSData;

export const NtosRcon = (props) => {
  const { act, data } = useBackend<Data>();
  const { smeses, breakers } = data;

  const sortedSmeses = sortBy(smeses, (s) => s.RCON_tag);

  return (
    <NtosWindow width={660} height={600}>
      <NtosWindow.Content scrollable>
        <Section title="Detected SMES Units">
          <LabeledList>
            {sortedSmeses.map((smes) => (
              <Smes key={smes.RCON_tag} smes={smes} />
            ))}
          </LabeledList>
        </Section>
        <Section title="Detected Breakers">
          <LabeledList>
            {breakers.map((breaker) => (
              <LabeledList.Item key={breaker.RCON_tag} label={breaker.RCON_tag}>
                [
                <Box inline color={breaker.enabled ? 'good' : 'bad'}>
                  {breaker.enabled ? 'ENABLED' : 'DISABLED'}
                </Box>
                ]{' '}
                <Button
                  icon="power-off"
                  tooltip={breaker.enabled ? 'Turn Off?' : 'Turn On?'}
                  onClick={() =>
                    act('toggle_breaker', { breaker: breaker.RCON_tag })
                  }
                />
              </LabeledList.Item>
            ))}
          </LabeledList>
        </Section>
      </NtosWindow.Content>
    </NtosWindow>
  );
};

const Smes = (props: { smes: SMESData }) => {
  const { act } = useBackend();
  const { smes } = props;

  return (
    <LabeledList.Item label={smes.RCON_tag}>
      <Box mb={1}>
        <ProgressBar
          value={smes.charge}
          minValue={0}
          maxValue={100}
          ranges={{
            good: [50, Number.POSITIVE_INFINITY],
            average: [25, 50],
            bad: [Number.NEGATIVE_INFINITY, 25],
          }}
        />
      </Box>
      <Box>
        <LabeledList>
          <LabeledList.Item
            label="Input"
            buttons={
              <Button
                icon="power-off"
                selected={smes.input_set}
                tooltip={smes.input_set ? 'AUTO' : 'OFF'}
                onClick={() => act('smes_in_toggle', { smes: smes.RCON_tag })}
              />
            }
          >
            {/* smes values are in watts, but we want our text editor to be in kw, so /1000 for actual values (the text is fine) */}
            <Slider
              value={smes.input_val / 1000}
              minValue={0}
              maxValue={smes.input_max / 1000}
              fillValue={smes.input_load / 1000}
              step={1}
              format={(val) => formatPower(round(val * 1000, 2))}
              onChange={(e, value) =>
                act('smes_in_set', { smes: smes.RCON_tag, value: value * 1000 })
              }
            >
              {formatPower(round(smes.input_load, 2))} Load /{' '}
              {formatPower(round(smes.input_val, 2))} Set
            </Slider>
          </LabeledList.Item>
          <LabeledList.Item
            label="Output"
            buttons={
              <Button
                icon="power-off"
                selected={smes.output_set}
                tooltip={smes.output_set ? 'ONLINE' : 'OFFLINE'}
                onClick={() => act('smes_out_toggle', { smes: smes.RCON_tag })}
              />
            }
          >
            <Slider
              value={smes.output_val / 1000}
              minValue={0}
              maxValue={smes.output_max / 1000}
              fillValue={smes.output_load / 1000}
              step={1}
              format={(val) => formatPower(round(val * 1000, 2))}
              onChange={(e, value) =>
                act('smes_out_set', {
                  smes: smes.RCON_tag,
                  value: value * 1000,
                })
              }
            >
              {formatPower(round(smes.output_load, 2))} Load /{' '}
              {formatPower(round(smes.output_val, 2))} Set
            </Slider>
          </LabeledList.Item>
        </LabeledList>
      </Box>
    </LabeledList.Item>
  );
};
