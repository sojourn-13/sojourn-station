import { Dispatch, SetStateAction, useState } from 'react';
import { useBackend, useSharedState } from 'tgui/backend';
import { Box, Button, Section, Table, TextArea } from 'tgui/components';
import { NtosWindow } from 'tgui/layouts';

type File = {
  name: string;
  size: number;
};

type Data = {
  error: string;
  files: File[];
  usbfiles: File[];
  /** File Name */
  open_file: string;
  /** Loaded Data for open file */
  loaded_data: string;
  /** Loaded Data for open file but passed through pencode2html */
  loaded_data_html: string;
  max_length: number;
};

export const NtosWord = (props) => {
  const { act, data } = useBackend<Data>();

  const { error } = data;

  const [showFileBrowser, setShowFileBrowser] = useState(false);
  const [edited, setEdited] = useSharedState('edited-flag', false);

  const uiControl = { setShowFileBrowser, edited, setEdited };

  let content = <Word uiControl={uiControl} />;

  if (error) {
    content = (
      <Section
        title="Notice"
        buttons={<Button icon="times" onClick={() => act('PRG_reseterror')} />}
      >
        {error}
      </Section>
    );
  } else if (showFileBrowser) {
    content = <FileBrowser uiControl={uiControl} />;
  }

  return (
    <NtosWindow width={550} height={700}>
      <NtosWindow.Content>{content}</NtosWindow.Content>
    </NtosWindow>
  );
};

type MetaUIControlProps = {
  setShowFileBrowser: Dispatch<SetStateAction<boolean>>;
  edited: boolean;
  setEdited: Dispatch<SetStateAction<boolean>>;
};

export const FileBrowser = (props: { uiControl: MetaUIControlProps }) => {
  const { act, data } = useBackend<Data>();
  const { setShowFileBrowser, edited, setEdited } = props.uiControl;
  const { open_file, files, usbfiles } = data;

  return (
    <Section
      title={`File Browser${edited ? ' (Unsaved Changes In Editor)' : ''}`}
      buttons={
        <>
          <Button
            icon="file-upload"
            tooltip={edited ? 'New File (Unsaved Changes)' : 'New File'}
            color={edited ? 'bad' : ''}
            onClick={() => {
              act('PRG_newfile');
              setEdited(true);
            }}
          />
          <Button
            icon="arrow-left"
            tooltip="Return to editor"
            onClick={() => setShowFileBrowser(false)}
          />
        </>
      }
    >
      <Table>
        <Table.Row header>
          <Table.Cell>Name</Table.Cell>
          <Table.Cell collapsing textAlign="right">
            Size (GQ)
          </Table.Cell>
          <Table.Cell collapsing />
        </Table.Row>
        {files.map((file) => (
          <Table.Row key={file.name}>
            <Table.Cell color={open_file === file.name ? 'good' : ''}>
              {file.name}
            </Table.Cell>
            <Table.Cell
              color={open_file === file.name ? 'good' : ''}
              textAlign="right"
              collapsing
            >
              {file.size}
            </Table.Cell>
            <Table.Cell ml={1} collapsing>
              <Button
                icon="pen"
                color={edited ? 'bad' : ''}
                tooltip={edited ? '(Unsaved Changes)' : ''}
                selected={open_file === file.name}
                onClick={() => {
                  act('PRG_openfile', { file: file.name });
                  setShowFileBrowser(false);
                }}
              >
                Edit
              </Button>
            </Table.Cell>
          </Table.Row>
        ))}
      </Table>
    </Section>
  );
};

export const Word = (props: { uiControl: MetaUIControlProps }) => {
  const { act, data } = useBackend<Data>();
  const { setShowFileBrowser, edited, setEdited } = props.uiControl;
  const { open_file, loaded_data, loaded_data_html, max_length } = data;

  const [showPreview, setShowPreview] = useState(false);
  const [showHelp, setShowHelp] = useState(false);

  return (
    <Section
      title={`Document: ${open_file || 'Untitled'}${edited ? '*' : ''}`}
      fill
      scrollable={showPreview}
      buttons={
        <>
          <Button
            icon="file-upload"
            tooltip="New File"
            color={edited ? 'bad' : ''}
            onClick={() => {
              act('PRG_newfile');
              setEdited(true);
            }}
          />
          <Button
            icon="columns"
            tooltip="Browse Files"
            pr={1}
            onClick={() => setShowFileBrowser(true)}
          />
          <Button
            icon="save"
            tooltip="Save File"
            onClick={() => {
              act('PRG_savefile');
              setEdited(false);
            }}
          />
          <Button
            icon="save-o"
            tooltip="Save File As"
            onClick={() => {
              act('PRG_saveasfile');
              setEdited(false);
            }}
          />
          <Button
            icon="print"
            tooltip="Print File"
            onClick={() => act('PRG_printfile')}
          />
          <Button.Checkbox
            checked={showPreview}
            onClick={() => setShowPreview(!showPreview)}
          >
            Preview
          </Button.Checkbox>
          <Button
            icon="question"
            selected={showHelp}
            onClick={() => setShowHelp(!showHelp)}
            tooltip="Help"
          />
        </>
      }
    >
      {showPreview ? (
        // Safety: Pencode.
        // eslint-disable react/no-danger
        <Box dangerouslySetInnerHTML={{ __html: loaded_data_html }} />
      ) : showHelp ? (
        <Box color="label">
          <Box fontSize={1.4}>Formatting Help</Box>
          <Box>[br] : Creates a linebreak.</Box>
          <Box>[center] - [/center] : Centers the text.</Box>
          <Box>[h1] - [/h1] : First level heading.</Box>
          <Box>[h2] - [/h2] : Second level heading.</Box>
          <Box>[h3] - [/h3] : Third level heading.</Box>
          <Box>[b] - [/b] : Bold.</Box>
          <Box>[i] - [/i] : Italic.</Box>
          <Box>[u] - [/u] : Underlined.</Box>
          <Box>[small] - [/small] : Decreases the size of the text.</Box>
          <Box>[large] - [/large] : Increases the size of the text.</Box>
          <Box>
            [field] : Inserts a blank text field, which can be filled later.
            Useful for forms.
          </Box>
          <Box>[date] : Current station date.</Box>
          <Box>[time] : Current station time.</Box>
          <Box>[list] - [/list] : Begins and ends a list.</Box>
          <Box>[*] : A list item.</Box>
          <Box>[hr] : Horizontal rule.</Box>
          <Box>
            [table] - [/table] : Creates table using [row] and [cell] tags.
          </Box>
          <Box>
            [grid] - [/grid] : Table without visible borders, for layouts.
          </Box>
          <Box>[row] - New table row.</Box>
          <Box>[cell] - New table cell.</Box>
          <Box>[logo] - Inserts corporate logo image.</Box>
          <Box>[logolonestar] - Inserts Lonestar Logo</Box>
        </Box>
      ) : (
        <TextArea
          scrollbar
          fluid
          height="100%"
          maxLength={max_length}
          multilineEnter
          value={loaded_data}
          onInput={(e, val) => {
            setEdited(true);
          }}
          onChange={(e, text) => {
            act('PRG_editfile', { text });
            setEdited(true);
          }}
        />
      )}
    </Section>
  );
};
