import { round } from 'common/math';
import { BooleanLike } from 'common/react';
import { useBackend } from 'tgui/backend';
import {
  AnimatedNumber,
  Box,
  Button,
  LabeledList,
  Section,
} from 'tgui/components';
import { NtosWindow } from 'tgui/layouts';

import { HackingGrid } from './common/HackingGrid';

type Data = {
  error: string | null;
  target: BooleanLike;
  speed: number;
  completion_fraction: number;
  relays: number[];
  focus: number;
};

export const NtosDOS = (props) => {
  const { act, data } = useBackend<Data>();

  const { error, target } = data;

  let content = <MainMenu />;
  if (error) {
    content = (
      <Section
        title="Error"
        color="bad"
        buttons={
          <Button icon="window-close" onClick={() => act('reset')}>
            Reset
          </Button>
        }
      >
        ## SYSTEM ERROR: {error}
      </Section>
    );
  } else if (target) {
    content = <HackInProgress />;
  }

  return (
    <NtosWindow width={500} height={400} theme="syndicate">
      <NtosWindow.Content>{content}</NtosWindow.Content>
    </NtosWindow>
  );
};

const MainMenu = (props) => {
  const { act, data } = useBackend<Data>();
  const { relays, focus } = data;

  return (
    <Section title="Target Selection" fill>
      <Box bold mb={1}>
        ## DoS traffic generator ready. Select Target Device.
      </Box>
      <LabeledList>
        <LabeledList.Item label="Targeted device ID">
          {focus || 'None'}
          <Button
            ml={2}
            icon="bug"
            disabled={!focus}
            onClick={() => act('execute')}
          >
            Execute
          </Button>
        </LabeledList.Item>
      </LabeledList>
      <Box mt={1} mb={1} color="label">
        Detected devices on network:
      </Box>
      <Box>
        {relays.map((uid) => (
          <Button
            key={uid}
            onClick={() =>
              // Funny consequence of tgui being better than nano at type preservation
              act('target_relay', { target: uid.toString() })
            }
            selected={focus === uid}
          >
            Relay #{uid}
          </Button>
        ))}
      </Box>
    </Section>
  );
};

const HackInProgress = (props) => {
  const { act, data } = useBackend<Data>();
  const { completion_fraction, speed } = data;
  return (
    <Section fontSize={1.5} className="Terminal__Monospace" fill>
      <Box>## DoS traffic generator active.</Box>
      <Box>
        ## Tx:{' '}
        <AnimatedNumber
          value={speed}
          format={(val) => round(val, 2) + 'GQ/s'}
        />
      </Box>
      <Box mt={1}>
        <HackingGrid percentage={completion_fraction} />
      </Box>
      <Button icon="eject" mt={1} onClick={() => act('reset')}>
        Abort
      </Button>
    </Section>
  );
};
