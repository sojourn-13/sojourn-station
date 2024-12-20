import { useBackend } from 'tgui/backend';
import { Button } from 'tgui/components';
import { RADIO_CHANNELS } from 'tgui/constants';
import { Window } from 'tgui/layouts';
import { Box, LabeledList, NumberInput, Section } from 'tgui-core/components';
import { round, toFixed } from 'tgui-core/math';
import { BooleanLike } from 'tgui-core/react';

type Data = {
  rawfreq: number;
  minFrequency: number;
  maxFrequency: number;
  listening: BooleanLike;
  broadcasting: BooleanLike;
  subspace: BooleanLike;
  subspaceSwitchable: BooleanLike;
  chan_list: {
    chan: string;
    display_name: string;
    secure_channel: BooleanLike;
    sec_channel_listen: BooleanLike;
    freq: number;
  }[];
  loudspeaker: BooleanLike;
  loudspeakerSwitchable: BooleanLike;
  mic_cut: BooleanLike;
  spk_cut: BooleanLike;
  useSyndMode: BooleanLike;
};

export const Radio = (props) => {
  const { act, data } = useBackend<Data>();
  const {
    rawfreq,
    minFrequency,
    maxFrequency,
    listening,
    broadcasting,
    subspace,
    subspaceSwitchable,
    chan_list,
    loudspeaker,
    loudspeakerSwitchable,
    mic_cut,
    spk_cut,
    useSyndMode,
  } = data;

  const tunedChannel = RADIO_CHANNELS.find(
    (channel) => channel.freq === Number(rawfreq),
  );

  // Calculate window height
  let height = 156;
  if (chan_list && chan_list.length > 0) {
    height += chan_list.length * 28 + 6;
  } else {
    height += 24;
  }
  if (subspaceSwitchable) {
    height += 19;
  }
  if (loudspeakerSwitchable) {
    height += 19;
  }
  return (
    <Window width={310} height={height} theme={useSyndMode ? 'syndicate' : ''}>
      <Window.Content>
        <Section>
          <LabeledList>
            <LabeledList.Item label="Frequency">
              <NumberInput
                animated
                unit="kHz"
                step={0.2}
                stepPixelSize={10}
                minValue={minFrequency / 10}
                maxValue={maxFrequency / 10}
                value={rawfreq / 10}
                format={(value) => toFixed(value, 1)}
                onDrag={(value) =>
                  act('setFrequency', {
                    freq: round(value * 10, 1),
                  })
                }
              />
              {tunedChannel && (
                <Box inline color={tunedChannel.color} ml={2}>
                  [{tunedChannel.name}]
                </Box>
              )}
            </LabeledList.Item>
            <LabeledList.Item label="Audio">
              <Button
                textAlign="center"
                width="37px"
                icon={listening ? 'volume-up' : 'volume-mute'}
                selected={listening}
                disabled={spk_cut}
                onClick={() => act('listen')}
              />
              <Button
                textAlign="center"
                width="37px"
                icon={broadcasting ? 'microphone' : 'microphone-slash'}
                selected={broadcasting}
                disabled={mic_cut}
                onClick={() => act('broadcast')}
              />
              {!!subspaceSwitchable && (
                <Box>
                  <Button
                    icon="bullhorn"
                    selected={subspace}
                    onClick={() => act('subspace')}
                  >
                    Subspace Tx {subspace ? 'ON' : 'OFF'}
                  </Button>
                </Box>
              )}
              {!!loudspeakerSwitchable && (
                <Box>
                  <Button
                    icon={loudspeaker ? 'volume-up' : 'volume-mute'}
                    selected={loudspeaker}
                    onClick={() => act('toggleLoudspeaker')}
                  >
                    Loudspeaker
                  </Button>
                </Box>
              )}
            </LabeledList.Item>
          </LabeledList>
        </Section>
        <Section title="Channels">
          {(!chan_list || chan_list.length === 0) && (
            <Box inline color="bad">
              No channels detected.
            </Box>
          )}
          <LabeledList>
            {!chan_list
              ? null
              : chan_list.map((channel) => {
                  const channeldata = RADIO_CHANNELS.find(
                    (c) => c.freq === Number(channel.freq),
                  );
                  let color = 'default';
                  if (channeldata) {
                    color = channeldata.color;
                  }
                  return (
                    <LabeledList.Item
                      key={channel.chan}
                      label={channel.display_name}
                      labelColor={color}
                      textAlign="right"
                    >
                      {channel.secure_channel && subspace ? (
                        <Button
                          icon={
                            !channel.sec_channel_listen
                              ? 'check-square-o'
                              : 'square-o'
                          }
                          selected={!channel.sec_channel_listen}
                          content={!channel.sec_channel_listen ? 'On' : 'Off'}
                          onClick={() =>
                            act('channel', {
                              channel: channel.chan,
                            })
                          }
                        />
                      ) : (
                        <Button
                          content="Switch"
                          selected={channel.freq === rawfreq}
                          onClick={() =>
                            act('specFreq', {
                              channel: channel.chan,
                            })
                          }
                        />
                      )}
                    </LabeledList.Item>
                  );
                })}
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
