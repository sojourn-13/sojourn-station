import { useEffect, useState } from 'react';
import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import {
  Box,
  Button,
  Divider,
  Icon,
  Image,
  Knob,
  Section,
  Stack,
} from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';

type Data = {
  panel_open: BooleanLike;
  safeties: BooleanLike;
  isSuperUV: BooleanLike;
  isUV: BooleanLike;
  isOpen: BooleanLike;
  occupied: BooleanLike;
  locked: BooleanLike;
  helmet: string;
  helmet_icon: string | null;
  suit: string;
  suit_icon: string | null;
  mask: string;
  mask_icon: string | null;
};

export const SuitStorageUnit = (props) => {
  const { act, data } = useBackend<Data>();

  const { panel_open, isUV } = data;

  // Three states:
  // - UV Active
  // - Maint Panel
  // - Normal

  let content = <MainMenu />;
  if (isUV) {
    content = <UVInProgress />;
  } else if (panel_open) {
    content = <MaintenancePanel />;
  }

  return (
    <Window width={360} height={340}>
      <Window.Content>{content}</Window.Content>
    </Window>
  );
};

export const UVInProgress = (props) => {
  const { data } = useBackend<Data>();

  const { isSuperUV, occupied } = data;

  const [mt, setMt] = useState(0);
  const [dir, setDir] = useState(1);

  const DISTANCE = 0.6;
  const DELAY = 5;
  useEffect(() => {
    let interval = setInterval(() => {
      setMt((mt) => {
        let x = mt + DISTANCE * dir;

        if (x > 80) {
          setDir(-1);
        } else if (x < 0) {
          setDir(1);
        }

        return x;
      });
    }, DELAY);
    return () => clearInterval(interval);
  });

  return (
    <Section title="UV Cauterization In Progress" position="relative" fill>
      {/* Absolute means it'll go over the stack below */}
      <Box
        position="absolute"
        left={0}
        top={mt + '%'}
        height={6}
        width="100%"
        className={
          isSuperUV
            ? 'SuitStorageUnit__gradient-35'
            : 'SuitStorageUnit__gradient-185'
        }
      />
      <Stack fill align="center" justify="center">
        <Stack.Item>
          <Icon
            name={occupied ? 'user' : 'user-astronaut'}
            color={occupied ? 'bad' : ''}
            size={8}
          />
        </Stack.Item>
      </Stack>
    </Section>
  );
};

export const MaintenancePanel = (props) => {
  const { act, data } = useBackend<Data>();

  const { isSuperUV, safeties } = data;

  return (
    <Section title="Maintenance Panel" fill>
      <Stack vertical align="center" justify="space-around" height="100%">
        <Stack.Item>
          <Stack align="flex-end">
            <Stack.Item>185nm</Stack.Item>
            <Stack.Item>
              <Box textAlign="center" fontSize={1.5}>
                &lambda;
              </Box>
              <Knob
                color={isSuperUV ? 'bad' : 'good'}
                size={2}
                value={isSuperUV ? 1 : 0}
                minValue={0}
                maxValue={1}
                step={1}
                format={(val) => (val ? '15nm' : '185nm')}
                onChange={(e, on) => {
                  act('toggle_super_UV', { on });
                }}
              />
            </Stack.Item>
            <Stack.Item>15nm</Stack.Item>
          </Stack>
        </Stack.Item>
        <Stack.Item mt={2}>
          <Stack align="center">
            <Stack.Item>
              <Button
                color="bad"
                fontSize={2}
                width={4}
                height={4}
                style={{ borderRadius: '50px' }}
                onClick={() => act('toggle_safeties')}
              >
                <Icon name="exclamation-triangle" inline ml={-0.5} mt={0.3} />
              </Button>
            </Stack.Item>
            <Stack.Item>
              <Icon
                size={2}
                name={safeties ? 'circle-o' : 'circle'}
                color={safeties ? '' : 'bad'}
              />
            </Stack.Item>
            <Stack.Item>
              <Icon
                size={2}
                name={safeties ? 'circle' : 'circle-o'}
                color={safeties ? 'green' : ''}
              />
            </Stack.Item>
          </Stack>
        </Stack.Item>
      </Stack>
    </Section>
  );
};

export const MainMenu = (props) => {
  const { act, data } = useBackend<Data>();

  const {
    isOpen,
    occupied,
    locked,
    helmet,
    helmet_icon,
    suit,
    suit_icon,
    mask,
    mask_icon,
  } = data;

  return (
    <Stack height="100%" fill>
      <Stack.Item height="100%" basis="50%">
        <Section title="Storage" fill height="100%">
          <Stack vertical fill align="center" justify="space-around">
            <Stack.Item width="100%">
              <StorageRow
                name={helmet}
                icon={helmet_icon}
                emptyText="No Helmet Detected"
                toasterIcon="hard-hat"
                isOpen={isOpen}
                onEject={() => act('dispense_helmet')}
              />
            </Stack.Item>
            <Stack.Item width="100%">
              <StorageRow
                name={mask}
                icon={mask_icon}
                emptyText="No Mask Detected"
                toasterIcon="lungs"
                isOpen={isOpen}
                onEject={() => act('dispense_mask')}
              />
            </Stack.Item>
            <Stack.Item width="100%">
              <StorageRow
                name={suit}
                icon={suit_icon}
                emptyText="No Suit Detected"
                toasterIcon="user-astronaut"
                isOpen={isOpen}
                onEject={() => act('dispense_suit')}
              />
            </Stack.Item>
          </Stack>
        </Section>
      </Stack.Item>
      <Stack.Item basis="50%">
        <Section title="Controls" fill height="32%">
          <Button
            fluid
            fontSize={1.25}
            textAlign="center"
            disabled={locked}
            icon={isOpen ? 'door-open' : 'door-closed'}
            selected={isOpen}
            onClick={() => act('toggle_open')}
          >
            {isOpen ? 'Unit Opened' : 'Unit Closed'}
          </Button>
          <Button
            fluid
            fontSize={1.1}
            disabled={isOpen}
            textAlign="center"
            icon={locked ? 'lock' : 'lock-open'}
            selected={locked}
            onClick={() => act('toggle_lock')}
          >
            {locked ? 'Unit Locked' : 'Unit Unlocked'}
          </Button>
        </Section>
        <Section title="Disinfection" fill height="66%">
          {!!occupied && (
            <Box color="bad" textAlign="center">
              <Box>
                <Icon name="user" size={4} />
              </Box>
              WARNING: Biological Entity detected inside Unit&apos;s storage.
              <br />
              <Button
                color="bad"
                inline
                onClick={() => act('eject_guy')}
                mt={0.5}
                icon="eject"
              >
                Remove?
              </Button>
              <Divider />
            </Box>
          )}
          <Button.Confirm
            fluid
            color="bad"
            disabled={isOpen}
            icon="pump-medical"
            confirmIcon="virus-slash"
            textAlign="center"
            onClick={() => act('start_UV')}
          >
            Start Disinfection
          </Button.Confirm>
        </Section>
      </Stack.Item>
    </Stack>
  );
};

export type StorageProps = {
  name: string;
  icon: string | null;
  emptyText: string;
  toasterIcon: string;
  isOpen: BooleanLike;
  onEject: () => void;
};

export const StorageRow = (props: StorageProps) => {
  const { name, icon, emptyText, toasterIcon, isOpen, onEject } = props;

  return (
    <Stack align="center" justify="space-around" width="100%">
      <Stack.Item>
        <StorageSlot
          name={name}
          icon={icon}
          emptyText={emptyText}
          toasterIcon={toasterIcon}
          isOpen={isOpen}
          onEject={onEject}
        />
      </Stack.Item>
    </Stack>
  );
};

export const StorageSlot = (props: StorageProps) => {
  const { name, icon, emptyText, toasterIcon, isOpen, onEject } = props;

  return (
    <Stack align="center" vertical>
      <Stack.Item>
        {isOpen ? (
          <Button
            disabled={!name}
            width={4}
            height={4}
            style={{
              border: '1px solid #3e6189',
              borderRadius: '5%',
            }}
            onClick={onEject}
            textAlign="center"
          >
            {icon ? (
              <Image src={icon} mt={-0.5} ml={-1} width={4} height={4} />
            ) : (
              <Icon name={toasterIcon} ml={0.25} size={2} mt={2} />
            )}
          </Button>
        ) : (
          <Box
            backgroundColor="black"
            width={4}
            height={4}
            style={{
              border: '1px solid #3e6189',
              borderRadius: '5%',
            }}
            textAlign="center"
          >
            {icon ? (
              <Image src={icon} mt={-0.5} width={4} height={4} />
            ) : (
              <Icon name={toasterIcon} size={2} mt={2} />
            )}
          </Box>
        )}
      </Stack.Item>
      <Stack.Item color={name ? 'good' : 'label'}>
        {name || emptyText}
      </Stack.Item>
    </Stack>
  );
};
