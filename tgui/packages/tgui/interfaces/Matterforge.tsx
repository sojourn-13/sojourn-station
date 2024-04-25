import { useBackend } from '../backend';
import { Button, Flex, Knob, LabeledControls, Section } from '../components';
import { Window } from '../layouts';

type Data = {
  error: string;
  // temperature: number;
  // fluid_type: string;
  // minTemperature: number;
  // maxTemperature: number;
  // fluidTypes: string[];
  // contents: { ref: string; name: string }[];
  // allow_breeding: BooleanLike;
};

export const Matterforge = (props, context) => {
  const { act, data } = useBackend<Data>(context);
  const {
    error
  } = data;

  return (
    <Window width={500} height={400}>
      <Window.Content>
        <Section title="Matterforge">
          Error: {error}
        </Section>
      </Window.Content>
    </Window>
  );
};
