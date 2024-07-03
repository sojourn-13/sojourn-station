import { NtosWindow } from 'tgui/layouts';

import { CrewManifestContent } from '../CrewManifest';

export const NtosCrewManifest = (props) => {
  return (
    <NtosWindow width={450} height={700}>
      <NtosWindow.Content scrollable>
        <CrewManifestContent />
      </NtosWindow.Content>
    </NtosWindow>
  );
};
