import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import { Box, Button, LabeledList, Section, Stack } from 'tgui-core/components';

import { LoadedMaterials, MaterialData } from './Matterforge';

export type OddityTagProps = {
  level: number;
};

export const OddityTag = (props: OddityTagProps) => {
  const { level } = props;

  let name = '';
  let color = '';

  if (level >= 10) {
    name = 'Overwhelming';
    color = 'gold';
  } else if (level >= 6) {
    name = 'Strong';
    color = 'red';
  } else if (level >= 3) {
    name = 'Medium';
    color = 'green';
  } else {
    name = 'Weak';
    color = 'blue';
  }

  return (
    <Box inline color={color}>
      {name}
    </Box>
  );
};

type Data = MaterialData & {
  oddity_name: string;
  oddity_stats: {
    name: string;
    level: number;
  }[];
};

export const ArtistBench = (props) => {
  const { act, data } = useBackend<Data>();

  const { mat_capacity, materials, oddity_name, oddity_stats } = data;

  return (
    <Window width={300} height={400}>
      <Window.Content>
        <LoadedMaterials mat_capacity={mat_capacity} materials={materials} />
        <Section
          title="Model Oddity"
          buttons={
            <Button
              icon={oddity_name ? 'eject' : 'caret-up'}
              onClick={() => {
                act('oddity');
              }}
            >
              {oddity_name ? 'Remove' : 'Insert'}
            </Button>
          }
        >
          <LabeledList>
            <LabeledList.Item label="Name">
              {oddity_name || 'None'}
            </LabeledList.Item>
          </LabeledList>
          {oddity_stats ? (
            <Section title="Stats">
              <Stack vertical>
                {oddity_stats.map((stat) => (
                  <Stack.Item key={stat.name}>
                    <OddityTag level={stat.level} /> aspect of{' '}
                    <b>{stat.name}</b>
                  </Stack.Item>
                ))}
              </Stack>
            </Section>
          ) : null}
        </Section>
        <Button
          fluid
          fontSize="24px"
          textAlign="center"
          icon="brush"
          onClick={() => {
            act('create_art');
          }}
        >
          Create Art
        </Button>
      </Window.Content>
    </Window>
  );
};
