import { useBackend } from 'tgui/backend';
import { Button } from 'tgui/components';
import { Window } from 'tgui/layouts';
import { Box, Flex, Section } from 'tgui-core/components';

type Data = {
  bookcase_name: string;
  hex_code_for_backround: string;
  contents_ref: string[];
  contents: string[];
};

export const BookCase = (props) => {
  const { act, data } = useBackend<Data>();
  const { bookcase_name, hex_code_for_backround, contents, contents_ref } =
    data;
  return (
    <Window title={bookcase_name || 'Bookcase'} width={350} height={300}>
      <Window.Content backgroundColor={hex_code_for_backround} scrollable>
        {contents.map((object, index) => (
          <Flex
            key={contents_ref[index]}
            color="black"
            backgroundColor="white"
            style={{ padding: '2px' }}
            mb={0.5}
          >
            <Flex.Item align="center" grow={1}>
              <Box align="center">{object}</Box>
            </Flex.Item>
            <Flex.Item>
              <Button
                icon="eject"
                onClick={() =>
                  act('remove_object', { ref: contents_ref[index] })
                }
              />
            </Flex.Item>
          </Flex>
        ))}
        {contents.length === 0 && (
          <Section>
            <Box color="white" align="center">
              The {bookcase_name} is empty!
            </Box>
          </Section>
        )}
      </Window.Content>
    </Window>
  );
};
