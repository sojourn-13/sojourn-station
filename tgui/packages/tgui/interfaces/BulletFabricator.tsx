import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import {
  Box,
  Button,
  Divider,
  Icon,
  LabeledList,
  Section,
} from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';

enum MenuState {
  Menu = 'menu',
  Void = 'void',
  NoPoints = 'nopoints',
}

type Recipe = {
  is_category: BooleanLike;
  name: string;
  cost?: number;
};

type Data = {
  points: number;
  menustate: MenuState;
  recipes: Recipe[];
  processing: BooleanLike;
};

export const BulletFabricator = (props) => {
  const { act, data } = useBackend<Data>();

  const { menustate, processing } = data;

  let content = (
    <Box color="bad">
      INVALID STATE: {menustate}.{' '}
      <Button icon="undo" onClick={() => act('reset_menu')}>
        Go Back?
      </Button>
    </Box>
  );

  if (menustate === MenuState.Menu) {
    content = <BulletFabricatorMenu />;
  } else if (menustate === MenuState.NoPoints) {
    content = <NoPoints />;
  } else if (menustate === MenuState.Void) {
    content = <NoMaterials />;
  }

  return (
    <Window width={455} height={655}>
      <Window.Content scrollable>
        {content}
        {!!processing && (
          <Box
            position="fixed"
            left={2}
            top={4}
            p={2}
            backgroundColor="rgba(0, 0, 0, 0.5)"
            style={{ borderRadius: '50%' }}
          >
            <Icon name="sync" spin size={3} />
          </Box>
        )}
      </Window.Content>
    </Window>
  );
};

const NoPoints = (props) => {
  const { act } = useBackend<Data>();

  return (
    <Section
      title="Not Enough Points"
      buttons={
        <Button icon="window-close" onClick={() => act('reset_menu')}>
          Close
        </Button>
      }
    >
      <Box color="bad">
        You do not have enough material to create munitions.
      </Box>
      <Box color="average">
        Please, put materials into fabricator and activate it.
      </Box>
    </Section>
  );
};

const NoMaterials = (props) => {
  const { act } = useBackend<Data>();

  return (
    <Section
      title="No Materials Loaded"
      buttons={
        <Button icon="window-close" onClick={() => act('reset_menu')}>
          Close
        </Button>
      }
    >
      <Box color="bad">Error: No materials in processor to process.</Box>
      <Box color="average">
        Please, put materials into fabricator and activate it.
      </Box>
    </Section>
  );
};

const BulletFabricatorMenu = (props) => {
  const { act, data } = useBackend<Data>();

  const { points, recipes } = data;

  return (
    <Section title="Designs">
      <LabeledList>
        <LabeledList.Item
          label="Usable Material"
          buttons={
            <Button icon="mortar-pestle" onClick={() => act('activate')}>
              Activate Material Processor
            </Button>
          }
        >
          {points}g
        </LabeledList.Item>
      </LabeledList>
      {recipes.map((recipe) =>
        recipe.is_category ? (
          <>
            <Box bold key={recipe.name} mt={2}>
              {recipe.name}
            </Box>
            <Divider />
          </>
        ) : (
          <Box key={recipe.name}>
            <Button
              icon="hammer"
              onClick={() => act('create', { item: recipe.name })}
              disabled={!recipe.cost || recipe.cost > points}
            >
              {recipe.cost}
            </Button>
            <Box inline color="label" ml={1}>
              {recipe.name}
            </Box>
          </Box>
        ),
      )}
    </Section>
  );
};
