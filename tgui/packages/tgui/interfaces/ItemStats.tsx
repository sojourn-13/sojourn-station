import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import {
  AnimatedNumber,
  Box,
  Button,
  Divider,
  LabeledList,
  NoticeBox,
  ProgressBar,
  Section,
  Stack,
} from 'tgui-core/components';

enum StatType {
  AnimatedNumber = 'AnimatedNumber',
  ProgressBar = 'ProgressBar',
  String = 'String',
}

type ProgressBarData = {
  min?: number;
  max?: number;
  ranges?: Record<string, [number, number]>;
  color?: string;
};

type StatsData = {
  type: StatType;
  name: string;
  value: string | number;
  unit?: string;
} & ProgressBarData;

type ToolData = {
  attachments?: { name: string; icon: string }[];
  max_upgrades?: number;
};

type FiremodesData = {
  sel_mode: number;
  modes: {
    index: number;
    name: string;
    desc: string;
    stats: StatsData[];
    projectile?: StatsData[];
  }[];
};

type WeaponData = {
  firemodes?: FiremodesData;
};

type Data = {
  stats: Record<string, StatsData[]>;
} & ToolData &
  WeaponData;

export const ItemStats = (props) => {
  const { act, data } = useBackend<Data>();

  const { stats, attachments, max_upgrades, firemodes } = data;

  return (
    <Window width={650} height={550}>
      <Window.Content scrollable>
        {firemodes && <Firemodes firemodes={firemodes} />}
        {Object.entries(stats)
          .filter(([_title, data]) => Array.isArray(data) && data.length !== 0)
          .map(([title, data]) => (
            <Section title={title} key={title}>
              <LabeledList>
                {data.map((stats) => (
                  <StatDisplay key={stats.name} stats={stats} />
                ))}
              </LabeledList>
            </Section>
          ))}
        {attachments && (
          <Attachments attachments={attachments} max_upgrades={max_upgrades} />
        )}
      </Window.Content>
    </Window>
  );
};

export const StatDisplay = (props: { stats: StatsData }) => {
  const { stats } = props;

  const { type, name, value, unit } = stats;

  let innerElement;

  switch (type) {
    case StatType.AnimatedNumber:
      if (typeof value !== 'number') {
        innerElement = <NoticeBox danger>Invalid Data</NoticeBox>;
        break;
      }

      innerElement = (
        <Box>
          <AnimatedNumber value={value} />
          {unit}
        </Box>
      );
      break;
    case StatType.ProgressBar: {
      const { min, max, ranges, color } = stats;

      if (max === undefined || typeof value !== 'number') {
        innerElement = <NoticeBox danger>Invalid Data</NoticeBox>;
        break;
      }

      let finalContent;
      if (unit) {
        finalContent = value + '' + unit;
      } else {
        finalContent = value + ' / ' + max;
      }

      innerElement = (
        <ProgressBar
          value={value}
          minValue={min}
          maxValue={max}
          ranges={ranges}
          color={color}
        >
          {finalContent}
        </ProgressBar>
      );

      break;
    }
    case StatType.String:
      innerElement = value;
      break;
  }

  return <LabeledList.Item label={name}>{innerElement}</LabeledList.Item>;
};

export const Attachments = (props: ToolData) => {
  const { attachments, max_upgrades } = props;

  if (attachments === undefined) {
    return (
      <Section title="Attachments">
        <NoticeBox danger>Attachment Data Invalid</NoticeBox>
      </Section>
    );
  }

  return (
    <Section
      title={'Attachments (' + attachments.length + ' / ' + max_upgrades + ')'}
    >
      <Stack vertical>
        {attachments.length === 0 && 'None attached.'}
        {attachments.map((attachment) => (
          <Stack.Item key={attachment.name}>
            <Stack align="center">
              <Stack.Item>
                <Box
                  style={{ border: '1px solid #3e6189', borderRadius: '5%' }}
                  className={attachment.icon}
                />
              </Stack.Item>
              <Stack.Item grow>{attachment.name}</Stack.Item>
            </Stack>
          </Stack.Item>
        ))}
      </Stack>
    </Section>
  );
};

export const Firemodes = (props: { firemodes: FiremodesData }) => {
  const { act } = useBackend();

  const { firemodes } = props;

  if (firemodes.modes.length === 0) {
    return undefined;
  }

  return (
    <Section title={'Firemodes: ' + firemodes.modes.length}>
      {firemodes.modes.map((mode) => (
        <Box as="span" key={mode.index}>
          <Section
            p={1}
            title={mode.name}
            buttons={
              <Button
                selected={mode.index === firemodes.sel_mode}
                onClick={() => act('firemode', { index: mode.index })}
              >
                Select
              </Button>
            }
            key={mode.index}
          >
            <Box pb={2}>{mode.desc}</Box>
            <Stack>
              <Stack.Item grow pr={1}>
                <Section>
                  <LabeledList>
                    {mode.stats.map((stats) => (
                      <StatDisplay key={stats.name} stats={stats} />
                    ))}
                  </LabeledList>
                </Section>
              </Stack.Item>
              {mode.projectile && (
                <Stack.Item grow pl={1}>
                  <Section>
                    <LabeledList>
                      {mode.projectile.map((stats) => (
                        <StatDisplay key={stats.name} stats={stats} />
                      ))}
                    </LabeledList>
                  </Section>
                </Stack.Item>
              )}
            </Stack>
            <Divider />
          </Section>
        </Box>
      ))}
    </Section>
  );
};
