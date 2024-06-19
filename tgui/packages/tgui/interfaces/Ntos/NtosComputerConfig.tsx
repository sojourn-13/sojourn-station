import { BooleanLike } from 'common/react';
import { toTitleCase } from 'common/string';
import { useBackend } from 'tgui/backend';
import {
  Box,
  Button,
  Dropdown,
  LabeledList,
  ProgressBar,
  Section,
} from 'tgui/components';
import { formatPower } from 'tgui/format';
import { NtosWindow } from 'tgui/layouts';
import { NTOSData } from 'tgui/layouts/NtosWindow';

type Hardware = {
  name: string;
  desc: string;
  enabled: BooleanLike;
  critical: BooleanLike;
  powerusage: number;
};

type Data = {
  disk_size: number;
  disk_used: number;
  power_usage: number;
  battery_exists: BooleanLike;
  battery_rating: number;
  battery_percent: number;
  print_language: string;
  hardware: Hardware[];
  available_themes: string[];
} & NTOSData;

export const NtosComputerConfig = (props) => {
  const { act, data } = useBackend<Data>();

  const {
    disk_size,
    disk_used,
    power_usage,
    battery_exists,
    battery_rating,
    battery_percent,
    available_themes,
    PC_device_theme,
    print_language,
    hardware,
  } = data;

  const theme_selection_options = ['Default', ...available_themes];

  return (
    <NtosWindow width={700} height={700}>
      <NtosWindow.Content scrollable>
        <Section title="Power Supply">
          <LabeledList>
            <LabeledList.Item label="Battery Status">
              {battery_exists ? 'Active' : 'Not Available'}
            </LabeledList.Item>
            {battery_exists && (
              <>
                <LabeledList.Item label="Battery Rating">
                  {battery_rating}
                </LabeledList.Item>
                <LabeledList.Item label="Battery Charge">
                  <ProgressBar
                    ranges={{
                      bad: [0, 25],
                      average: [25, 50],
                      good: [50, Number.POSITIVE_INFINITY],
                    }}
                    value={battery_percent}
                    maxValue={100}
                  />
                </LabeledList.Item>
                <LabeledList.Item label="Power Usage">
                  {formatPower(power_usage)}
                </LabeledList.Item>
              </>
            )}
          </LabeledList>
        </Section>
        <Section title="File System">
          <LabeledList>
            <LabeledList.Item label="Used Capacity">
              <ProgressBar
                ranges={{
                  good: [0, disk_size * 0.75],
                  average: [disk_size * 0.75, disk_size * 0.9],
                  bad: [disk_size * 0.9, Number.POSITIVE_INFINITY],
                }}
                value={disk_used}
                maxValue={disk_size}
              >
                {disk_used}/{disk_size} GQ
              </ProgressBar>
            </LabeledList.Item>
          </LabeledList>
        </Section>
        <Section title="Customization">
          <LabeledList>
            <LabeledList.Item label="Theme" verticalAlign="middle">
              <Dropdown
                width="100%"
                options={theme_selection_options}
                onSelected={(theme) => {
                  if (theme === 'Default') {
                    act('set_device_theme', { theme: '' });
                  } else {
                    act('set_device_theme', { theme });
                  }
                }}
                selected={PC_device_theme || 'Default'}
              />
            </LabeledList.Item>
            {!!print_language && (
              <LabeledList.Item label="Printer Language">
                <Button onClick={() => act('edit_language')}>
                  {print_language}
                </Button>
              </LabeledList.Item>
            )}
          </LabeledList>
        </Section>
        <Section title="Computer Components">
          {hardware.map((hw) => (
            <Section
              key={hw.name}
              title={toTitleCase(hw.name)}
              buttons={
                !hw.critical && (
                  <Button
                    icon="power-off"
                    selected={hw.enabled}
                    tooltip={hw.enabled ? 'Turn Off' : 'Turn On'}
                    onClick={() =>
                      act('PC_toggle_component', { component: hw.name })
                    }
                  >
                    {hw.enabled ? 'On' : 'Off'}
                  </Button>
                )
              }
            >
              <Box italic mb={1}>
                {hw.desc}
              </Box>
              <LabeledList>
                <LabeledList.Item label="Power Usage">
                  {formatPower(hw.powerusage)}
                </LabeledList.Item>
              </LabeledList>
            </Section>
          ))}
        </Section>
        <Section>NTOS v2.0.4b Copyright NanoTrasen 2557 - 2559</Section>
      </NtosWindow.Content>
    </NtosWindow>
  );
};
