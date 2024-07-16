import { Dispatch, SetStateAction, useEffect, useState } from 'react';
import { useBackend } from 'tgui/backend';
import { Button, Input, TextArea } from 'tgui/components';
import { Window } from 'tgui/layouts';
import { NTOSData } from 'tgui/layouts/NtosWindow';
import {
  AnimatedNumber,
  Box,
  Dimmer,
  Divider,
  Icon,
  LabeledList,
  ProgressBar,
  Section,
  Stack,
  Tabs,
  VirtualList,
} from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';

import { SearchBar } from './Fabrication/SearchBar';

export const EmailClient = (props) => {
  return (
    <Window width={800} height={500}>
      <Window.Content>
        <EmailClientContent />
      </Window.Content>
    </Window>
  );
};

export type DownloadData = {
  filename: string;
  progress: number;
  size: number;
  speed: number;
};

export type Attachment = {
  filename: string;
  size: number;
};

export type MessageData = {
  title: string;
  body: string | null;
  source: string;
  timestamp: string;
  uid: number;
  attachment?: Attachment | null;
};

export enum Folder {
  Inbox = 'Inbox',
  Sent = 'Sent',
  Spam = 'Spam',
  Deleted = 'Deleted',
}

export type MainMenuData = {
  label_inbox: string;
  label_outbox: string;
  label_spam: string;
  label_deleted: string;
  folder: Folder;
  messages: MessageData[];
};

export type AccountData = {
  login: string;
  ringtone: BooleanLike;
  addressbook: string[];
  attachment: Attachment | null;
  current_message: MessageData;
  main_menu: MainMenuData;
};

export type Data = {
  error: string | null;
  download: DownloadData | null;
  id_available: BooleanLike;
  id_matches: BooleanLike;
  stored_login: string;
  stored_password: string;
  account_data: AccountData | null;
} & NTOSData;

export const EmailClientContent = (props) => {
  const { act, data } = useBackend<Data>();

  const { account_data, download, error } = data;

  // Six main UI states:
  // - Login
  // - Error
  // - Downloading
  // - Viewing Message
  // - Send Message
  // - Main Menu

  const [sendMessageScreen, setSendMessageScreen] = useState(false);

  // Only recipient is actually modified outside of SendMessageScreen but we want to hoist it up to here so it doesn't
  // lose state when someone switches out of the compose (sort of a draft mode)
  const [body, setBody] = useState('');
  const [subject, setSubject] = useState('');
  const [recipient, setRecipient] = useState('');

  // evil hack to autoclear only when successful email send
  useEffect(() => {
    if (error && error.toLowerCase().includes('email successfully sent')) {
      setBody('');
      setSubject('');
      setRecipient('');
    }
  }, [error]);

  let content = <LoginScreen data={data} />;

  if (error) {
    content = (
      <Section
        title="System Message"
        color="bad"
        buttons={
          <Button icon="times" onClick={() => act('reset_error')}>
            Dismiss
          </Button>
        }
      >
        {error}
      </Section>
    );
  } else if (download) {
    content = <DownloadScreen download={download} />;
  } else if (account_data) {
    if (sendMessageScreen) {
      content = (
        <SendMessageScreen
          data={account_data}
          recipient={recipient}
          setSubject={setSubject}
          setRecipient={setRecipient}
          state={{ body, setBody, subject, setSubject }}
          setSendMessageScreen={setSendMessageScreen}
        />
      );
    } else if (account_data.current_message) {
      content = (
        <ViewMessageScreen
          data={account_data}
          setSubject={setSubject}
          setRecipient={setRecipient}
          setSendMessageScreen={setSendMessageScreen}
        />
      );
    } else {
      content = (
        <MainMenuScreen
          data={data}
          setSubject={setSubject}
          setRecipient={setRecipient}
          setSendMessageScreen={setSendMessageScreen}
        />
      );
    }
  }

  return content;
};

export type MetaUIControlProps = {
  setSendMessageScreen: Dispatch<SetStateAction<boolean>>;
  setRecipient: Dispatch<SetStateAction<string>>;
  setSubject: Dispatch<SetStateAction<string>>;
};

export const DownloadScreen = (props: { download: DownloadData }) => {
  const { act } = useBackend();
  const { download } = props;

  return (
    <Section
      title="Download Helper v4.3"
      buttons={
        <Button icon="times" color="bad" onClick={() => act('cancel_download')}>
          Cancel Download
        </Button>
      }
    >
      <LabeledList>
        <LabeledList.Item label="Filename">
          {download.filename}
        </LabeledList.Item>
        <LabeledList.Item label="Speed">
          <AnimatedNumber value={download.speed} /> GQ/s
        </LabeledList.Item>
        <LabeledList.Item label="Completion">
          <ProgressBar value={download.progress} maxValue={download.size}>
            <AnimatedNumber value={download.progress} />/
            <AnimatedNumber value={download.size} /> GQ
          </ProgressBar>
        </LabeledList.Item>
      </LabeledList>
    </Section>
  );
};

export type LoginScreenProps = {
  data: Pick<Data, 'stored_login' | 'stored_password' | 'id_available'>;
};

export const LoginScreen = (props: LoginScreenProps) => {
  const { act } = useBackend();
  const { data } = props;

  const { stored_login, stored_password, id_available } = data;

  return (
    <Section title="Please Log In">
      <LabeledList>
        <LabeledList.Item label="Email Address">
          <Input
            fluid
            autoUpdateValue
            value={stored_login}
            onChange={(e, login) => act('set_stored_login', { login })}
          />
        </LabeledList.Item>
        <LabeledList.Item label="Password">
          <Input
            fluid
            autoUpdateValue
            value={stored_password}
            onChange={(e, password) => act('set_stored_password', { password })}
          />
        </LabeledList.Item>
      </LabeledList>
      <Button mt={1} icon="sign-in-alt" onClick={() => act('log_in')}>
        Log In
      </Button>
      {!!id_available && (
        <Button mt={1} icon="id-card" onClick={() => act('autofill_id')}>
          Autofill From ID
        </Button>
      )}
    </Section>
  );
};

export type ViewMessageScreenProps = {
  data: Pick<AccountData, 'current_message' | 'login'>;
} & MetaUIControlProps;

export const ViewMessageScreen = (props: ViewMessageScreenProps) => {
  const { act } = useBackend();
  const { data, setSendMessageScreen, setRecipient, setSubject } = props;
  const { current_message, login } = data;
  const { body, source, timestamp, title, uid, attachment } = current_message;
  return (
    <Section
      scrollable
      fill
      title={
        <Stack align="center">
          <Stack.Item>
            <Button
              color="transparent"
              icon="arrow-left"
              tooltip="Back to Inbox"
              tooltipPosition="left"
              pt={0.5}
              mr={1}
              onClick={() => act('clear_current_message')}
            />
          </Stack.Item>
          <Stack.Item grow>{title}</Stack.Item>
          <Stack.Item>
            <Button
              color="transparent"
              icon="save"
              tooltip="Save Message"
              tooltipPosition="bottom"
              onClick={() => act('save_message', { uid })}
            />
            <Button
              color="transparent"
              icon="print"
              tooltip="Print Message"
              tooltipPosition="bottom"
              onClick={() => act('print_message', { uid })}
            />
            <Button
              color="transparent"
              icon="reply"
              tooltip="Reply"
              tooltipPosition="bottom"
              onClick={() => {
                setRecipient(source);
                setSubject('RE: ' + title);
                setSendMessageScreen(true);
              }}
            />
            <Button
              color="transparent"
              icon="trash"
              tooltip="Delete"
              tooltipPosition="bottom"
              onClick={() => act('delete_message', { uid })}
            />
          </Stack.Item>
        </Stack>
      }
    >
      <Stack fill>
        <Stack.Item>
          <Icon
            mt={0.5}
            name="user"
            p={1.25}
            size={0.75}
            backgroundColor="gray"
            style={{ borderRadius: '50%' }}
          />
        </Stack.Item>
        <Stack.Item grow>
          <Stack align="center" justify="space-between">
            <Stack.Item>
              <Box bold fontSize={1.3}>
                {source}
              </Box>
              <Box color="gray" ml={1} fontSize={0.9}>
                to {login}
              </Box>
            </Stack.Item>
            <Stack.Item color="gray" mr={1}>
              {timestamp}
            </Stack.Item>
          </Stack>
          <Box mt={2}>
            {!!body && (
              // Safety: Pencode.
              // eslint-disable-next-line react/no-danger
              <div dangerouslySetInnerHTML={{ __html: body }} />
            )}
          </Box>
          {!!attachment && (
            <Button
              icon="save"
              mt={2}
              color="grey"
              style={{ borderRadius: '5px' }}
              onClick={() => act('download_message_attachment', { uid })}
            >
              {attachment.filename} ({attachment.size}GQ)
            </Button>
          )}
        </Stack.Item>
      </Stack>
    </Section>
  );
};

// To lift state into the main UI instead
export type MetaSendMessageProps = {
  body: string;
  setBody: Dispatch<SetStateAction<string>>;
  subject: string;
  setSubject: Dispatch<SetStateAction<string>>;
};

export type SendMessageScreenProps = {
  data: AccountData;
  recipient: string;
  state: MetaSendMessageProps;
} & MetaUIControlProps;

export const SendMessageScreen = (props: SendMessageScreenProps) => {
  const { act } = useBackend();
  const { data, setSendMessageScreen, recipient, setRecipient, state } = props;
  const { body, setBody, subject, setSubject } = state;

  const { addressbook, attachment } = data;

  const [showAddressBook, setShowAddressBook] = useState(false);

  return (
    <>
      {showAddressBook && (
        <Dimmer>
          <Section
            className="Section--force-background"
            fillPositionedParent
            m={2}
            title="Address Book"
            scrollable
            fill
            height="90%"
            buttons={
              <Button
                icon="times"
                tooltip="Close Address Book"
                tooltipPosition="left"
                color="bad"
                onClick={() => setShowAddressBook(false)}
              />
            }
          >
            {addressbook.map((address) => (
              <Button
                key={address}
                icon="user"
                fluid
                onClick={() => {
                  setRecipient(address);
                  setShowAddressBook(false);
                }}
              >
                {address}
              </Button>
            ))}
          </Section>
        </Dimmer>
      )}
      <Section
        fill
        title="Send Message"
        buttons={
          <Button
            color="bad"
            icon="times"
            tooltip="Close (Work will be lost)"
            onClick={() => setSendMessageScreen(false)}
          />
        }
      >
        <Stack vertical fill ml={1} mr={1}>
          <Stack.Item ml={1}>
            <Stack align="center">
              <Stack.Item fontSize={1.25}>To</Stack.Item>
              <Stack.Item grow>
                <Input
                  fluid
                  style={{
                    background: 'none',
                    border: 'none',
                  }}
                  autoUpdateValue
                  value={recipient}
                  onChange={(e, val) => setRecipient(val)}
                />
              </Stack.Item>
              <Stack.Item>
                <Button
                  color="transparent"
                  icon="address-book"
                  onClick={() => setShowAddressBook(true)}
                />
              </Stack.Item>
            </Stack>
          </Stack.Item>
          <Stack.Divider />
          <Stack.Item>
            <Input
              placeholder="Subject"
              fluid
              style={{
                background: 'none',
                border: 'none',
              }}
              value={subject}
              onChange={(e, val) => setSubject(val)}
            />
          </Stack.Item>
          <Stack.Divider />
          <Stack.Item ml={1} grow>
            <TextArea
              scrollbar
              height="100%"
              maxLength={20000}
              multilineEnter
              style={{
                background: 'none',
                border: 'none',
              }}
              placeholder="Write your message here (pencode is supported)"
              onInput={(_, val) => setBody(val)}
              onChange={(_, val) => setBody(val)}
              value={body}
            />
          </Stack.Item>
          <Stack.Item>
            <Stack align="center" justify="space-between">
              <Stack.Item>
                <Button
                  bold
                  style={{ borderRadius: '25px' }}
                  pt={1}
                  pl={3}
                  pr={3}
                  pb={1}
                  fontSize={1.25}
                  onClick={() => {
                    act('send_message', {
                      // Needed so that it survives to get to the other person
                      body: body.replaceAll('\n', '[br]'),
                      recipient,
                      title: subject,
                    });
                  }}
                >
                  Send
                </Button>
              </Stack.Item>
              <Stack.Item>
                {!!attachment && (
                  <Box
                    backgroundColor="gray"
                    inline
                    pl={1}
                    style={{ borderRadius: '5px' }}
                  >
                    {attachment.filename} ({attachment.size}GQ)
                    <Button
                      color="transparent"
                      icon="times"
                      onClick={() => act('clear_attachment')}
                    />
                  </Box>
                )}
                {!attachment && (
                  <Button
                    color="transparent"
                    icon="plus"
                    tooltip="Add Attachment"
                    tooltipPosition="left"
                    onClick={() => act('add_attachment')}
                  />
                )}
              </Stack.Item>
            </Stack>
          </Stack.Item>
        </Stack>
      </Section>
    </>
  );
};

export type MainMenuScreenProps = {
  data: Pick<Data, 'account_data' | 'id_available' | 'id_matches'>;
} & MetaUIControlProps;

export const MainMenuScreen = (props: MainMenuScreenProps) => {
  const { act } = useBackend();
  const { data, setSendMessageScreen, setRecipient, setSubject } = props;
  const { account_data, id_available, id_matches } = data;
  if (!account_data) {
    return;
  }
  const { login, main_menu, ringtone } = account_data;
  if (!main_menu) {
    return;
  }

  const {
    label_inbox,
    label_outbox,
    label_spam,
    label_deleted,
    folder,
    messages,
  } = main_menu;

  const [search, setSearch] = useState('');

  const filteredMessages =
    search !== ''
      ? messages.filter(
          (v) => v.title.includes(search) || v.source.includes(search),
        )
      : messages;

  return (
    <Section
      title="Main Menu"
      buttons={
        <>
          <Button
            icon={ringtone ? 'volume-up' : 'volume-mute'}
            selected={ringtone}
            tooltip={ringtone ? 'Ringtone Enabled' : 'Ringtone Disabled'}
            tooltipPosition="bottom"
            onClick={() => act('ringtone_toggle')}
          />
          <Button
            icon="key"
            tooltip="Change Password"
            tooltipPosition="bottom"
            onClick={() => act('change_password')}
          />
          {!!id_available && !id_matches && (
            <Button
              icon="id-card"
              tooltip="Email mismatch with ID Card Detected. Synchronize ID with account?"
              tooltipPosition="bottom"
              onClick={() => act('sync_id')}
            />
          )}
          <Button icon="sign-out-alt" onClick={() => act('log_out')}>
            Sign out of {login}
          </Button>
        </>
      }
      fill
    >
      <Stack fill>
        <Stack.Item basis="15%">
          <Button
            icon="envelope-open-text"
            fluid
            onClick={() => setSendMessageScreen(true)}
          >
            Compose
          </Button>
          <Tabs vertical>
            <Tabs.Tab
              onClick={() => act('set_folder', { folder: Folder.Inbox })}
              selected={folder === Folder.Inbox}
            >
              {label_inbox}
            </Tabs.Tab>
            <Tabs.Tab
              onClick={() => act('set_folder', { folder: Folder.Sent })}
              selected={folder === Folder.Sent}
            >
              {label_outbox}
            </Tabs.Tab>
            <Tabs.Tab
              onClick={() => act('set_folder', { folder: Folder.Spam })}
              selected={folder === Folder.Spam}
            >
              {label_spam}
            </Tabs.Tab>
            <Tabs.Tab
              onClick={() => act('set_folder', { folder: Folder.Deleted })}
              selected={folder === Folder.Deleted}
            >
              {label_deleted}
            </Tabs.Tab>
          </Tabs>
        </Stack.Item>
        <Stack.Item grow pl={4}>
          <Section
            title="Messages"
            buttons={
              <Box width={25}>
                <SearchBar
                  searchText={search}
                  onSearchTextChanged={(val) => setSearch(val)}
                />
              </Box>
            }
            fill
            scrollable
          >
            <Stack vertical>
              <VirtualList>
                {filteredMessages.length === 0 ? (
                  <Box p={1}>{'No Messages :)'}</Box>
                ) : (
                  filteredMessages.map((message) => (
                    <Stack.Item key={message.uid}>
                      <Stack align="center" pt={2}>
                        <Stack.Item basis="3%">
                          <Button
                            inline
                            pt={0.5}
                            color="transparent"
                            icon="times"
                            tooltip="Delete"
                            tooltipPosition="right"
                            onClick={() =>
                              act('delete_message', { uid: message.uid })
                            }
                          />
                        </Stack.Item>
                        <Stack.Item basis="3%">
                          <Button
                            inline
                            pt={0.5}
                            color="transparent"
                            icon="reply"
                            tooltip="Reply"
                            tooltipPosition="right"
                            onClick={() => {
                              setRecipient(message.source);
                              setSubject('RE: ' + message.title);
                              setSendMessageScreen(true);
                            }}
                          />
                        </Stack.Item>
                        <Stack.Item grow>
                          <Button
                            color="transparent"
                            fluid
                            width="100%"
                            onClick={() =>
                              act('set_current_message', { uid: message.uid })
                            }
                          >
                            <Stack align="center">
                              <Stack.Item bold basis="45%" textColor="white">
                                {message.source}
                              </Stack.Item>
                              <Stack.Item grow>
                                {message.title.substring(0, 30)}
                                {message.title.length > 30 ? '...' : ''}
                              </Stack.Item>
                              <Stack.Item>{message.timestamp}</Stack.Item>
                            </Stack>
                          </Button>
                        </Stack.Item>
                      </Stack>
                      <Divider />
                    </Stack.Item>
                  ))
                )}
              </VirtualList>
            </Stack>
          </Section>
        </Stack.Item>
      </Stack>
    </Section>
  );
};
