import { useBackend } from 'tgui/backend';
import { NtosWindow } from 'tgui/layouts/NtosWindow';

import { Data, EmailClientContent } from '../EmailClient';

export const NtosEmailClient = (props) => {
  const { data } = useBackend<Data>();

  return (
    <NtosWindow
      title={
        (data.account_data && 'Email Client - ' + data.account_data.login) || ''
      }
      width={800}
      height={500}
    >
      <NtosWindow.Content>
        <EmailClientContent />
      </NtosWindow.Content>
    </NtosWindow>
  );
};
