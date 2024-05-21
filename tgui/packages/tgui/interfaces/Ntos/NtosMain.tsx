import { useBackend } from 'tgui/backend';
import { Button, Section, Table } from 'tgui/components';
import { NtosWindow } from 'tgui/layouts';
import { Drive, NTOSData } from 'tgui/layouts/NtosWindow';

// Put any overrides here
const PROGRAM_ICONS = {};

export const NtosMain = (props) => {
  const { act, data } = useBackend<NTOSData>();

  const { PC_device_theme, hard_drive, portable_drive } = data;

  return (
    <NtosWindow
      title={
        (PC_device_theme === 'syndicate' && 'Syndix Main Menu') ||
        'NtOS Main Menu'
      }
      width={400}
      height={500}
      resizable
    >
      <NtosWindow.Content scrollable>
        <DriveView drive={hard_drive} />
        {portable_drive && <DriveView drive={portable_drive} removable />}
      </NtosWindow.Content>
    </NtosWindow>
  );
};

const DriveView = (props: { drive: Drive; removable?: boolean }) => {
  const { act } = useBackend();
  const { drive, removable } = props;

  const title = drive.name || (removable ? 'Data Disk' : 'Programs');

  return (
    <Section
      title={title}
      buttons={
        removable && (
          <Button
            icon="eject"
            tooltip="Eject Disk"
            onClick={() => act('PC_eject_disk')}
          />
        )
      }
    >
      <Table>
        {drive.programs.map((program) => (
          <Table.Row key={program.name}>
            <Table.Cell pb={0.5}>
              <Button
                fluid
                color="dark-grey"
                icon={
                  program.icon ||
                  PROGRAM_ICONS[program.name] ||
                  'window-maximize-o'
                }
                content={program.desc}
                onClick={() =>
                  act('PC_runprogram', {
                    program: program.name,
                    disk: drive.ref,
                  })
                }
              />
            </Table.Cell>
            <Table.Cell collapsing width="18px">
              {!!program.running && (
                <Button
                  color="dark-grey"
                  icon="times"
                  tooltip="Close program"
                  tooltipPosition="left"
                  onClick={() =>
                    act('PC_killprogram', {
                      program: program.name,
                      disk: drive.ref,
                    })
                  }
                />
              )}
            </Table.Cell>
          </Table.Row>
        ))}
      </Table>
    </Section>
  );
};
