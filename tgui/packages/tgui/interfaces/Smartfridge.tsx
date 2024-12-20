import { sortBy } from 'common/collections';
import { useEffect, useState } from 'react';
import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import {
  Box,
  Button,
  Flex,
  NoticeBox,
  Section,
  Table,
} from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';
import { toTitleCase } from 'tgui-core/string';

type Data = {
  allowed: BooleanLike;
  emagged: BooleanLike;
  secure: BooleanLike;
  items: {
    [path: string]: number;
  };
};

export const Smartfridge = (props) => {
  const { act, data } = useBackend<Data>();

  const { allowed, emagged, secure, items } = data;

  const itemEntries = sortBy(Object.entries(items), ([key, count]) =>
    key.toUpperCase(),
  );

  let buttonsDisabled = false;
  if (secure && !emagged) {
    buttonsDisabled = !allowed;
  }

  return (
    <Window width={400} height={500}>
      <Window.Content scrollable>
        <Section title="Storage" fill>
          <SecureNotice secure={secure} emagged={emagged} allowed={allowed} />
          {itemEntries.length === 0 ? (
            <Box color="average">No items loaded.</Box>
          ) : (
            <Table>
              <Table.Row header>
                <Table.Cell>Item</Table.Cell>
                <Table.Cell collapsing textAlign="right">
                  Amount
                </Table.Cell>
                <Table.Cell collapsing textAlign="center">
                  Vend
                </Table.Cell>
              </Table.Row>
              {itemEntries.map(([name, count]) => (
                <Table.Row key={name} className="candystripe">
                  <Table.Cell p={1} verticalAlign="middle" color="label">
                    {toTitleCase(name)}
                  </Table.Cell>
                  <Table.Cell
                    p={1}
                    verticalAlign="middle"
                    textAlign="right"
                    collapsing
                  >
                    {count}
                  </Table.Cell>
                  <Table.Cell
                    p={1}
                    verticalAlign="middle"
                    textAlign="center"
                    collapsing
                  >
                    <DispenseButtons
                      name={name}
                      count={count}
                      disabled={buttonsDisabled}
                    />
                  </Table.Cell>
                </Table.Row>
              ))}
            </Table>
          )}
        </Section>
      </Window.Content>
    </Window>
  );
};

const SecureNotice = (props: {
  secure: BooleanLike;
  emagged: BooleanLike;
  allowed: BooleanLike;
}) => {
  const { secure, emagged, allowed } = props;

  // Component constant settings
  const ORIG_TEXT = 'Secure Access: Please have your identification ready.';
  const REPLACEMENT_CHARACTERS = ['*', '^', '&', '%', '$', '_', '#', '!'];
  const SPEED = 100;

  const [text, setText] = useState(ORIG_TEXT);

  useEffect(() => {
    if (emagged) {
      const id = setInterval(() => {
        let buildingString = '';
        for (let i = 0; i < ORIG_TEXT.length; i++) {
          if (Math.random() > 0.9) {
            buildingString +=
              REPLACEMENT_CHARACTERS[
                Math.floor(Math.random() * REPLACEMENT_CHARACTERS.length)
              ];
          } else {
            buildingString += ORIG_TEXT[i];
          }
        }

        setText(buildingString);
      }, SPEED);
      return () => {
        clearInterval(id);
        setText(ORIG_TEXT);
      };
    }
  }, [emagged]);

  if (!secure) {
    return null;
  } else if (emagged) {
    return <NoticeBox danger>{text}</NoticeBox>;
  } else if (!allowed) {
    return (
      <NoticeBox danger>Unauthorized access, vending is unavailable.</NoticeBox>
    );
  } else {
    return <NoticeBox info>{text}</NoticeBox>;
  }
};

const DispenseButtons = (props: {
  name: string;
  count: number;
  disabled: boolean;
}) => {
  const { act } = useBackend();

  const { name, count, disabled } = props;

  return (
    <Flex direction="column">
      {/* 1, 5 */}
      <Flex.Item>
        <Flex>
          <Flex.Item grow minWidth={3}>
            <Button
              fluid
              disabled={disabled}
              textAlign="center"
              onClick={() => act('vend', { name, count: 1 })}
            >
              x1
            </Button>
          </Flex.Item>
          {count >= 5 && (
            <Flex.Item grow minWidth={3} ml={0.2}>
              <Button
                fluid
                disabled={disabled}
                textAlign="center"
                onClick={() => act('vend', { name, count: 5 })}
              >
                x5
              </Button>
            </Flex.Item>
          )}
        </Flex>
      </Flex.Item>
      {/* 10, 25 */}
      {count >= 10 && (
        <Flex.Item mt={0.2}>
          <Flex>
            <Flex.Item grow minWidth={3}>
              <Button
                fluid
                disabled={disabled}
                textAlign="center"
                onClick={() => act('vend', { name, count: 10 })}
              >
                x10
              </Button>
            </Flex.Item>
            {count >= 25 && (
              <Flex.Item grow minWidth={3} ml={0.2}>
                <Button
                  fluid
                  disabled={disabled}
                  textAlign="center"
                  onClick={() => act('vend', { name, count: 25 })}
                >
                  x25
                </Button>
              </Flex.Item>
            )}
          </Flex>
        </Flex.Item>
      )}
      {count > 1 && (
        <Flex.Item mt={0.2}>
          <Button
            fluid
            disabled={disabled}
            textAlign="center"
            onClick={() => act('vend', { name, count })}
          >
            All
          </Button>
        </Flex.Item>
      )}
    </Flex>
  );
};
