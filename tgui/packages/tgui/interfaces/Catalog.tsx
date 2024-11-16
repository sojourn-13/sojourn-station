import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import { NTOSData } from 'tgui/layouts/NtosWindow';
import {
  Box,
  Button,
  ColorBox,
  Divider,
  Icon,
  Image,
  Input,
  LabeledList,
  Section,
  Stack,
  VirtualList,
} from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';

enum CatalogKey {
  All = 'all',
  Cooking = 'cooking',
  Drinks = 'drinks',
  Reagents = 'chemistry',
}

enum CatalogBrowseStage {
  List = 'list',
  Entry = 'entry',
}

type Entry = {
  id: string;
  name: string;
};

type SharedRecipeData = {
  id: string;
  thing_nature: string;
  name: string;
  description: string;
};

type Data = {
  front_page_name: string;
  front_page_desc: string;
  front_page_icon: string | null;
  catalog_key: CatalogKey;
  catalog_browse_stage: CatalogBrowseStage | null;
  catalog_search: string;
  /** This is only partial data, it should be typecast based on ID */
  entries: Entry[];
  /** This is only partial data, it should be typecast based on ID */
  selected_entry: SharedRecipeData | null;
  last_entry: string | null;
} & NTOSData;

export const Catalog = (props) => {
  return (
    <Window width={640} height={700}>
      <Window.Content>
        <CatalogContent />
      </Window.Content>
    </Window>
  );
};

export const CatalogContent = (props) => {
  const { data } = useBackend<Data>();

  const { catalog_browse_stage } = data;

  let content = <CatalogFrontPage />;

  if (catalog_browse_stage === CatalogBrowseStage.List) {
    content = <CatalogList />;
  } else if (catalog_browse_stage === CatalogBrowseStage.Entry) {
    content = <CatalogEntry />;
  }

  return content;
};

const CatalogFrontPage = (props) => {
  const { act, data } = useBackend<Data>();

  const { front_page_name, front_page_desc, front_page_icon } = data;

  return (
    <Section>
      <Stack vertical align="center" justify="center" wrap>
        {front_page_icon && (
          <Stack.Item>
            <Image width={'200px'} src={front_page_icon} />
          </Stack.Item>
        )}
        <Stack.Item fontSize={1.5}>{front_page_name}</Stack.Item>
        <Stack.Item fontSize={1.2}>{front_page_desc}</Stack.Item>
        <Stack.Item>
          <Button
            fontSize={1.5}
            icon="folder-open"
            onClick={() => act('state_machine_enter_list')}
          >
            Browse
          </Button>
        </Stack.Item>
      </Stack>
    </Section>
  );
};

const CatalogHeader = (props: { showSearch?: boolean; showBack?: boolean }) => {
  const { act, data } = useBackend<Data>();
  const { catalog_search, front_page_name, front_page_icon, last_entry } = data;

  const { showSearch, showBack } = props;

  return (
    <Stack height="120px" align="center" justify="space-around">
      {front_page_icon && (
        <Stack.Item>
          <Image height="120px" src={front_page_icon} />
        </Stack.Item>
      )}
      <Stack.Item>
        <Stack vertical>
          <Stack.Item fontSize={1.25}>{front_page_name}</Stack.Item>
          {showSearch && (
            <Stack.Item>
              <Stack align="baseline">
                <Stack.Item>
                  <Icon name="search" />
                </Stack.Item>
                <Stack.Item>
                  <Input
                    width={25}
                    fluid
                    placeholder="Search catalog..."
                    value={catalog_search}
                    onChange={(e, search) =>
                      act('set_catalog_search', { search })
                    }
                  />
                </Stack.Item>
              </Stack>
            </Stack.Item>
          )}
          {showBack && (
            <Stack.Item>
              {!!last_entry && (
                <Button
                  fluid
                  icon="chevron-left"
                  onClick={() => act('state_machine_pop_entry')}
                >
                  Back to {last_entry}
                </Button>
              )}
              <Button
                fluid
                icon="home"
                onClick={() => act('state_machine_enter_list')}
              >
                Return To List {last_entry ? '(Erase History)' : ''}
              </Button>
            </Stack.Item>
          )}
        </Stack>
      </Stack.Item>
    </Stack>
  );
};

const CatalogCustomHeader = (props: { type: CatalogKey }) => {
  const { type } = props;

  return <Section>Meow</Section>;
};

const CatalogList = (props) => {
  const { data } = useBackend<Data>();
  const { catalog_key, entries } = data;

  let catalogListContent = <Box color="bad">This catalog is corrupted.</Box>;

  if (catalog_key === CatalogKey.Cooking) {
    catalogListContent = (
      <CatalogListCooking entries={entries as CookingEntry[]} />
    );
  } else if (catalog_key === CatalogKey.Drinks) {
    catalogListContent = (
      <CatalogListDrinks entries={entries as DrinkEntry[]} />
    );
  } else if (catalog_key === CatalogKey.Reagents) {
    catalogListContent = (
      <CatalogListReagents entries={entries as ReagentEntry[]} />
    );
  } else if (catalog_key === CatalogKey.All) {
    catalogListContent = (
      <CatalogListAll entries={entries as Partial<ReagentEntry>[]} />
    );
  }

  return (
    <Section fill height="100%">
      <CatalogHeader showSearch />
      <Divider />
      {catalogListContent}
    </Section>
  );
};

type CookingEntry = {
  id: string;
  name: string;
  icon: string;
  product_name: string;
  product_count: number;
  byproduct_name: string;
  byproduct_count: 0;
  thing_nature: null;
};

const CatalogListCooking = (props: { entries: CookingEntry[] }) => {
  const { act } = useBackend<Data>();
  const { entries } = props;

  return (
    <>
      <Stack p={1} textAlign="center">
        <Stack.Item basis="10%" textAlign="left">
          Preview
        </Stack.Item>
        <Stack.Item basis="40%" textAlign="left">
          Name
        </Stack.Item>
        <Stack.Item basis="25%" textAlign="left">
          Product
        </Stack.Item>
        <Stack.Item basis="25%" textAlign="left">
          Byproduct
        </Stack.Item>
      </Stack>
      <Section scrollable fill height="70%" className="CatalogList">
        <VirtualList>
          {entries.map((entry) => (
            <Stack key={entry.id} height={4} align="center" p={1}>
              <Stack.Item basis="10%">
                <Box width="32px" height="32px" position="relative">
                  <Box
                    position="absolute"
                    left="-32px"
                    top="-48px"
                    className={entry.icon}
                    style={{ transform: 'scale(0.25)' }}
                  />
                </Box>
              </Stack.Item>
              <Stack.Item basis="40%">
                <Button
                  color="transparent"
                  textColor="white"
                  style={{ borderBottom: '1px dashed #fff' }}
                  onClick={() =>
                    act('state_machine_enter_entry', { entry: entry.id })
                  }
                >
                  {entry.name}
                </Button>
              </Stack.Item>
              <Stack.Item basis="25%">
                {entry.product_count} {entry.product_name}
              </Stack.Item>
              <Stack.Item basis="25%">
                {entry.byproduct_count > 0 && (
                  <>
                    {entry.byproduct_count} {entry.byproduct_name}
                  </>
                )}
              </Stack.Item>
            </Stack>
          ))}
        </VirtualList>
      </Section>
    </>
  );
};

type DrinkEntry = Entry & {
  thing_nature: string;
};

const CatalogListDrinks = (props: { entries: DrinkEntry[] }) => {
  const { act } = useBackend();
  const { entries } = props;

  return (
    <>
      <Stack p={1} textAlign="center">
        <Stack.Item basis="70%" textAlign="left">
          Name
        </Stack.Item>
        <Stack.Item basis="30%" textAlign="left">
          Type
        </Stack.Item>
      </Stack>
      <Section scrollable fill height="70%" className="CatalogList">
        <VirtualList>
          {entries.map((entry) => (
            <Stack key={entry.id} height={4} align="center" p={1}>
              <Stack.Item basis="70%">
                <Button
                  color="transparent"
                  textColor="white"
                  style={{ borderBottom: '1px dashed #fff' }}
                  onClick={() =>
                    act('state_machine_enter_entry', { entry: entry.id })
                  }
                >
                  {entry.name}
                </Button>
              </Stack.Item>
              <Stack.Item basis="30%">{entry.thing_nature}</Stack.Item>
            </Stack>
          ))}
        </VirtualList>
      </Section>
    </>
  );
};

type ReagentEntry = Entry & {
  reagent_state: string;
  reagent_type: string;
};

const CatalogListReagents = (props: { entries: ReagentEntry[] }) => {
  const { act } = useBackend();
  const { entries } = props;

  return (
    <>
      <Stack p={1} textAlign="center">
        <Stack.Item basis="40%" textAlign="left">
          Name
        </Stack.Item>
        <Stack.Item basis="20%" textAlign="left">
          Phase
        </Stack.Item>
        <Stack.Item basis="40%" textAlign="left">
          Type
        </Stack.Item>
      </Stack>
      <Section scrollable fill height="70%" className="CatalogList">
        <VirtualList>
          {entries.map((entry) => (
            <Stack key={entry.id} height={4} align="center" p={1}>
              <Stack.Item basis="40%">
                <Button
                  color="transparent"
                  textColor="white"
                  style={{ borderBottom: '1px dashed #fff' }}
                  onClick={() =>
                    act('state_machine_enter_entry', { entry: entry.id })
                  }
                >
                  {entry.name}
                </Button>
              </Stack.Item>
              <Stack.Item basis="20%">{entry.reagent_state}</Stack.Item>
              <Stack.Item basis="40%">{entry.reagent_type}</Stack.Item>
            </Stack>
          ))}
        </VirtualList>
      </Section>
    </>
  );
};

const CatalogListAll = (props: { entries: Partial<ReagentEntry>[] }) => {
  const { act } = useBackend();
  const { entries } = props;

  return (
    <>
      <Stack p={1} textAlign="center">
        <Stack.Item basis="40%" textAlign="left">
          Name
        </Stack.Item>
        <Stack.Item basis="20%" textAlign="left">
          Phase
        </Stack.Item>
        <Stack.Item basis="40%" textAlign="left">
          Type
        </Stack.Item>
      </Stack>
      <Section scrollable fill height="70%" className="CatalogList">
        <VirtualList>
          {entries.map((entry) => (
            <Stack key={entry.id} height={4} align="center" p={1}>
              <Stack.Item basis="40%">
                <Button
                  color="transparent"
                  textColor="white"
                  style={{ borderBottom: '1px dashed #fff' }}
                  onClick={() =>
                    act('state_machine_enter_entry', { entry: entry.id })
                  }
                >
                  {entry.name}
                </Button>
              </Stack.Item>
              <Stack.Item basis="20%">
                {entry.reagent_state || 'Unknown'}
              </Stack.Item>
              <Stack.Item basis="40%">
                {entry.reagent_type || 'Unknown'}
              </Stack.Item>
            </Stack>
          ))}
        </VirtualList>
      </Section>
    </>
  );
};

const CatalogEntry = (props) => {
  const { data } = useBackend<Data>();

  const { selected_entry } = data;

  if (!selected_entry) {
    return (
      <Section fill>
        <CatalogHeader showBack />
        <Divider />
        <Box color="bad">This entry is corrupt.</Box>
      </Section>
    );
  }

  let entryView = (
    <Box color="bad">Unknown recipe type {selected_entry.id}</Box>
  );

  // We do not use catalog_key here because linked navigation can introduce things from outside of our catalog
  // that we should always display correctly.
  if (selected_entry.id.startsWith('/datum/cooking_with_jane/recipe')) {
    entryView = (
      <CatalogEntryCooking
        selected_entry={selected_entry as CatalogEntryCookingData}
      />
    );
  } else if (
    selected_entry.id.startsWith('/datum/reagent/drink') ||
    selected_entry.id.startsWith('/datum/reagent/ethanol')
  ) {
    entryView = (
      <CatalogEntryDrinks
        selected_entry={selected_entry as CatalogEntryDrinksData}
      />
    );
    // Other reagents
  } else if (selected_entry.id.startsWith('/datum/reagent')) {
    entryView = (
      <CatalogEntryReagents
        selected_entry={selected_entry as CatalogEntryReagentsData}
      />
    );
  }

  return (
    <Section fill>
      <CatalogHeader showBack />
      <Divider />
      {entryView}
    </Section>
  );
};

type CatalogEntryCookingData = SharedRecipeData & {
  icon: string;
  product_is_reagent: BooleanLike;
  product_name: string;
  product_count: number;
  byproduct_name: string;
  byproduct_count: number;
  /** Includes HTML in compile time blocks */
  recipe_guide: string;
  create_in: string;
};

const CatalogEntryCooking = (props: {
  selected_entry: CatalogEntryCookingData;
}) => {
  const { selected_entry } = props;

  const {
    name,
    icon,
    product_is_reagent,
    product_name,
    product_count,
    byproduct_name,
    byproduct_count,
    description,
    recipe_guide,
    create_in,
  } = selected_entry;

  return (
    <Section fill height="80%" style={{ overflowY: 'auto' }}>
      <Stack align="center" justify="space-around">
        <Stack.Item grow>
          <Box fontSize={2} bold>
            {name}
          </Box>
          <Box>{create_in}</Box>
          <Box>{description}</Box>
        </Stack.Item>
        <Stack.Item grow textAlign="center">
          <Box className={icon} />
        </Stack.Item>
      </Stack>
      <Box fontSize={1.5} bold mt={1}>
        Specifications
      </Box>
      <LabeledList>
        <LabeledList.Item
          label={product_is_reagent ? 'Reagent Name' : 'Product Name'}
        >
          {product_name}
        </LabeledList.Item>
        <LabeledList.Item
          label={product_is_reagent ? 'Units Produced' : 'Product Count'}
        >
          {product_count}
        </LabeledList.Item>
        {byproduct_count > 0 && (
          <>
            <LabeledList.Item label="Reagent Byproduct">
              {byproduct_name}
            </LabeledList.Item>
            <LabeledList.Item label="Byproduct Units Produced">
              {byproduct_count}
            </LabeledList.Item>
          </>
        )}
        {!!recipe_guide && (
          <LabeledList.Item label="Recipe">
            <Box
              style={{
                borderRadius: '5px',
                border: '1px solid #4972a1',
                overflowY: 'auto',
              }}
              p={1}
              height={10}
            >
              {/* Safety: This is compile time specified HTML, no player input. */}
              {/* eslint-disable react/no-danger */}
              <div dangerouslySetInnerHTML={{ __html: recipe_guide }} />
            </Box>
          </LabeledList.Item>
        )}
      </LabeledList>
    </Section>
  );
};

// Used for both drinks and reagents
type Reagent = {
  type: string;
  reagent: string;
  units: number;
};

type CatalogEntryDrinksData = SharedRecipeData & {
  taste: string;
  strength: string;
  temperature: string | null;
  nutrition: string | null;
  recipe_data: RecipeData[] | null;
};

const CatalogEntryDrinks = (props: {
  selected_entry: CatalogEntryDrinksData;
}) => {
  const { selected_entry } = props;

  const {
    name,
    description,
    thing_nature,
    taste,
    strength,
    temperature,
    nutrition,
    recipe_data,
  } = selected_entry;

  return (
    <Section fill height="80%" style={{ overflowY: 'auto' }}>
      <Box fontSize={2} bold>
        {name}
      </Box>
      <Box>{description}</Box>
      <Box>{taste}</Box>
      <Box fontSize={1.5} bold mt={1}>
        Specifications
      </Box>
      <LabeledList>
        <LabeledList.Item label="Type">{thing_nature}</LabeledList.Item>
        {!!strength && (
          <LabeledList.Item label="Alcohol Strength">
            {strength}
          </LabeledList.Item>
        )}
        {!!temperature && (
          <LabeledList.Item label="Served">{temperature}</LabeledList.Item>
        )}
        {!!nutrition && (
          <LabeledList.Item label="Nourishment">{nutrition}</LabeledList.Item>
        )}
        {!!recipe_data && (
          <LabeledList.Item label="Recipe">
            {recipe_data.map((data, index) => (
              <Box
                key={index}
                style={{
                  borderRadius: '5px',
                  border: '1px solid #4972a1',
                  overflowY: 'auto',
                }}
                p={1}
                height={10}
              >
                <Recipe recipe_data={data} />
              </Box>
            ))}
          </LabeledList.Item>
        )}
      </LabeledList>
    </Section>
  );
};

type CatalogEntryReagentsData = SharedRecipeData &
  Partial<{
    taste: string;
    scannable: string;
    reagent_type: string;
    reagent_state: string;
    color: string;
    metabolism_blood: number;
    metabolism_stomach: number;
    nsa: number;
    addiction_threshold: number;
    addiction_chance: number;
    overdose: number;
    heating_decompose: { types: { name: string; type: string }[] } | null;
    heating_point: number | null;
    chilling_decompose: { types: { name: string; type: string }[] } | null;
    chilling_point: number | null;
    result_of_decomposition_in: { name: string; type: string }[];
    recipe_data: RecipeData[] | null;
    can_be_used_in: { name: string; type: string }[];
  }>;

const CatalogEntryReagents = (props: {
  selected_entry: CatalogEntryReagentsData;
}) => {
  const { act } = useBackend();

  const { selected_entry } = props;
  const {
    name,
    description,
    taste,
    scannable,
    reagent_type,
    reagent_state,
    color,
    metabolism_blood,
    metabolism_stomach,
    nsa,
    addiction_threshold,
    addiction_chance,
    overdose,
    result_of_decomposition_in,
    recipe_data,
    // TODO:
    heating_decompose,
    heating_point,
    chilling_decompose,
    chilling_point,
    can_be_used_in,
  } = selected_entry;

  return (
    <Section fill height="80%" style={{ overflowY: 'auto' }}>
      <Box fontSize={2} bold>
        {name}
      </Box>
      <Box>{description}</Box>
      <Box>{taste}</Box>
      {!scannable && <Box>Impossible to scan.</Box>}
      <Box fontSize={1.5} bold mt={1}>
        Specifications
      </Box>
      <LabeledList>
        {!!reagent_type && (
          <LabeledList.Item label="Type">{reagent_type}</LabeledList.Item>
        )}
        {!!reagent_state && (
          <LabeledList.Item label="Phase">
            {reagent_state} at STP
          </LabeledList.Item>
        )}
        {!!color && (
          <LabeledList.Item label="Color">
            <ColorBox color={color} width={3} />
          </LabeledList.Item>
        )}
        {!!metabolism_blood && (
          <LabeledList.Item label="Metabolism">
            <Box>{metabolism_blood}u/s in blood</Box>
            {metabolism_stomach ? (
              <Box>{metabolism_stomach}u/s in stomach</Box>
            ) : (
              <Box>{metabolism_blood / 2}u/s in stomach</Box>
            )}
          </LabeledList.Item>
        )}
        <LabeledList.Item label="NSA">{nsa} units</LabeledList.Item>
        {!!addiction_threshold && (
          <LabeledList.Item label="Addiction Threshold">
            {addiction_threshold}u
          </LabeledList.Item>
        )}
        {!!addiction_chance && (
          <LabeledList.Item label="Addiction Chance">
            {addiction_chance}
          </LabeledList.Item>
        )}
        {!!overdose && (
          <LabeledList.Item label="Overdose At">{overdose}u</LabeledList.Item>
        )}
        {!!heating_decompose && heating_decompose.types.length && (
          <LabeledList.Item
            label={`Decomposition Above ${heating_point}K`}
            labelColor="red"
          >
            <Box
              p={1}
              style={{
                borderRadius: '5px',
                border: '1px solid #4972a1',
              }}
            >
              {heating_decompose.types.map((typ) => (
                <Button
                  key={typ.type}
                  onClick={() =>
                    act('state_machine_enter_entry', { entry: typ.type })
                  }
                >
                  {typ.name}
                </Button>
              ))}
            </Box>
          </LabeledList.Item>
        )}
        {!!chilling_decompose && chilling_decompose.types.length && (
          <LabeledList.Item
            label={`Decomposition Below ${chilling_point}K`}
            labelColor="blue"
          >
            <Box
              p={1}
              style={{
                borderRadius: '5px',
                border: '1px solid #4972a1',
              }}
            >
              {chilling_decompose.types.map((typ) => (
                <Button
                  key={typ.type}
                  onClick={() =>
                    act('state_machine_enter_entry', { entry: typ.type })
                  }
                >
                  {typ.name}
                </Button>
              ))}
            </Box>
          </LabeledList.Item>
        )}
        {!!result_of_decomposition_in && (
          <LabeledList.Item label="Result Of Decomposition">
            <Box
              p={1}
              style={{
                borderRadius: '5px',
                border: '1px solid #4972a1',
              }}
            >
              {result_of_decomposition_in.map((decomp) => (
                <Button
                  key={decomp.type}
                  onClick={() =>
                    act('state_machine_enter_entry', { entry: decomp.type })
                  }
                >
                  {decomp.name}
                </Button>
              ))}
            </Box>
          </LabeledList.Item>
        )}
        {!!recipe_data && (
          <LabeledList.Item label="Recipe">
            {recipe_data.map((data, index) => (
              <Box
                key={index}
                style={{
                  borderRadius: '5px',
                  border: '1px solid #4972a1',
                  overflowY: 'auto',
                }}
                p={1}
                height={10}
              >
                <Recipe recipe_data={data} />
              </Box>
            ))}
          </LabeledList.Item>
        )}
        {!!can_be_used_in && (
          <LabeledList.Item label="Takes Part In Reactions">
            <Box
              p={1}
              style={{
                borderRadius: '5px',
                border: '1px solid #4972a1',
              }}
            >
              {can_be_used_in.map((r) => (
                <Button
                  key={r.type}
                  onClick={() =>
                    act('state_machine_enter_entry', { entry: r.type })
                  }
                >
                  {r.name}
                </Button>
              ))}
            </Box>
          </LabeledList.Item>
        )}
      </LabeledList>
    </Section>
  );
};

type RecipeData = {
  reagents: (Reagent & { parts: string })[] | null;
  catalyst: Reagent[] | null;
  inhibitors: Reagent[] | null;
  byproducts: Reagent[] | null;
  minimum_temperature?: number | null;
  maximum_temperature?: number | null;
  required_object: string;
  result_amount: string;
};

const Recipe = (props: { recipe_data: RecipeData }) => {
  const { act } = useBackend();

  const { recipe_data } = props;
  const {
    reagents,
    catalyst,
    inhibitors,
    byproducts,
    result_amount,
    minimum_temperature,
    maximum_temperature,
    required_object,
  } = recipe_data;

  let temperature;

  if (minimum_temperature && maximum_temperature) {
    temperature = (
      <Box>
        At temperatures between {minimum_temperature}K and {maximum_temperature}
        K
      </Box>
    );
  } else if (minimum_temperature) {
    temperature = <Box>At temperatures above {minimum_temperature}K</Box>;
  } else if (maximum_temperature) {
    temperature = (
      <Box>
        At temperatures belo
        {maximum_temperature}K
      </Box>
    );
  }

  return (
    <Box>
      {!!reagents &&
        reagents.map((v) => (
          <Box key={v.reagent}>
            {v.parts} of{' '}
            <Button
              onClick={() =>
                act('state_machine_enter_entry', { entry: v.type })
              }
            >
              {v.reagent}
            </Button>
          </Box>
        ))}
      {!!catalyst &&
        catalyst.map((v) => (
          <Box key={v.reagent}>
            In presence of {v.units}u of{' '}
            <Button
              onClick={() =>
                act('state_machine_enter_entry', { entry: v.type })
              }
            >
              {v.reagent}
            </Button>
          </Box>
        ))}
      {!!inhibitors &&
        inhibitors.map((v) => (
          <Box key={v.reagent}>
            Without presence of
            <Button
              onClick={() =>
                act('state_machine_enter_entry', { entry: v.type })
              }
            >
              {v.reagent}
            </Button>
          </Box>
        ))}
      {!!byproducts &&
        byproducts.map((v) => (
          <Box key={v.reagent}>
            Additional Creation of
            <Button
              onClick={() =>
                act('state_machine_enter_entry', { entry: v.type })
              }
            >
              {v.reagent}
            </Button>
          </Box>
        ))}
      {temperature}
      {required_object && (
        <Box>Should take place inside of {required_object}</Box>
      )}
      <Box>Results in {result_amount} of substance</Box>
    </Box>
  );
};
