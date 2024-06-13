import { round } from 'common/math';
import { BooleanLike } from 'common/react';
import { useBackend } from 'tgui/backend';
import {
  AnimatedNumber,
  Button,
  LabeledList,
  ProgressBar,
  Section,
  Stack,
} from 'tgui/components';
import { NtosWindow } from 'tgui/layouts';

type DownloadedFile = {
  downloadname: string;
  downloaddesc: string;
  downloadsize: number;
  downloadspeed: number;
  downloadcompletion: number;
};

type Program = {
  filename: string;
  filedesc: string;
  fileinfo: string;
  size: number;
  icon: string;
  in_queue?: BooleanLike;
};

type Data = {
  error: string | null;
  downloaded_file: DownloadedFile | null;
  download_paused: BooleanLike;
  disk_size: number;
  disk_used: number;
  downloads_queue: string[];
  hackedavailable: BooleanLike;
  hacked_programs: Program[];
  downloadable_programs: Program[];
};

export const NtosDownloader = (props) => {
  const { act, data } = useBackend<Data>();

  const {
    error,
    downloaded_file,
    download_paused,
    disk_size,
    disk_used,
    downloads_queue,
    hackedavailable,
    hacked_programs,
    downloadable_programs,
  } = data;

  return (
    <NtosWindow width={600} height={700}>
      <NtosWindow.Content scrollable>
        {error ? (
          <Section title="ERROR" color="bad">
            <LabeledList>
              <LabeledList.Item label="Information">{error}</LabeledList.Item>
            </LabeledList>
            <Button icon="power-off" onClick={() => act('reset_error')}>
              Reset Program
            </Button>
          </Section>
        ) : (
          <>
            {downloaded_file && (
              <Section title="Download In Progress">
                <LabeledList>
                  <LabeledList.Item label="File Name">
                    {downloaded_file.downloadname}
                  </LabeledList.Item>
                  <LabeledList.Item label="File Description">
                    {downloaded_file.downloaddesc}
                  </LabeledList.Item>
                  <LabeledList.Item label="Transfer Rate">
                    <AnimatedNumber
                      value={downloaded_file.downloadspeed}
                      format={(num) => `${round(num, 2)} GQ/s`}
                    />
                  </LabeledList.Item>
                  <LabeledList.Item
                    label="Download Progress"
                    buttons={
                      <>
                        <Button
                          icon={download_paused ? 'play' : 'pause'}
                          tooltip={
                            download_paused
                              ? 'Resume Download'
                              : 'Pause Download'
                          }
                          onClick={() => act('download_pause')}
                        />
                        <Button
                          icon="stop"
                          tooltip="Stop Download"
                          onClick={() => act('download_stop')}
                        />
                      </>
                    }
                  >
                    <ProgressBar
                      value={downloaded_file.downloadcompletion}
                      maxValue={downloaded_file.downloadsize}
                    >
                      <AnimatedNumber
                        value={downloaded_file.downloadcompletion}
                      />
                      /
                      <AnimatedNumber value={downloaded_file.downloadsize} />
                      GQ
                    </ProgressBar>
                  </LabeledList.Item>
                </LabeledList>
              </Section>
            )}
            {downloads_queue.length > 0 && (
              <Section title="Download Queue">
                <Stack vertical>
                  {downloads_queue.map((file) => (
                    <Stack.Item key={file}>
                      <Button
                        inline
                        icon="times"
                        pr={1}
                        onClick={() => act('remove_queued', { file })}
                      />{' '}
                      {file}
                    </Stack.Item>
                  ))}
                </Stack>
              </Section>
            )}
            <SoftwareRepository
              title="Primary software repository"
              show_disk
              downloadable_programs={downloadable_programs}
            />
            {hacked_programs.length > 0 && (
              <SoftwareRepository
                title="*UNKNOWN* software repository"
                evil
                downloadable_programs={hacked_programs}
              />
            )}
          </>
        )}
        <Section>NTOS v2.0.4b Copyright NanoTrasen 2557 - 2559</Section>
      </NtosWindow.Content>
    </NtosWindow>
  );
};

export const SoftwareRepository = (
  props: Pick<Data, 'downloadable_programs'> & {
    title: string;
    show_disk?: boolean;
    evil?: boolean;
  },
) => {
  const { act, data } = useBackend<Data>();
  const { disk_size, disk_used, downloaded_file } = data;

  const { downloadable_programs, title, show_disk, evil } = props;

  return (
    <Section title={title} className={evil ? 'theme-malfunction' : ''}>
      {show_disk && (
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
      )}
      <Stack pt={1} vertical zebra>
        <Stack.Item pl={1} pr={1}>
          <Stack>
            <Stack.Item basis="5%" />
            <Stack.Item basis="20%">Name</Stack.Item>
            <Stack.Item grow>Description</Stack.Item>
            <Stack.Item shrink>Size</Stack.Item>
          </Stack>
        </Stack.Item>
        {downloadable_programs.map((program) => (
          <Stack.Item p={1} key={program.filename}>
            <Stack align="center">
              <Stack.Item shrink>
                <Button
                  disabled={
                    program.in_queue ||
                    program.filename === downloaded_file?.downloadname
                  }
                  icon="download"
                  tooltipPosition="left"
                  tooltip="Download"
                  onClick={() =>
                    act('download_file', { file: program.filename })
                  }
                />
              </Stack.Item>
              <Stack.Item basis="20%">{program.filedesc}</Stack.Item>
              <Stack.Item grow>{program.fileinfo}</Stack.Item>
              <Stack.Item shrink>{program.size}GQ</Stack.Item>
            </Stack>
          </Stack.Item>
        ))}
      </Stack>
    </Section>
  );
};
