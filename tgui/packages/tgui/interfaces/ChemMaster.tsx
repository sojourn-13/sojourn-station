import { Dispatch, SetStateAction, useState } from 'react';
import { useBackend } from 'tgui/backend';
import { Button } from 'tgui/components';
import { Window } from 'tgui/layouts';
import {
  AnimatedNumber,
  Box,
  LabeledList,
  Section,
  Stack,
  Table,
} from 'tgui-core/components';
import { BooleanLike, classes } from 'tgui-core/react';

import { Reagent, Reagents } from './common/Reagents';

enum SpriteType {
  Pill = 'pill',
  Bottle = 'bottle',
  Syrette = 'syrette',
  SuperSyrette = 'supeyrette',
  PillBottle = 'pill_bottle',
}

type AvailableSprites = {
  pill: string[];
  bottle: string[];
  syrette: string[];
  pill_bottle: string[];
};

type SetSprites = {
  pill: string;
  bottle: string;
  syrette: string;
  supeyrette: string;
  pill_bottle: string;
};

type AnalyzeReagentData = {
  name: string;
  desc: string;
  blood_type?: string;
  blood_DNA?: string;
};

type Data = {
  available_sprites: AvailableSprites;
  set_sprites: SetSprites;
  mode: BooleanLike;
  condi: BooleanLike;
  buffer: Reagents;
  beaker: Reagents | null;
  analyze_reagent: null | string | AnalyzeReagentData;
  max_pill_count: number;
};

export const ChemMaster = (props) => {
  const { data } = useBackend<Data>();
  const { analyze_reagent, beaker } = data;

  const [spriteMenu, setSpriteMenu] = useState<SpriteType | null>(null);

  let content = <NoBeaker />;
  if (spriteMenu) {
    content = <SpriteMenu type={spriteMenu} setSpriteMenu={setSpriteMenu} />;
  } else if (analyze_reagent) {
    content = <AnalyzeReagent analyze_reagent={analyze_reagent} />;
  } else if (beaker) {
    content = <MainScreen setSpriteMenu={setSpriteMenu} />;
  }

  return (
    <Window width={440} height={560}>
      <Window.Content scrollable>{content}</Window.Content>
    </Window>
  );
};

const NoBeaker = (props) => {
  return <Section title="No Beaker Present">Please insert beaker.</Section>;
};

const SpriteMenu = (props: {
  type: string;
  setSpriteMenu: Dispatch<SetStateAction<SpriteType | null>>;
}) => {
  const { act, data } = useBackend<Data>();
  const { type, setSpriteMenu } = props;

  let sprites;
  let selected_sprite;
  let onClick = (sprite) => act('set_sprite', { type, sprite });

  switch (type) {
    case SpriteType.Pill:
      sprites = data.available_sprites.pill;
      selected_sprite = 'pill' + data.set_sprites.pill;
      onClick = (sprite) =>
        act('set_sprite', { type, sprite: sprite.replace('pill', '') });
      break;
    case SpriteType.Bottle:
      sprites = data.available_sprites.bottle;
      selected_sprite = data.set_sprites.bottle;
      break;
    case SpriteType.Syrette:
      sprites = data.available_sprites.syrette;
      selected_sprite = data.set_sprites.syrette;
      break;
    case SpriteType.SuperSyrette:
      sprites = data.available_sprites.syrette;
      selected_sprite = data.set_sprites.supeyrette;
      break;
    case SpriteType.PillBottle:
      sprites = data.available_sprites.pill_bottle;
      selected_sprite = data.set_sprites.pill_bottle;
      break;
  }

  return (
    <Section
      title="Select Sprite"
      buttons={
        <Button
          color="bad"
          icon="window-close"
          onClick={() => setSpriteMenu(null)}
        >
          Close
        </Button>
      }
    >
      {sprites.map((sprite) => (
        <Button
          key={sprite}
          tooltip={sprite}
          selected={sprite === selected_sprite}
          p={1}
          onClick={() => {
            onClick(sprite);
          }}
        >
          <Box
            style={{ transform: 'scale(1.5)' }}
            className={classes(['chem_master32x32', sprite])}
          />
        </Button>
      ))}
    </Section>
  );
};

const AnalyzeReagent = (props: {
  analyze_reagent: AnalyzeReagentData | string;
}) => {
  const { act } = useBackend();
  const { analyze_reagent } = props;

  if (typeof analyze_reagent === 'string') {
    return (
      <Section
        title="Chemical Analysis"
        buttons={
          <Button
            icon="window-close"
            color="bad"
            onClick={() => act('analyze', { reagent: null })}
          >
            Close
          </Button>
        }
      >
        <Box color="bad">{analyze_reagent}</Box>
      </Section>
    );
  }

  return (
    <Section
      title="Chemical Analysis"
      buttons={
        <Button
          icon="window-close"
          color="bad"
          onClick={() => act('analyze', { reagent: null })}
        >
          Close
        </Button>
      }
    >
      <LabeledList>
        <LabeledList.Item label="Name">{analyze_reagent.name}</LabeledList.Item>
        <LabeledList.Item label="Description">
          {analyze_reagent.desc}
        </LabeledList.Item>
        {!!analyze_reagent.blood_type && (
          <LabeledList.Item label="Blood Type">
            {analyze_reagent.blood_type}
          </LabeledList.Item>
        )}
        {!!analyze_reagent.blood_DNA && (
          <LabeledList.Item label="Blood DNA">
            {analyze_reagent.blood_DNA}
          </LabeledList.Item>
        )}
      </LabeledList>
    </Section>
  );
};

const MainScreen = (props: {
  setSpriteMenu: Dispatch<SetStateAction<SpriteType | null>>;
}) => {
  const { act, data } = useBackend<Data>();
  const { beaker, buffer, set_sprites, mode, condi } = data;
  const { setSpriteMenu } = props;

  return (
    <>
      <Section
        title="Beaker"
        buttons={
          beaker && (
            <Box>
              <Box inline color="label" mr={2}>
                <AnimatedNumber value={beaker.total_volume} initial={0} /> /{' '}
                {beaker.maximum_volume} units
              </Box>
              <Button icon="eject" onClick={() => act('eject')}>
                Eject
              </Button>
            </Box>
          )
        }
      >
        {!beaker ? (
          <Box color="label">No beaker lodaed</Box>
        ) : beaker.contents.length === 0 ? (
          <Box color="label">Beaker is empty</Box>
        ) : (
          <Table>
            {beaker.contents.map((r) => (
              <ReagentEntry key={r.id} reagent={r} transferTo="buffer" />
            ))}
          </Table>
        )}
      </Section>
      <Section
        title="Buffer"
        buttons={
          <Box>
            <Box inline color="label" mr={1}>
              <AnimatedNumber value={buffer.total_volume} initial={0} /> /{' '}
              {buffer.maximum_volume} units
            </Box>
            <Button
              icon={mode ? 'flask' : 'trash-alt'}
              onClick={() => act('toggle_mode')}
              color={mode ? '' : 'bad'}
            >
              Transfering To {mode ? 'Beaker' : 'Disposal'}
            </Button>
          </Box>
        }
      >
        {buffer.contents.length === 0 ? (
          <Box color="label">Buffer is empty.</Box>
        ) : (
          <Table>
            {buffer.contents.map((r) => (
              <ReagentEntry key={r.id} reagent={r} transferTo="beaker" />
            ))}
          </Table>
        )}
      </Section>
      <Section title="Packaging">
        {!condi && (
          <PackageType
            name="Create Pills (24 units max)"
            icon={'pill' + set_sprites.pill}
            onClick={() => act('print', { type: SpriteType.Pill })}
            onIconChange={() => setSpriteMenu(SpriteType.Pill)}
          />
        )}
        <PackageType
          name="Create Bottle (60 units max)"
          icon={set_sprites.bottle}
          onClick={() => act('print', { type: SpriteType.Bottle })}
          onIconChange={() => setSpriteMenu(SpriteType.Bottle)}
        />
        {!condi && (
          <>
            <PackageType
              name="Create Syrette (5 units max)"
              icon={set_sprites.syrette}
              onClick={() => act('print', { type: SpriteType.Syrette })}
              onIconChange={() => setSpriteMenu(SpriteType.Syrette)}
            />
            <Stack align="center" mb={1}>
              <Stack.Item>
                <Button disabled tooltip="Change Icon (No icons available)">
                  <Box
                    className={classes(['chem_master32x32', 'supeyrette'])}
                  />
                </Button>
              </Stack.Item>
              <Stack.Item>
                <Button
                  onClick={() =>
                    act('print', { type: SpriteType.SuperSyrette })
                  }
                >
                  Create Advanced Syrette (10 units max)
                </Button>
              </Stack.Item>
            </Stack>
            <Stack align="center">
              <Stack.Item>
                <Button
                  tooltip="Change Icon"
                  onClick={() => setSpriteMenu(SpriteType.PillBottle)}
                >
                  <Box
                    className={classes([
                      'chem_master32x32',
                      set_sprites.pill_bottle,
                    ])}
                  />
                </Button>
              </Stack.Item>
              <Stack.Item>Change Pill Bottle Sprite</Stack.Item>
            </Stack>
          </>
        )}
      </Section>
    </>
  );
};

type ReagentProps = {
  reagent: Reagent;
  transferTo: string;
};

const ReagentEntry = (props: ReagentProps) => {
  const { act } = useBackend();
  const { reagent, transferTo } = props;
  return (
    <Table.Row>
      <Table.Cell>
        {reagent.name} <AnimatedNumber value={reagent.volume} initial={0} />u
      </Table.Cell>
      <Table.Cell collapsing>
        <Button
          onClick={() =>
            act('transfer', { id: reagent.id, amount: 1, target: transferTo })
          }
        >
          1
        </Button>
        <Button
          onClick={() =>
            act('transfer', { id: reagent.id, amount: 5, target: transferTo })
          }
        >
          5
        </Button>
        <Button
          onClick={() =>
            act('transfer', { id: reagent.id, amount: 10, target: transferTo })
          }
        >
          10
        </Button>
        <Button
          onClick={() =>
            act('transfer', {
              id: reagent.id,
              amount: 1000,
              target: transferTo,
            })
          }
        >
          All
        </Button>
        <Button
          icon="ellipsis-h"
          tooltip="Custom amount"
          onClick={() =>
            act('transfer', {
              id: reagent.id,
              amount: -1,
              target: transferTo,
            })
          }
        />
        <Button
          icon="question"
          tooltip="Analyze"
          onClick={() => act('analyze', { reagent: reagent.id })}
        />
      </Table.Cell>
    </Table.Row>
  );
};

type PackageTypeProps = {
  icon: string;
  name: string;
  onClick: () => void;
  onIconChange: () => void;
};

const PackageType = (props: PackageTypeProps) => {
  const { icon, name, onClick, onIconChange } = props;

  return (
    <Stack align="center" mb={1}>
      <Stack.Item>
        <Button tooltip="Change Icon" onClick={() => onIconChange()}>
          <Box className={classes(['chem_master32x32', icon])} />
        </Button>
      </Stack.Item>
      <Stack.Item>
        <Button onClick={onClick}>{name}</Button>
      </Stack.Item>
    </Stack>
  );
};
