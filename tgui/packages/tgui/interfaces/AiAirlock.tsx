import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import {
  Button,
  Icon,
  LabeledList,
  Section,
  Stack,
} from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';

const dangerMap = {
  2: {
    color: 'good',
    localStatusText: 'Optimal',
  },
  1: {
    color: 'average',
    localStatusText: 'Caution',
  },
  0: {
    color: 'bad',
    localStatusText: 'Offline',
  },
};

type Data = {
  allowed: BooleanLike;
  /** Actively hacking in, show cute spinner */
  aiHacking: BooleanLike;
  canHack: BooleanLike;
  power: {
    main: number;
    main_timeleft: number;
    backup: number;
    backup_timeleft: number;
  };
  shock: number;
  shock_timeleft: number;
  id_scanner: BooleanLike;
  locked: BooleanLike;
  lights: BooleanLike;
  safe: BooleanLike;
  speed: BooleanLike;
  welded: BooleanLike;
  opened: BooleanLike;
  wires: {
    main_1: BooleanLike;
    main_2: BooleanLike;
    backup_1: BooleanLike;
    backup_2: BooleanLike;
    shock: BooleanLike;
    id_scanner: BooleanLike;
    bolts: BooleanLike;
    lights: BooleanLike;
    safe: BooleanLike;
    timing: BooleanLike;
  };
};

export const AiAirlock = (props) => {
  const { data } = useBackend<Data>();
  const { allowed } = data;

  return (
    <Window width={470} height={370}>
      <Window.Content>
        {allowed ? <AiAirlockContent /> : <AccessDenied />}
      </Window.Content>
    </Window>
  );
};

const AccessDenied = (props) => {
  const { act, data } = useBackend<Data>();
  const { aiHacking, canHack } = data;

  return (
    <Section fill color="bad" title="ACCESS DENIED">
      <Stack vertical align="center">
        <Stack.Item fontSize={1.2}>
          Unable to interface with airlock.
        </Stack.Item>
        {canHack ? (
          <Stack.Item>
            <Button icon="bug" onClick={() => act('hack')} disabled={aiHacking}>
              Hack Controls?
            </Button>
          </Stack.Item>
        ) : (
          <Stack.Item>Hacking impossible.</Stack.Item>
        )}
        {!!aiHacking && (
          <Stack.Item mt={2}>
            <Stack vertical align="center" fontSize={2}>
              <Stack.Item>HACKING</Stack.Item>
              <Stack.Item>
                <Icon name="spinner" spin />
              </Stack.Item>
            </Stack>
          </Stack.Item>
        )}
      </Stack>
    </Section>
  );
};

const AiAirlockContent = (props) => {
  return (
    <>
      <AiAirlockPowerStatus />
      <AiAirlockDoorControls />
    </>
  );
};

const AiAirlockPowerStatus = (props) => {
  const { act, data } = useBackend<Data>();

  const { power, shock, shock_timeleft, wires } = data;
  const { main, main_timeleft, backup, backup_timeleft } = power;

  const statusMain = dangerMap[main] || dangerMap[0];
  const statusBackup = dangerMap[backup] || dangerMap[0];
  const statusElectrify = dangerMap[shock] || dangerMap[0];

  return (
    <Section title="Power Status">
      <LabeledList>
        <LabeledList.Item
          label="Main"
          color={statusMain.color}
          buttons={
            <Button
              icon="lightbulb-o"
              disabled={!main}
              onClick={() => act('disrupt-main')}
            >
              Disrupt
            </Button>
          }
        >
          {main ? 'Online' : 'Offline'}{' '}
          {((!wires.main_1 || !wires.main_2) && '[Wires have been cut!]') ||
            (main_timeleft > 0 && `[${main_timeleft}s]`)}
        </LabeledList.Item>
        <LabeledList.Item
          label="Backup"
          color={statusBackup.color}
          buttons={
            <Button
              icon="lightbulb-o"
              disabled={!backup}
              onClick={() => act('disrupt-backup')}
            >
              Disrupt
            </Button>
          }
        >
          {backup ? 'Online' : 'Offline'}{' '}
          {((!wires.backup_1 || !wires.backup_2) && '[Wires have been cut!]') ||
            (backup_timeleft > 0 && `[${backup_timeleft}s]`)}
        </LabeledList.Item>
        <LabeledList.Item
          label="Electrify"
          color={statusElectrify.color}
          buttons={
            <>
              <Button
                icon="wrench"
                disabled={!wires.shock}
                selected={shock === 2}
                onClick={() => act('shock-restore')}
              >
                Restore
              </Button>
              <Button
                icon="bolt"
                disabled={!wires.shock}
                selected={shock !== 2 && shock_timeleft !== -1}
                onClick={() => act('shock-temp')}
              >
                Temporary
              </Button>
              <Button
                icon="bolt"
                disabled={!wires.shock}
                selected={shock !== 2 && shock_timeleft === -1}
                onClick={() => act('shock-perm')}
              >
                Permanent
              </Button>
            </>
          }
        >
          {shock === 2 ? 'Safe' : 'Electrified'}{' '}
          {(!wires.shock && '[Wires have been cut!]') ||
            (shock_timeleft > 0 && `[${shock_timeleft}s]`) ||
            (shock_timeleft === -1 && '[Permanent]')}
        </LabeledList.Item>
      </LabeledList>
    </Section>
  );
};

const AiAirlockDoorControls = (props) => {
  const { act, data } = useBackend<Data>();

  const { id_scanner, locked, lights, safe, speed, welded, opened, wires } =
    data;

  return (
    <Section title="Access and Door Control">
      <LabeledList>
        <LabeledList.Item
          label="ID Scan"
          color="bad"
          buttons={
            <Button
              icon={id_scanner ? 'power-off' : 'times'}
              selected={id_scanner}
              disabled={!wires.id_scanner}
              onClick={() => act('idscan-toggle')}
            >
              {id_scanner ? 'Enabled' : 'Disabled'}
            </Button>
          }
        >
          {!wires.id_scanner && '[Wires have been cut!]'}
        </LabeledList.Item>
        <LabeledList.Divider />
        <LabeledList.Item
          label="Door Bolts"
          color="bad"
          buttons={
            <Button
              icon={locked ? 'lock' : 'unlock'}
              selected={locked}
              disabled={!wires.bolts}
              onClick={() => act('bolt-toggle')}
            >
              {locked ? 'Lowered' : 'Raised'}
            </Button>
          }
        >
          {!wires.bolts && '[Wires have been cut!]'}
        </LabeledList.Item>
        <LabeledList.Item
          label="Door Bolt Lights"
          color="bad"
          buttons={
            <Button
              icon={lights ? 'power-off' : 'times'}
              selected={lights}
              disabled={!wires.lights}
              onClick={() => act('light-toggle')}
            >
              {lights ? 'Enabled' : 'Disabled'}
            </Button>
          }
        >
          {!wires.lights && '[Wires have been cut!]'}
        </LabeledList.Item>
        <LabeledList.Item
          label="Door Force Sensors"
          color="bad"
          buttons={
            <Button
              icon={safe ? 'power-off' : 'times'}
              selected={safe}
              disabled={!wires.safe}
              onClick={() => act('safe-toggle')}
            >
              {safe ? 'Enabled' : 'Disabled'}
            </Button>
          }
        >
          {!wires.safe && '[Wires have been cut!]'}
        </LabeledList.Item>
        <LabeledList.Item
          label="Door Timing Safety"
          color="bad"
          buttons={
            <Button
              icon={speed ? 'power-off' : 'times'}
              selected={speed}
              disabled={!wires.timing}
              onClick={() => act('speed-toggle')}
            >
              {speed ? 'Enabled' : 'Disabled'}
            </Button>
          }
        >
          {!wires.timing && '[Wires have been cut!]'}
        </LabeledList.Item>
        <LabeledList.Divider />
        <LabeledList.Item
          label="Door Control"
          color="bad"
          buttons={
            <Button
              icon={opened ? 'sign-out-alt' : 'sign-in-alt'}
              selected={opened}
              disabled={locked || welded}
              onClick={() => act('open-close')}
            >
              {opened ? 'Open' : 'Closed'}
            </Button>
          }
        >
          {!!(locked || welded) && (
            <span>
              [Door is {locked ? 'bolted' : ''}
              {locked && welded ? ' and ' : ''}
              {welded ? 'welded' : ''}!]
            </span>
          )}
        </LabeledList.Item>
      </LabeledList>
    </Section>
  );
};
