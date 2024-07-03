import { BooleanLike } from 'common/react';
import { ReactNode } from 'react';
import { useBackend } from 'tgui/backend';
import {
  Box,
  Button,
  ProgressBar,
  Section,
  Stack,
  Table,
} from 'tgui/components';
import { NtosWindow } from 'tgui/layouts';
import { NTOSData } from 'tgui/layouts/NtosWindow';

type File = {
  filename: string;
  filetype: string;
  size: number;
  clone_able: BooleanLike;
  undeletable: BooleanLike;
};

type OpenFileData = {
  filename: string;
  filedata: string;
};

type Disk = {
  read_only: BooleanLike;
  autorun: string | null;
  disk_name: string;
  max_capacity: number;
  used_capacity: number;
  files: File[];
};

type Data = {
  error: string | null;
  internal_disk: Disk;
  portable_disk: Disk;
  open_file: OpenFileData | null;
} & NTOSData;

export const NtosFileManager = (props) => {
  const { act, data } = useBackend<Data>();

  const { error, open_file, internal_disk, portable_disk } = data;

  let content = (
    <>
      <DiskView disk={internal_disk} title="Available Files (Local)" />
      {!!portable_disk && (
        <DiskView
          disk={portable_disk}
          title={`Available Files (${portable_disk.disk_name || 'Portable Device'})`}
          portable
        />
      )}
    </>
  );

  if (error) {
    content = (
      <Section textColor="bad" title="An error has occured">
        <Box>Additional information: {error}</Box>
        <Box italic>
          Please try again. If the problem persists contact your system
          administrator for assistance.
        </Box>
        <Button mt={1} fluid onClick={() => act('close_file')}>
          Back To Menu
        </Button>
      </Section>
    );
  } else if (open_file) {
    content = <OpenFile file={open_file} />;
  }

  return (
    <NtosWindow width={600} height={700}>
      <NtosWindow.Content scrollable>{content}</NtosWindow.Content>
    </NtosWindow>
  );
};

const DiskView = (props: { disk: Disk; title: string; portable?: boolean }) => {
  const { act, data } = useBackend<Data>();

  const { disk, title, portable } = props;

  let titleButtons: ReactNode[] = [];

  if (!disk.read_only && !portable) {
    titleButtons.push(
      <Button icon="file-upload" ml={1} onClick={() => act('new_text_file')}>
        New File
      </Button>,
    );
  }

  if (portable) {
    titleButtons.push(
      <Button
        icon="eject"
        tooltip="Eject Disk"
        onClick={() => act('PC_eject_disk')}
      >
        Eject
      </Button>,
    );
  }

  return (
    <Section title={title} buttons={titleButtons.map((button) => button)}>
      <ProgressBar
        ranges={{
          good: [0, disk.max_capacity * 0.75],
          average: [disk.max_capacity * 0.75, disk.max_capacity * 0.9],
          bad: [disk.max_capacity * 0.9, Number.POSITIVE_INFINITY],
        }}
        color={disk.read_only ? 'bad' : ''}
        value={disk.used_capacity}
        maxValue={disk.max_capacity}
      >
        {disk.used_capacity}/{disk.max_capacity} GQ{' '}
        {disk.read_only ? '(READ ONLY)' : ''}
      </ProgressBar>
      <Table mt={1}>
        <Table.Row header>
          <Table.Cell>Name</Table.Cell>
          <Table.Cell textAlign="center" collapsing>
            Type
          </Table.Cell>
          <Table.Cell textAlign="center" collapsing>
            Size
          </Table.Cell>
          <Table.Cell textAlign="right" collapsing>
            Operations
          </Table.Cell>
        </Table.Row>
        {disk.files.map((file) => (
          <FileTableRow
            key={file.filename}
            file={file}
            portable={portable}
            disk={disk}
          />
        ))}
      </Table>
    </Section>
  );
};

const FileTableRow = (props: {
  portable?: boolean;
  file: File;
  disk: Disk;
}) => {
  const { act, data } = useBackend<Data>();
  const { file, portable, disk } = props;

  const isSystemFile = file.filename === 'AUTORUN' && file.filetype === 'DAT';

  const readOnly = disk.read_only || file.undeletable;

  return (
    <Table.Row>
      <Table.Cell color={isSystemFile ? 'gray' : ''} verticalAlign="middle">
        {file.filename}{' '}
        {!!isSystemFile && (
          <Box inline color="bad">
            [System File]
          </Box>
        )}
      </Table.Cell>
      <Table.Cell
        color={isSystemFile ? 'gray' : ''}
        textAlign="center"
        verticalAlign="middle"
      >
        {file.filetype}
      </Table.Cell>
      <Table.Cell
        color={isSystemFile ? 'gray' : ''}
        textAlign="center"
        verticalAlign="middle"
      >
        {file.size}GQ
      </Table.Cell>
      <Table.Cell textAlign="right" verticalAlign="middle" ml={1} pb={0.5}>
        <Stack justify="flex-end">
          {!portable && (
            <>
              {file.filetype === 'PRG' && (
                <Stack.Item>
                  <Button.Checkbox
                    checked={file.filename === disk.autorun}
                    tooltip="Autorun"
                    tooltipPosition="left"
                    onClick={() =>
                      act('PC_setautorun', { program: file.filename })
                    }
                  >
                    AR
                  </Button.Checkbox>
                </Stack.Item>
              )}
              <Stack.Item>
                <Button
                  icon="book-open"
                  tooltip="View"
                  tooltipPosition="left"
                  onClick={() => act('set_open_file', { file: file.filename })}
                />
              </Stack.Item>
              <Stack.Item>
                <Button
                  icon="edit"
                  tooltip={readOnly ? 'READ ONLY' : 'Rename'}
                  tooltipPosition="left"
                  disabled={readOnly}
                  onClick={() => act('rename_file', { file: file.filename })}
                />
              </Stack.Item>
              <Stack.Item>
                <Button
                  icon="copy"
                  tooltip={
                    readOnly
                      ? 'READ ONLY'
                      : file.clone_able
                        ? 'Clone'
                        : 'CLONING DISABLED'
                  }
                  tooltipPosition="left"
                  disabled={!file.clone_able || readOnly}
                  onClick={() => act('clone_file', { file: file.filename })}
                />
              </Stack.Item>
            </>
          )}
          {!!data.portable_disk &&
            (portable
              ? !data.internal_disk.read_only
              : !data.portable_disk.read_only) && (
              <Stack.Item>
                <Button
                  disabled={!file.clone_able || file.undeletable}
                  icon="copy-o"
                  tooltip={
                    file.undeletable
                      ? 'READ ONLY'
                      : file.clone_able
                        ? `Copy to ${portable ? 'Hard Drive' : 'Portable Drive'}`
                        : 'CLONING DISABLED'
                  }
                  onClick={() =>
                    act(portable ? 'copy_from_usb' : 'copy_to_usb', {
                      file: file.filename,
                    })
                  }
                />
              </Stack.Item>
            )}
          <Stack.Item>
            <Button
              color="red"
              icon="trash-alt"
              tooltip={readOnly ? 'READ ONLY' : 'Delete'}
              tooltipPosition="left"
              disabled={readOnly}
              onClick={() =>
                act('delete_file', { file: file.filename, portable })
              }
            />
          </Stack.Item>
        </Stack>
      </Table.Cell>
    </Table.Row>
  );
};

const OpenFile = (props: { file: OpenFileData }) => {
  const { act } = useBackend();
  const { file } = props;

  return (
    <Section
      fill
      title={`Viewing file ${file.filename}`}
      buttons={
        <>
          <Button icon="edit" tooltip="Edit" onClick={() => act('edit_file')} />
          <Button
            icon="print"
            tooltip="Print"
            onClick={() => act('print_file')}
          />
          <Button
            icon="window-close-o"
            tooltip="Close"
            onClick={() => act('close_file')}
          />
        </>
      }
    >
      {/* Safety: This is pencode. */}
      {/* eslint-disable-next-line react/no-danger */}
      <div dangerouslySetInnerHTML={{ __html: file.filedata }} />
    </Section>
  );
};
