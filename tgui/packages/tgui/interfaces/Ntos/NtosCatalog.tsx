import { NtosWindow } from 'tgui/layouts';

import { CatalogContent } from '../Catalog';

export const NtosCatalog = (props) => {
  return (
    <NtosWindow width={640} height={700}>
      <NtosWindow.Content>
        <CatalogContent />
      </NtosWindow.Content>
    </NtosWindow>
  );
};
