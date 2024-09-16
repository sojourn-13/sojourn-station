import { BooleanLike, classes } from 'common/react';
import { toTitleCase } from 'common/string';
import { useState } from 'react';
import { AnimatedNumber, Button, Flex, Icon } from 'tgui/components';
import { formatSiUnit } from 'tgui/format';

import { MaterialIcon } from './MaterialIcon';
import { Material } from './Types';

export type MaterialAccessBarProps = {
  /**
   * All materials currently available to the user.
   */
  availableMaterials: Material[];

  /**
   * Invoked when the user requests that a material be ejected.
   */
  onEjectRequested?: (material: Material, quantity: number) => void;

  /**
   * Allows disabling stack-based ejection
   */
  disableStackEjection?: BooleanLike;

  /**
   * Shows a button to eject all contents
   */
  showAllButton?: BooleanLike;
};

/**
 * The formatting function applied to the quantity labels in the bar.
 */
const LABEL_FORMAT = (value: number) => formatSiUnit(value, 0);

/**
 * A bottom-docked bar for viewing and ejecting materials from local storage or
 * the ore silo. Has pop-out docks for each material type for ejecting up to
 * fifty sheets.
 */
export const MaterialAccessBar = (props: MaterialAccessBarProps) => {
  const {
    availableMaterials,
    onEjectRequested,
    disableStackEjection,
    showAllButton,
  } = props;

  // sortBy(availableMaterials, (m: Material) => MATERIAL_RARITY[m.name])

  return (
    <Flex wrap>
      {availableMaterials.map((material) => (
        <Flex.Item grow basis={4.5} key={material.name}>
          <MaterialCounter
            material={material}
            onEjectRequested={(quantity) =>
              onEjectRequested && onEjectRequested(material, quantity)
            }
            disableStackEjection={disableStackEjection}
          />
        </Flex.Item>
      ))}
      {showAllButton && (
        <Flex.Item grow basis={4.5}>
          <EjectAllButton
            onEjectRequested={() =>
              onEjectRequested &&
              onEjectRequested({ name: 'all', icon: '', count: 0 }, 0)
            }
          />
        </Flex.Item>
      )}
    </Flex>
  );
};

type MaterialCounterProps = {
  material: Material;
  onEjectRequested: (quantity: number) => void;
  disableStackEjection?: BooleanLike;
};

const MaterialCounter = (props: MaterialCounterProps) => {
  const { material, onEjectRequested, disableStackEjection } = props;

  const [hovering, setHovering] = useState(false);

  return (
    <div
      onMouseEnter={() => setHovering(true)}
      onMouseLeave={() => setHovering(false)}
      className={classes([
        'MaterialDock',
        hovering && 'MaterialDock--active',
        material.count < 1 && 'MaterialDock--disabled',
      ])}
    >
      <Flex direction="column-reverse">
        <Flex
          direction="column"
          textAlign="center"
          onClick={() => onEjectRequested(1)}
          className="MaterialDock__Label"
        >
          <Flex.Item>
            <MaterialIcon material={material} />
          </Flex.Item>
          <Flex.Item>
            <AnimatedNumber value={material.count} format={LABEL_FORMAT} />
          </Flex.Item>
        </Flex>
        {hovering && (
          <div className={'MaterialDock__Dock'}>
            <Flex vertical direction={'column-reverse'}>
              {'Eject ' + toTitleCase(material.name)}
              {!disableStackEjection && (
                <>
                  <EjectButton
                    sheets={material.count}
                    amount={5}
                    onEject={onEjectRequested}
                  />
                  <EjectButton
                    sheets={material.count}
                    amount={10}
                    onEject={onEjectRequested}
                  />
                  <EjectButton
                    sheets={material.count}
                    amount={25}
                    onEject={onEjectRequested}
                  />
                  <EjectButton
                    sheets={material.count}
                    amount={50}
                    onEject={onEjectRequested}
                  />
                </>
              )}
            </Flex>
          </div>
        )}
      </Flex>
    </div>
  );
};

const EjectAllButton = (props: { onEjectRequested: () => void }) => {
  const { onEjectRequested } = props;

  const [hovering, setHovering] = useState(false);

  return (
    <div
      onMouseEnter={() => setHovering(true)}
      onMouseLeave={() => setHovering(false)}
      className={classes(['MaterialDock', hovering && 'MaterialDock--active'])}
    >
      <Flex direction="column-reverse">
        <Flex
          direction="column"
          textAlign="center"
          onClick={() => onEjectRequested()}
          className="MaterialDock__Label"
        >
          <Flex.Item>
            <Flex align="center" justify="center" height="34px">
              <Flex.Item>
                <Icon name="eject" />
              </Flex.Item>
            </Flex>
          </Flex.Item>
          <Flex.Item>Eject All</Flex.Item>
        </Flex>
      </Flex>
    </div>
  );
};

type EjectButtonProps = {
  amount: number;
  sheets: number;
  onEject: (quantity: number) => void;
};

const EjectButton = (props: EjectButtonProps) => {
  const { amount, sheets, onEject } = props;

  return (
    <Button
      fluid
      color={'transparent'}
      className={classes([
        'Fabricator__PrintAmount',
        amount > sheets && 'Fabricator__PrintAmount--disabled',
      ])}
      onClick={() => onEject(amount)}
    >
      &times;{amount}
    </Button>
  );
};
