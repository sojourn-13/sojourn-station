import { isEscape } from 'common/keys';
import { useState } from 'react';
import { useBackend } from 'tgui/backend';
import { Button, Input, Section, Stack } from 'tgui/components';
import { Window } from 'tgui/layouts';

import { GroupedContents } from './GroupedContents';
import { RawContents } from './RawContents';
import { SearchItem } from './types';

type Data = {
  contents: SearchItem[];
};

export function LootPanel(props) {
  const { act, data } = useBackend<Data>();
  const { contents = [] } = data;

  const [grouping, setGrouping] = useState(true);
  const [searchText, setSearchText] = useState('');

  const total = contents.length ? contents.length - 1 : 0;

  return (
    <Window height={300} width={240} title={`Contents: ${total}`}>
      <Window.Content
        onKeyDown={(event) => {
          if (isEscape(event.key)) {
            Byond.sendMessage('close');
          }
        }}
      >
        <Section
          fill
          scrollable
          title={
            <Stack>
              <Stack.Item grow>
                <Input
                  autoFocus
                  fluid
                  onInput={(event, value) => setSearchText(value)}
                  placeholder="Search"
                />
              </Stack.Item>
              <Stack.Item>
                <Button
                  icon={grouping ? 'layer-group' : 'object-ungroup'}
                  selected={grouping}
                  onClick={() => setGrouping(!grouping)}
                  tooltip="Toggle Grouping"
                />
              </Stack.Item>
              <Stack.Item>
                <Button
                  icon="sync"
                  onClick={() => act('refresh')}
                  tooltip="Refresh"
                />
              </Stack.Item>
            </Stack>
          }
        >
          {grouping ? (
            <GroupedContents contents={contents} searchText={searchText} />
          ) : (
            <RawContents contents={contents} searchText={searchText} />
          )}
        </Section>
      </Window.Content>
    </Window>
  );
}
