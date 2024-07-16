import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import {
  Box,
  Button,
  LabeledList,
  NoticeBox,
  ProgressBar,
  Section,
} from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';

import { InterfaceLockNoticeBox } from './common/InterfaceLockNoticeBox';

export const Apc = (props) => {
  return (
    <Window width={450} height={445}>
      <Window.Content scrollable>
        <ApcContent />
      </Window.Content>
    </Window>
  );
};

type Data = {
  locked: BooleanLike;
  failTime: number;
  isOperating: BooleanLike;
  externalPower: number;
  powerCellStatus: number;
  chargeMode: BooleanLike;
  chargingStatus: number;
  chargingPowerDisplay: number;
  totalLoad: number;
  coverLocked: BooleanLike;
  siliconUser: BooleanLike;
  powerChannels: {
    title: string;
    powerLoad: number;
    status: number;
    topicParams: {
      auto: { [key: string]: number };
      on: { [key: string]: number };
      off: { [key: string]: number };
    };
  }[];
  // Unused, currently
  malfStatus: number;
  remoteAccess: BooleanLike;
  emergencyLights: BooleanLike;
  nightshiftLights: BooleanLike;
  disable_nightshift_toggle: BooleanLike;
};

const powerStatusMap = {
  2: {
    color: 'good',
    externalPowerText: 'External Power',
    chargingText: 'Fully Charged',
  },
  1: {
    color: 'average',
    externalPowerText: 'Low External Power',
    chargingText: 'Charging: ',
  },
  0: {
    color: 'bad',
    externalPowerText: 'No External Power',
    chargingText: 'Not Charging',
  },
};

const malfMap = {
  1: {
    icon: 'terminal',
    content: 'Override Programming',
    action: 'hack',
  },
  2: {
    icon: 'caret-square-down',
    content: 'Shunt Core Process',
    action: 'occupy',
  },
  3: {
    icon: 'caret-square-left',
    content: 'Return to Main Core',
    action: 'deoccupy',
  },
  4: {
    icon: 'caret-square-down',
    content: 'Shunt Core Process',
    action: 'occupy',
  },
};

const ApcContent = (props) => {
  const { act, data } = useBackend<Data>();
  const locked = data.locked && !data.siliconUser;
  const externalPowerStatus =
    powerStatusMap[data.externalPower] || powerStatusMap[0];
  const chargingStatus =
    powerStatusMap[data.chargingStatus] || powerStatusMap[0];
  const channelArray = data.powerChannels || [];
  const malfStatus = malfMap[data.malfStatus] || malfMap[0];
  const adjustedCellChange = data.powerCellStatus / 100;
  if (data.failTime > 0) {
    return (
      <NoticeBox info textAlign="center" mb={0}>
        <b>
          <h3>SYSTEM FAILURE</h3>
        </b>
        I/O regulators have malfunctioned! <br />
        Awaiting system reboot.
        <br />
        Executing software reboot in {data.failTime} seconds...
        <br />
        <br />
        <Button
          icon="sync"
          tooltip="Force an interface reset."
          tooltipPosition="bottom"
          onClick={() => act('reboot')}
        >
          Reboot Now
        </Button>
      </NoticeBox>
    );
  }
  return (
    <>
      <InterfaceLockNoticeBox
        siliconUser={data.remoteAccess || data.siliconUser}
        preventLocking={data.remoteAccess}
      />
      <Section title="Power Status">
        <LabeledList>
          <LabeledList.Item
            label="Main Breaker"
            color={externalPowerStatus.color}
            buttons={
              <Button
                icon={data.isOperating ? 'power-off' : 'times'}
                selected={data.isOperating && !locked}
                disabled={locked}
                onClick={() => act('breaker')}
              >
                {data.isOperating ? 'On' : 'Off'}
              </Button>
            }
          >
            [ {externalPowerStatus.externalPowerText} ]
          </LabeledList.Item>
          <LabeledList.Item label="Power Cell">
            <ProgressBar color="good" value={adjustedCellChange} />
          </LabeledList.Item>
          <LabeledList.Item
            label="Charge Mode"
            color={chargingStatus.color}
            buttons={
              <Button
                icon={data.chargeMode ? 'sync' : 'times'}
                disabled={locked}
                onClick={() => act('charge')}
              >
                {data.chargeMode ? 'Auto' : 'Off'}
              </Button>
            }
          >
            [{' '}
            {chargingStatus.chargingText +
              (data.chargingStatus === 1 ? data.chargingPowerDisplay : '')}{' '}
            ]
          </LabeledList.Item>
        </LabeledList>
      </Section>
      <Section title="Power Channels">
        <LabeledList>
          {channelArray.map((channel) => {
            const { topicParams } = channel;
            return (
              <LabeledList.Item
                key={channel.title}
                label={channel.title}
                buttons={
                  <>
                    <Box
                      inline
                      mx={2}
                      color={channel.status >= 2 ? 'good' : 'bad'}
                    >
                      {channel.status >= 2 ? 'On' : 'Off'}
                    </Box>
                    <Button
                      icon="sync"
                      selected={
                        !locked &&
                        (channel.status === 1 || channel.status === 3)
                      }
                      disabled={locked}
                      onClick={() => act('channel', topicParams.auto)}
                    >
                      Auto
                    </Button>
                    <Button
                      icon="power-off"
                      selected={!locked && channel.status === 2}
                      disabled={locked}
                      onClick={() => act('channel', topicParams.on)}
                    >
                      On
                    </Button>
                    <Button
                      icon="times"
                      selected={!locked && channel.status === 0}
                      disabled={locked}
                      onClick={() => act('channel', topicParams.off)}
                    >
                      Off
                    </Button>
                  </>
                }
              >
                {channel.powerLoad}
              </LabeledList.Item>
            );
          })}
          <LabeledList.Item label="Total Load">
            <b>{data.totalLoad}</b>
          </LabeledList.Item>
        </LabeledList>
      </Section>
      <Section
        title="Misc"
        buttons={
          !!data.siliconUser && (
            <>
              {!!data.malfStatus && (
                <Button
                  icon={malfStatus.icon}
                  color="bad"
                  onClick={() => act(malfStatus.action)}
                >
                  {malfStatus.content}
                </Button>
              )}
              <Button icon="lightbulb-o" onClick={() => act('overload')}>
                Overload
              </Button>
            </>
          )
        }
      >
        <LabeledList>
          <LabeledList.Item
            label="Cover Lock"
            buttons={
              <Button
                tooltip="APC cover can be pried open with a crowbar."
                icon={data.coverLocked ? 'lock' : 'unlock'}
                disabled={locked}
                onClick={() => act('cover')}
              >
                {data.coverLocked ? 'Engaged' : 'Disengaged'}
              </Button>
            }
          />
          <LabeledList.Item
            label="Emergency Lighting"
            buttons={
              <Button
                tooltip="Lights use internal power cell when there is no power available."
                icon="lightbulb-o"
                disabled={locked}
                onClick={() => act('emergency_lighting')}
              >
                {data.emergencyLights ? 'Enabled' : 'Disabled'}
              </Button>
            }
          />
          <LabeledList.Item
            label="Night Shift Lighting"
            buttons={
              <Button
                tooltip="Dim lights to reduce power consumption."
                icon="lightbulb-o"
                disabled={data.disable_nightshift_toggle}
                onClick={() => act('toggle_nightshift')}
              >
                {data.nightshiftLights ? 'Enabled' : 'Disabled'}
              </Button>
            }
          />
        </LabeledList>
      </Section>
    </>
  );
};
