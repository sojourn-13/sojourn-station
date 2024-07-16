import { useEffect, useRef, useState } from 'react';
import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import { Box, Input, Section, Stack } from 'tgui-core/components';

type Data = {
  history: string[];
};

export const Terminal = (props) => {
  const { act, data } = useBackend<Data>();

  const { history } = data;

  const scrollableRef = useRef<HTMLDivElement>(null);
  const [pendingScroll, setPendingScroll] = useState(true);
  useEffect(() => {
    if (!pendingScroll) {
      return;
    }

    setPendingScroll(false);

    if (scrollableRef.current) {
      scrollableRef.current.scrollTop = scrollableRef.current.scrollHeight;
    }
  }, [history]);

  return (
    <Window width={500} height={460}>
      <Window.Content>
        <Section
          fill
          scrollable
          className="Terminal__Monospace"
          ref={scrollableRef}
        >
          {history.map((string) => {
            let color = 'gray';

            if (string.startsWith('>')) {
              color = 'label';
            } else if (string.includes('ACCESS DENIED')) {
              color = 'bad';
            }

            return (
              <Box key={string} color={color}>
                {string}
              </Box>
            );
          })}
          <Stack>
            <Stack.Item>&gt;</Stack.Item>
            <Stack.Item grow>
              <Input
                autoFocus
                autoSelect
                selfClear
                fluid
                className="Terminal__Monospace"
                style={{ backgroundColor: 'transparent', border: 'none' }}
                onEnter={(e, input) => {
                  act('command', { input });
                  setPendingScroll(true);
                }}
              />
            </Stack.Item>
          </Stack>
        </Section>
      </Window.Content>
    </Window>
  );
};
