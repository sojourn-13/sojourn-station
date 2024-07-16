import { sortBy } from 'common/collections';
import { useState } from 'react';
import { useBackend, useSharedState } from 'tgui/backend';
import { Button } from 'tgui/components';
import { Window } from 'tgui/layouts';
import {
  Box,
  Divider,
  Input,
  Section,
  Stack,
  Tabs,
} from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';
import { createSearch } from 'tgui-core/string';

const GroupTitle = ({ title }) => {
  return (
    <Stack my={1}>
      <Stack.Item grow>
        <Divider />
      </Stack.Item>
      <Stack.Item color={'gray'}>{title}</Stack.Item>
      <Stack.Item grow>
        <Divider />
      </Stack.Item>
    </Stack>
  ) as any;
};

export type CraftingStepData = {
  // Amount of resource needed for this step
  amt: number;
  // The resource OR tool needed
  tool_name: string;
  // Icon url
  icon: string;
  // Used to indicate if tool_name is a material stack, used for correct pluralization
  reqed_material: BooleanLike;
};

export const CraftingStep = (props: { step: CraftingStepData }) => {
  const { config } = useBackend();
  const { step } = props;

  const { amt, tool_name, icon, reqed_material } = step;

  if (amt === 0) {
    return (
      <Stack align="center">
        {!config.window.toaster && icon !== null && (
          <Stack.Item>
            <Box className={icon} />
          </Stack.Item>
        )}
        <Stack.Item>Apply {tool_name}</Stack.Item>
      </Stack>
    );
    // correct pluralization for non-stacks
  } else if (amt === 1 && !reqed_material) {
    return (
      <Stack align="center">
        {!config.window.toaster && icon !== null && (
          <Stack.Item>
            <Box className={icon} />
          </Stack.Item>
        )}
        <Stack.Item>Attach {tool_name}</Stack.Item>
      </Stack>
    );
  } else {
    return (
      <Stack align="center">
        {!config.window.toaster && icon !== null && (
          <Stack.Item>
            <Box className={icon} />
          </Stack.Item>
        )}
        <Stack.Item>
          Attach {amt} {tool_name}
        </Stack.Item>
      </Stack>
    );
  }
};

const getCompactCraftingStepText = (step: CraftingStepData) => {
  const { amt, tool_name, icon, reqed_material } = step;

  if (amt === 0) {
    return tool_name;
    // correct pluralization for non-stacks
  } else if (amt === 1 && !reqed_material) {
    return tool_name;
  } else {
    return amt + ' ' + tool_name;
  }
};

export type CraftingRecipeData = {
  name: string;
  ref: string;
  icon: string;
  batch: BooleanLike;
  desc: string;
  steps: CraftingStepData[];
};

export const CraftingRecipe = (props: {
  recipe: CraftingRecipeData;
  compact: boolean;
  admin: boolean;
}) => {
  const { act, config } = useBackend();
  const { recipe, compact, admin } = props;

  return (
    <Section>
      <Stack>
        {!config.window.toaster && (
          <Stack.Item>
            <Box className={recipe.icon} />
          </Stack.Item>
        )}
        <Stack.Item grow>
          <Box style={{ textTransform: 'capitalize' }}>{recipe.name}</Box>
          {!compact && <Box color="grey">{recipe.desc}</Box>}
          <Box color={compact ? 'grey' : ''}>
            {!compact && <GroupTitle title="Steps" />}
            {recipe.steps.map((step, idx) => {
              if (compact) {
                return (
                  <>
                    {getCompactCraftingStepText(step)}
                    {idx !== recipe.steps.length ? ', ' : ''}
                  </>
                );
              } else {
                return <CraftingStep step={step} key={idx} />;
              }
            })}
          </Box>
        </Stack.Item>
        <Stack.Item>
          <Stack vertical={!compact}>
            <Stack.Item>
              <Button
                icon="hammer"
                tooltip="Craft"
                onClick={() => act('build', { ref: recipe.ref })}
              />
            </Stack.Item>
            <Stack.Item>
              {admin && (
                <Button
                  icon="bug"
                  tooltip="View Variables"
                  onClick={() => act('view_variables', { ref: recipe.ref })}
                />
              )}
            </Stack.Item>
          </Stack>
        </Stack.Item>
        {recipe.batch ? (
          compact ? (
            <Stack.Item>
              <Stack>
                <Stack.Item>
                  <Button
                    fluid
                    textAlign="right"
                    tooltip="Craft 5"
                    onClick={() => act('build', { ref: recipe.ref, amount: 5 })}
                  >
                    5
                  </Button>
                </Stack.Item>
                <Stack.Item>
                  <Button
                    fluid
                    textAlign="right"
                    tooltip="Craft 10"
                    onClick={() =>
                      act('build', { ref: recipe.ref, amount: 10 })
                    }
                  >
                    10
                  </Button>
                </Stack.Item>
                <Stack.Item>
                  <Button
                    fluid
                    textAlign="right"
                    tooltip="Craft 25"
                    onClick={() =>
                      act('build', { ref: recipe.ref, amount: 25 })
                    }
                  >
                    25
                  </Button>
                </Stack.Item>
                <Stack.Item>
                  <Button
                    fluid
                    textAlign="right"
                    tooltip="Craft 50"
                    onClick={() =>
                      act('build', { ref: recipe.ref, amount: 50 })
                    }
                  >
                    50
                  </Button>
                </Stack.Item>
              </Stack>
            </Stack.Item>
          ) : (
            <Stack.Item>
              <Stack vertical>
                <Stack.Item>
                  <Button
                    fluid
                    textAlign="right"
                    tooltip="Craft 5"
                    onClick={() => act('build', { ref: recipe.ref, amount: 5 })}
                  >
                    5
                  </Button>
                </Stack.Item>
                <Stack.Item>
                  <Button
                    fluid
                    textAlign="right"
                    tooltip="Craft 10"
                    onClick={() =>
                      act('build', { ref: recipe.ref, amount: 10 })
                    }
                  >
                    10
                  </Button>
                </Stack.Item>
                <Stack.Item>
                  <Button
                    fluid
                    textAlign="right"
                    tooltip="Craft 25"
                    onClick={() =>
                      act('build', { ref: recipe.ref, amount: 25 })
                    }
                  >
                    25
                  </Button>
                </Stack.Item>
                <Stack.Item>
                  <Button
                    fluid
                    textAlign="right"
                    tooltip="Craft 50"
                    onClick={() =>
                      act('build', { ref: recipe.ref, amount: 50 })
                    }
                  >
                    50
                  </Button>
                </Stack.Item>
              </Stack>
            </Stack.Item>
          )
        ) : (
          ''
        )}
      </Stack>
    </Section>
  );
};

type Data = {
  crafting_recipes: {
    [key: string]: CraftingRecipeData[];
  };
  is_admin: BooleanLike;
};

export const CraftMenu = (props) => {
  const { act, data } = useBackend<Data>();
  const { crafting_recipes, is_admin } = data;

  // Filter out empty categories
  const available_categories = Object.keys(crafting_recipes).filter(
    (category) => crafting_recipes[category].length !== 0,
  );

  // Total recipe count
  const recipeCount = available_categories
    .map((category) => crafting_recipes[category].length)
    .reduce((s, a) => s + a, 0);

  // -- State --
  // Compact mode
  const [showCompact, setShowCompact] = useState(false);

  // Search text
  const [searchText, setSearchText] = useSharedState('searchText', '');

  const searchName = createSearch(
    searchText,
    (item: CraftingRecipeData) => item.name,
  );

  // Pagination
  const [pages, setPages] = useState(1);

  const pageSize =
    searchText.length > 0 ? (showCompact ? 20 : 10) : showCompact ? 60 : 30;
  const displayLimit = pageSize * pages;

  // Selected Category
  const [currentCategory, setCurrentCategory] = useState(
    available_categories[0],
  );

  // -- Filter and search recipes --
  let recipes = crafting_recipes[currentCategory];

  if (searchText !== '') {
    recipes = available_categories
      .flatMap((category) => crafting_recipes[category])
      .filter(searchName);
  }

  recipes = sortBy<CraftingRecipeData>(recipes, (recipe: CraftingRecipeData) =>
    recipe.name.toUpperCase(),
  );

  // -- UI --
  return (
    <Window width={800} height={450}>
      <Window.Content>
        <Stack fill>
          <Stack.Item width="30%">
            <Section fill>
              <Stack fill vertical justify="space-between">
                <Stack.Item>
                  <Input
                    placeholder={'Search in ' + recipeCount + ' recipes...'}
                    fluid
                    value={searchText}
                    onInput={(e, value) => {
                      setPages(1);
                      setSearchText(value);
                    }}
                  />
                </Stack.Item>
                <Stack.Item grow>
                  <Box height="100%" pt={1} pr={1} overflowY="auto">
                    <Tabs fluid vertical>
                      {available_categories.map((category) => (
                        <Tabs.Tab
                          key={category}
                          selected={category === currentCategory}
                          onClick={() => {
                            setPages(1);
                            setCurrentCategory(category);
                            if (searchText.length > 0) {
                              setSearchText('');
                            }
                          }}
                        >
                          {category} ({crafting_recipes[category].length})
                        </Tabs.Tab>
                      ))}
                    </Tabs>
                  </Box>
                </Stack.Item>
                <Stack.Item>
                  <Divider />
                  {/* <Button.Checkbox fluid content="Craftable Only" /> */}
                  <Button.Checkbox
                    fluid
                    content="Compact List"
                    checked={showCompact}
                    onClick={() => setShowCompact(!showCompact)}
                  />
                </Stack.Item>
              </Stack>
            </Section>
          </Stack.Item>
          <Stack.Item grow my={-1}>
            <Box height="100%" pr={1} pt={1} mr={-1} overflowY="auto">
              {recipes.slice(0, displayLimit).map((recipe) => (
                <CraftingRecipe
                  key={recipe.ref}
                  recipe={recipe}
                  compact={showCompact}
                  admin={!!is_admin}
                />
              ))}
              {recipes.length > displayLimit && (
                <Section
                  mb={2}
                  textAlign="center"
                  style={{ cursor: 'pointer' }}
                  onClick={() => setPages(pages + 1)}
                >
                  Load {Math.min(pageSize, recipes.length - displayLimit)}{' '}
                  more...
                </Section>
              )}
            </Box>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
