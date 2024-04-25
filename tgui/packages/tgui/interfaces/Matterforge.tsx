import { BooleanLike } from 'common/react';
import { useBackend } from '../backend';
import { Button, Flex, Knob, LabeledControls, Section } from '../components';
import { Window } from '../layouts';

type Data = {
  error: string;
  paused: BooleanLike;
  unfolded: string | null;
  mat_efficiency: number;
  mat_capacity: number;
  designs: {
    id: string;
    name: string;
    desc: string;
    time: number;
    category: string | null;
    adjust_materials: number;
    materials: {
      id: string;
      name: string;
      req: number;
    }[];
    icon: string;
  }[];
  queue: {
    ind: number;
    error: number;
  }[];
  queue_max: number;
};

export const Matterforge = (props, context) => {
  const { act, data } = useBackend<Data>(context);
  const { error } = data;

  return (
    <Window width={500} height={400}>
      <Window.Content>
        <Section title="Matterforge">Error: {error}</Section>
      </Window.Content>
    </Window>
  );
};
