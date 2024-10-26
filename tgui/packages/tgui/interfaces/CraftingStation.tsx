import { uniq } from 'common/collections';
import { useBackend, useSharedState } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import { Box, Button, Section, Stack, Tabs } from 'tgui-core/components';
import { round } from 'tgui-core/math';
import { BooleanLike } from 'tgui-core/react';
import { toTitleCase } from 'tgui-core/string';

import { MaterialAccessBar } from './Fabrication/MaterialAccessBar';
import { Material } from './Fabrication/Types';

type RecipeData = {
  name: string;
  type: string;
  category: string;
  subcategory: string | null;
  available_points?: number;
  point_cost?: number;
  cost:
    | number
    | {
        [material: string]: number;
      };
};

type Data = {
  craftable_recipes: string[];
  recipes: RecipeData[];
  materials: Material[];
  perk_no_obfuscation: BooleanLike;
};

const categorySortingOrder = [
  'barrels',
  'grips',
  'mechanisms',
  'small arms ammo',
  'long arms ammo',
  'misc ammo',
];

const subcategorySortingOrder = [
  '9mm',
  '10mm magnum',
  '12mm heavy pistol',
  'shotgun shell',
  '6.5mm carbine',
  '7.62mm rifle',
  '8.6mm heavy rifle',
  '14.5mm anti-materiel',
  'flare shell',
  '17mm rolled shot',
  '19mm explosive',
  'small arms',
  'long arms',
  'cheap small arms',
  'cheap long arms',
];

export const CraftingStation = (props) => {
  const { act, data } = useBackend<Data>();

  const { craftable_recipes, recipes, materials, perk_no_obfuscation } = data;

  if (!Array.isArray(craftable_recipes)) {
    return (
      <Window width={400} height={400}>
        <Window.Content>
          <Section title="ERROR" color="bad">
            <Box fontSize={1.5}>No recipes were found.</Box>
          </Section>
        </Window.Content>
      </Window>
    );
  }

  const categories = uniq(recipes.map((r) => r.category)).sort((a, b) => {
    let alower = a.toLowerCase();
    let blower = b.toLowerCase();
    if (
      categorySortingOrder.includes(alower) &&
      categorySortingOrder.includes(blower)
    ) {
      return (
        categorySortingOrder.indexOf(alower) -
        categorySortingOrder.indexOf(blower)
      );
    } else {
      return alower.localeCompare(blower);
    }
  });

  const [selectedCategory, setSelectedCategory] = useSharedState(
    'selectedCategory',
    categories[0],
  );

  const recipesInThisCategory = recipes.filter(
    (recipe) => recipe.category === selectedCategory,
  );

  const subCategories = uniq(
    recipesInThisCategory.map((recipe) => recipe.subcategory || 'Other'),
  ).sort((a, b) => {
    let alower = a.toLowerCase();
    let blower = b.toLowerCase();
    if (
      subcategorySortingOrder.includes(alower) &&
      subcategorySortingOrder.includes(blower)
    ) {
      return (
        subcategorySortingOrder.indexOf(alower) -
        subcategorySortingOrder.indexOf(blower)
      );
    } else {
      return alower.localeCompare(blower);
    }
  });

  const [selectedSubCategory, setSelectedSubCategory] = useSharedState(
    'selectedSubCategory',
    subCategories[0],
  );

  const finalRecipes = recipesInThisCategory.filter(
    (recipe) => selectedSubCategory === (recipe.subcategory || 'Other'),
  );

  return (
    <Window width={620} height={600}>
      <Window.Content>
        <Section
          title="Crafting"
          fill
          height={!!materials && materials.length > 0 ? '80%' : '100%'}
        >
          <Stack fill vertical>
            <Stack.Item>
              <Tabs fluid>
                {categories.map((cat) => (
                  <Tabs.Tab
                    key={cat}
                    selected={cat === selectedCategory}
                    onClick={() => {
                      setSelectedCategory(cat);
                      // Must reset subcategory to default or could end up trapping the user
                      setSelectedSubCategory(
                        recipes
                          .filter((r) => r.category === cat)
                          .map((r) => r.subcategory || 'Other')
                          .sort((a, b) => {
                            let alower = a.toLowerCase();
                            let blower = b.toLowerCase();
                            if (
                              subcategorySortingOrder.includes(alower) &&
                              subcategorySortingOrder.includes(blower)
                            ) {
                              return (
                                subcategorySortingOrder.indexOf(alower) -
                                subcategorySortingOrder.indexOf(blower)
                              );
                            } else {
                              return alower.localeCompare(blower);
                            }
                          })[0],
                      );
                    }}
                  >
                    {cat}
                  </Tabs.Tab>
                ))}
              </Tabs>
              {/* If the only category is "Other" then don't bother showing the tabs */}
              {subCategories.length > 1 && (
                <Tabs fluid mt={-0.5} mb={0}>
                  {subCategories.map((cat) => (
                    <Tabs.Tab
                      key={cat}
                      selected={cat === selectedSubCategory}
                      onClick={() => setSelectedSubCategory(cat)}
                    >
                      {cat}
                    </Tabs.Tab>
                  ))}
                </Tabs>
              )}
            </Stack.Item>
            <Stack.Item grow>
              <Section fill style={{ overflowY: 'auto' }}>
                {finalRecipes.map((recipe) => (
                  <Stack
                    key={recipe.name}
                    className="candystripe"
                    p={1}
                    align="center"
                  >
                    <Stack.Item grow>
                      <Recipe
                        recipe={recipe}
                        available={craftable_recipes.includes(recipe.type)}
                        perk_no_obfuscation={perk_no_obfuscation}
                      />
                    </Stack.Item>
                    <Stack.Item>
                      <Button
                        icon="hammer"
                        disabled={!craftable_recipes.includes(recipe.type)}
                        onClick={() => act('craft', { type: recipe.type })}
                      >
                        Craft
                      </Button>
                    </Stack.Item>
                  </Stack>
                ))}
              </Section>
            </Stack.Item>
          </Stack>
        </Section>
        {materials.length > 0 && (
          <Section>
            <MaterialAccessBar
              availableMaterials={materials}
              disableStackEjection
              onEjectRequested={(material, qty) => {
                act('eject', { material: material.name });
              }}
            />
          </Section>
        )}
      </Window.Content>
    </Window>
  );
};

type PointCountProps = Required<
  Pick<RecipeData, 'available_points' | 'point_cost'>
> &
  Pick<Data, 'perk_no_obfuscation'>;

export const PointCount = (props: PointCountProps) => {
  const { point_cost, available_points, perk_no_obfuscation } = props;

  if (perk_no_obfuscation) {
    return (
      <Box inline color={available_points >= point_cost ? 'good' : 'bad'}>
        ({point_cost} / {available_points} points)
      </Box>
    );
  }

  const percentage = available_points / point_cost;

  // If it's far from unlocking or already unlocked, don't tell the user nothin'
  if (percentage < 0.8 || percentage >= 1) {
    return null;
  }

  return (
    <Box inline color="good">
      (Unlock Close)
    </Box>
  );
};

type RecipeProps = {
  recipe: RecipeData;
  available: boolean;
} & Pick<Data, 'perk_no_obfuscation'>;

export const Recipe = (props: RecipeProps) => {
  const { recipe, available, perk_no_obfuscation } = props;

  return (
    <Stack vertical>
      <Stack.Item fontSize={1.2} color="label">
        {recipe.name}{' '}
        {recipe.point_cost && recipe.available_points ? (
          <PointCount
            point_cost={recipe.point_cost}
            available_points={recipe.available_points}
            perk_no_obfuscation={perk_no_obfuscation}
          />
        ) : null}
      </Stack.Item>
      <Stack.Item textColor={available ? '' : 'bad'}>
        {recipe.cost === -1
          ? 'Cannot Craft: Lacking mechanical skill or improved stock parts.'
          : typeof recipe.cost === 'object' &&
            Object.entries(recipe.cost).map(([name, cost], index, arr) => (
              <Box key={name} inline mr={index === arr.length - 1 ? 0 : 0.5}>
                {toTitleCase(name)} ({round(cost, 2)})
                {index === arr.length - 1 ? '' : ', '}
              </Box>
            ))}
      </Stack.Item>
    </Stack>
  );
};
