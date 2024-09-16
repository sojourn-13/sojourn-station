import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import {
  AnimatedNumber,
  Box,
  Button,
  Flex,
  LabeledList,
  ProgressBar,
  Section,
  Slider,
  Stack,
} from 'tgui-core/components';
import { round } from 'tgui-core/math';
import { BooleanLike } from 'tgui-core/react';

import { Reagents } from './common/Reagents';

type Chemical = {
  title: string;
  id: string;
  commands: { [key: string]: string };
};

type Data = {
  amount: number;
  energy: number;
  maxEnergy: number;
  accept_beaker: BooleanLike;
  use_smaller_units: BooleanLike;
  chemicals: Chemical[];
  beaker: Reagents | null;
};

export const ChemDispenser = (props) => {
  const { data } = useBackend<Data>();

  const { accept_beaker, chemicals, beaker, use_smaller_units } = data;

  return (
    <Window width={430} height={560}>
      <Window.Content>
        <Stack vertical height="100%">
          <Stack.Item>
            <Settings />
          </Stack.Item>
          <Stack.Item>
            <Chemicals
              chemicals={chemicals}
              use_smaller_units={use_smaller_units}
            />
          </Stack.Item>
          <Stack.Item grow>
            <Beaker beaker={beaker} accept_beaker={accept_beaker} />
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};

const Settings = (props) => {
  const { act, data } = useBackend<Data>();

  const { amount, energy, maxEnergy, use_smaller_units } = data;

  return (
    <Section title="Settings">
      <LabeledList>
        <LabeledList.Item label="Energy">
          <ProgressBar
            value={energy}
            maxValue={maxEnergy}
            ranges={{
              good: [maxEnergy * 0.75, Number.POSITIVE_INFINITY],
              average: [maxEnergy * 0.25, maxEnergy * 0.75],
              bad: [Number.NEGATIVE_INFINITY, maxEnergy * 0.25],
            }}
          >
            <AnimatedNumber
              value={energy}
              format={(val) => `${round(val, 1)} Unit${val > 1 ? 's' : ''}`}
            />
          </ProgressBar>
        </LabeledList.Item>
        <LabeledList.Item label="Dispense" verticalAlign="top">
          <Stack vertical>
            <Stack.Item>
              <ShortcutButtons
                amount={amount}
                use_smaller_units={use_smaller_units}
              />
            </Stack.Item>
            <Stack.Item>
              <Stack>
                <Stack.Item>
                  <Button
                    icon="minus"
                    onClick={() => act('amount', { amount: amount - 1 })}
                  />
                </Stack.Item>
                <Stack.Item grow>
                  <Slider
                    animated
                    value={amount}
                    minValue={0}
                    maxValue={120}
                    format={(val) =>
                      `${round(val, 1)} Unit${val > 1 ? 's' : ''}`
                    }
                    stepPixelSize={3}
                    onChange={(e, amount) => act('amount', { amount })}
                  />
                </Stack.Item>
                <Stack.Item>
                  <Button
                    icon="plus"
                    onClick={() => act('amount', { amount: amount + 1 })}
                  />
                </Stack.Item>
              </Stack>
            </Stack.Item>
          </Stack>
        </LabeledList.Item>
      </LabeledList>
    </Section>
  );
};

const ShortcutButtons = (props: Pick<Data, 'amount' | 'use_smaller_units'>) => {
  const { act } = useBackend();
  const { amount } = props;
  const buttonSizes = props.use_smaller_units
    ? [1, 2, 5, 10, 15, 20]
    : [5, 10, 20, 30, 40, 60];
  return (
    <Stack>
      {buttonSizes.map((size) => (
        <Stack.Item grow key={size}>
          <Button
            selected={amount === size}
            fluid
            icon="eye-dropper"
            textAlign="center"
            onClick={() => act('amount', { amount: size })}
          >
            {size}
          </Button>
        </Stack.Item>
      ))}
    </Stack>
  );
};

const Chemicals = (props: Pick<Data, 'chemicals' | 'use_smaller_units'>) => {
  const { act } = useBackend();
  const { chemicals, use_smaller_units } = props;

  const flexFillers = [];
  for (let i = 0; i < (chemicals.length + 1) % 3; i++) {
    flexFillers.push();
  }

  return (
    <Section title="Dispenser">
      <Flex
        direction="row"
        wrap="wrap"
        height="100%"
        spacingPrecise="2"
        align="flex-start"
        alignContent="flex-start"
      >
        {chemicals.map((c, i) => (
          <Flex.Item
            key={i}
            grow="1"
            basis={use_smaller_units ? '45%' : '30%'}
            pl={
              i % (use_smaller_units ? 2 : 3) === (use_smaller_units ? 0 : 0)
                ? 0
                : 0.5
            }
            pb={0.5}
          >
            <Button
              icon="arrow-circle-down"
              fluid
              onClick={() =>
                act('dispense', {
                  reagent: c.id,
                })
              }
            >
              {c.title}
            </Button>
          </Flex.Item>
        ))}
        {flexFillers.map((_, i) => (
          <Flex.Item key={i} grow="1" basis="25%" height="20px" />
        ))}
      </Flex>
    </Section>
  );
};

const Beaker = (props: Pick<Data, 'beaker' | 'accept_beaker'>) => {
  const { act } = useBackend();
  const { beaker, accept_beaker } = props;

  let content = <Box color="average">No beaker loaded</Box>;
  let title = accept_beaker ? 'Beaker' : 'Container';
  if (beaker) {
    title += ` (${beaker.total_volume}/${beaker.maximum_volume})`;
    content = (
      <Stack vertical>
        {beaker.contents.map((r) => (
          <Stack.Item key={r.id} color="label">
            {r.volume} unit{r.volume > 1 ? 's' : ''} of {r.name}
          </Stack.Item>
        ))}
      </Stack>
    );
  }

  return (
    <Section
      fill
      title={title}
      scrollable
      buttons={
        <Button icon="eject" disabled={!beaker} onClick={() => act('eject')}>
          Eject
        </Button>
      }
    >
      {content}
    </Section>
  );
};
