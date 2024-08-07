import { ReactNode, useEffect, useState } from 'react';
import { useBackend } from 'tgui/backend';
import { Button, Icon } from 'tgui/components';
import { Window } from 'tgui/layouts';
import {
  Box,
  Flex,
  Image,
  ProgressBar,
  Section,
  Stack,
  Tooltip,
} from 'tgui-core/components';
import { round } from 'tgui-core/math';
import { BooleanLike } from 'tgui-core/react';
import { toTitleCase } from 'tgui-core/string';

import { IconProps } from '../components/Icon';
import { MaterialAccessBar } from './Fabrication/MaterialAccessBar';

type Material = {
  name: string;
  count: number;
  icon: string;
};

type CurrentItemData = {
  name: string;
  icon: string;
  icon_is_image: BooleanLike;
  materials: Material[];
};

type Data = {
  materials: Material[];

  current_item: CurrentItemData;
  progress: number;
  capacity: number;
  input_side: string;
  output_side: string;
  refuse_side: string;
  show_config: BooleanLike;
  show_iconfig: BooleanLike;
  show_oconfig: BooleanLike;
  show_rconfig: BooleanLike;
};

export const Smelter = (props) => {
  const { act, data } = useBackend<Data>();

  const {
    materials,
    current_item,
    progress,
    capacity,
    input_side,
    output_side,
    refuse_side,
  } = data;

  const materialCount =
    (materials &&
      materials.length &&
      round(
        materials.map((mat) => mat.count).reduce((a, b) => a + b),
        2,
      )) ||
    0;

  return (
    <Window width={600} height={500}>
      <Window.Content>
        <Stack fill vertical>
          <Stack.Item>
            <SmelterPipeline current_item={current_item} progress={progress} />
          </Stack.Item>
          <Stack.Item grow>
            <SidesConfig />
          </Stack.Item>
          <Stack.Item>
            <Section
              fill
              title={'Materials (' + materialCount + '/' + capacity + ')'}
            >
              <MaterialAccessBar
                availableMaterials={materials}
                onEjectRequested={(material, amount) => {
                  if (material.name === 'all') {
                    act('eject');
                  } else {
                    act('eject', { name: material.name });
                  }
                }}
                disableStackEjection
                showAllButton
              />
            </Section>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};

type SmelterPipelineProps = Pick<Data, 'current_item' | 'progress'>;

const SmelterPipeline = (props: SmelterPipelineProps) => {
  const { current_item, progress } = props;

  return (
    <Section backgroundColor="black">
      <Stack align="center" textAlign="center" height={5}>
        <Stack.Item>
          <CurrentItem
            present={!!current_item}
            icon={current_item?.icon}
            icon_is_image={current_item?.icon_is_image}
            progress={progress}
          />
        </Stack.Item>
        <Stack.Item ml={2} mr={2}>
          <AnimatedArrows on={!!current_item} />
        </Stack.Item>
        <Stack.Item grow height={5}>
          <Box height={5 / 3} bold nowrap overflow="hidden">
            {current_item
              ? 'Currently Smelting: ' + toTitleCase(current_item.name)
              : ''}
          </Box>
          <Box height={5 / 3}>
            <ProgressBar
              value={progress}
              maxValue={100}
              ranges={{ bad: [0, 25], average: [25, 75], good: [75, 100] }}
            />
          </Box>
          {/* This is just for spacing to keep the progress bar centered */}
          <Box height={5 / 3} />
        </Stack.Item>
        <Stack.Item ml={2} mr={2}>
          <AnimatedArrows on={!!current_item} />
        </Stack.Item>
        <Stack.Item>
          <ItemMaterials current_item={current_item} />
        </Stack.Item>
      </Stack>
    </Section>
  );
};

type ItemMaterialsProps = Pick<Data, 'current_item'>;

const ItemMaterials = (props: ItemMaterialsProps) => {
  const { current_item } = props;

  if (
    !current_item ||
    !current_item.materials ||
    current_item.materials.length === 0
  ) {
    return <Icon name="burn" size={3} color="gray" />;
  }

  const { materials } = current_item;

  return (
    <Box nowrap>
      <Stack>
        {materials.map((data, index) => (
          <Stack.Item key={index} m={-1}>
            <Tooltip content={toTitleCase(data.name)} position="bottom">
              <Flex align="center" justify="center" direction="column">
                <Flex.Item width={4}>
                  <Box className={data.icon} />
                </Flex.Item>
                <Flex.Item color="label" mt={-1}>
                  {round(data.count, 2)}
                </Flex.Item>
              </Flex>
            </Tooltip>
          </Stack.Item>
        ))}
      </Stack>
    </Box>
  );
};

const CurrentItem = (props: {
  present: boolean;
  icon?: string;
  icon_is_image?: BooleanLike;
  progress: number;
}) => {
  const { present, icon, icon_is_image, progress } = props;

  if (!present) {
    return (
      <Box
        width={5}
        height={5}
        style={{ borderRadius: '5%', border: '3px dotted #4972a1' }}
      />
    );
  }

  return (
    <Box
      width={5}
      height={5}
      style={{ borderRadius: '5%', border: '3px solid #4972a1' }}
      position="relative"
      overflow="hidden"
    >
      <Flex height="100%" align="center" justify="center">
        <Flex.Item>
          <ShakingElement>
            {icon ? (
              icon_is_image ? (
                <Image width={5} height={5} src={icon} m={-1} />
              ) : (
                <Box className={icon} />
              )
            ) : (
              <Icon
                inline
                size={2}
                name="trash"
                style={{
                  color:
                    progress > 30 ? (progress > 60 ? '#c00' : '#880') : '#0c0',
                  transition: 'color 1s ease',
                }}
              />
            )}
          </ShakingElement>
        </Flex.Item>
      </Flex>
      {/* Fire hehehehe */}
      <Flex
        width="100%"
        align="center"
        justify="center"
        position="absolute"
        bottom={-0.5}
        left={0}
      >
        <Flex.Item>
          <RollyIcon
            name="fire"
            color="bad"
            size={1.5}
            rotMin={0}
            rotMax={45}
          />
        </Flex.Item>
        <Flex.Item>
          <RollyIcon
            name="fire"
            color="bad"
            size={1.5}
            rotMin={-30}
            rotMax={30}
          />
        </Flex.Item>
        <Flex.Item>
          <RollyIcon
            name="fire"
            color="bad"
            size={1.5}
            rotMin={-45}
            rotMax={0}
          />
        </Flex.Item>
      </Flex>
    </Box>
  );
};

const SidesConfig = (props) => {
  const { act, data } = useBackend<Data>();

  const { input_side, output_side, refuse_side } = data;

  return (
    <Section title="Sides Config" fill>
      <Flex align="center" justify="space-around" height="100%">
        {/* Input */}
        <Flex.Item>
          <Stack align="center" vertical>
            <Stack.Item>
              <Button
                width={4.3}
                height={4.3}
                textAlign="center"
                verticalAlignContent="middle"
                icon="hand-paper"
                selected={input_side === 'North'}
                onClick={() => act('setside_input', { side: 'NORTH' })}
              />
            </Stack.Item>
            <Stack.Item>
              <Stack>
                <Stack.Item>
                  <Button
                    width={4.3}
                    height={4.3}
                    textAlign="center"
                    verticalAlignContent="middle"
                    icon="hand-paper"
                    selected={input_side === 'West'}
                    onClick={() => act('setside_input', { side: 'WEST' })}
                  />
                </Stack.Item>
                <Stack.Item>
                  <Button
                    width={4.3}
                    height={4.3}
                    backgroundColor="good"
                    textAlign="center"
                    verticalAlignContent="middle"
                  >
                    Input
                  </Button>
                </Stack.Item>
                <Stack.Item>
                  <Button
                    width={4.3}
                    height={4.3}
                    textAlign="center"
                    verticalAlignContent="middle"
                    icon="hand-paper"
                    selected={input_side === 'East'}
                    onClick={() => act('setside_input', { side: 'EAST' })}
                  />
                </Stack.Item>
              </Stack>
            </Stack.Item>
            <Stack.Item>
              <Button
                width={4.3}
                height={4.3}
                textAlign="center"
                verticalAlignContent="middle"
                icon="hand-paper"
                selected={input_side === 'South'}
                onClick={() => act('setside_input', { side: 'SOUTH' })}
              />
            </Stack.Item>
          </Stack>
        </Flex.Item>
        <Flex.Item>
          <AnimatedArrows on />
        </Flex.Item>
        {/* Output */}
        <Flex.Item>
          <Stack align="center" vertical>
            <Stack.Item>
              <Button
                width={4.3}
                height={4.3}
                textAlign="center"
                verticalAlignContent="middle"
                icon="hand-paper"
                selected={output_side === 'North'}
                onClick={() => act('setside_output', { side: 'NORTH' })}
              />
            </Stack.Item>
            <Stack.Item>
              <Stack>
                <Stack.Item>
                  <Button
                    width={4.3}
                    height={4.3}
                    textAlign="center"
                    verticalAlignContent="middle"
                    icon="hand-paper"
                    selected={output_side === 'West'}
                    onClick={() => act('setside_output', { side: 'WEST' })}
                  />
                </Stack.Item>
                <Stack.Item>
                  <Button
                    width={4.3}
                    height={4.3}
                    backgroundColor="bad"
                    textAlign="center"
                    verticalAlignContent="middle"
                  >
                    Output
                  </Button>
                </Stack.Item>
                <Stack.Item>
                  <Button
                    width={4.3}
                    height={4.3}
                    textAlign="center"
                    verticalAlignContent="middle"
                    icon="hand-paper"
                    selected={output_side === 'East'}
                    onClick={() => act('setside_output', { side: 'EAST' })}
                  />
                </Stack.Item>
              </Stack>
            </Stack.Item>
            <Stack.Item>
              <Button
                width={4.3}
                height={4.3}
                textAlign="center"
                verticalAlignContent="middle"
                icon="hand-paper"
                selected={output_side === 'South'}
                onClick={() => act('setside_output', { side: 'SOUTH' })}
              />
            </Stack.Item>
          </Stack>
        </Flex.Item>
        {/* Refuse */}
        <Flex.Item>
          <Stack align="center" vertical>
            <Stack.Item>
              <Button
                width={4.3}
                height={4.3}
                textAlign="center"
                verticalAlignContent="middle"
                icon="hand-paper"
                selected={refuse_side === 'North'}
                onClick={() => act('setside_refuse', { side: 'NORTH' })}
              />
            </Stack.Item>
            <Stack.Item>
              <Stack>
                <Stack.Item>
                  <Button
                    width={4.3}
                    height={4.3}
                    textAlign="center"
                    verticalAlignContent="middle"
                    icon="hand-paper"
                    selected={refuse_side === 'West'}
                    onClick={() => act('setside_refuse', { side: 'WEST' })}
                  />
                </Stack.Item>
                <Stack.Item>
                  <Button
                    width={4.3}
                    height={4.3}
                    backgroundColor="brown"
                    textAlign="center"
                    verticalAlignContent="middle"
                  >
                    Refuse
                  </Button>
                </Stack.Item>
                <Stack.Item>
                  <Button
                    width={4.3}
                    height={4.3}
                    textAlign="center"
                    verticalAlignContent="middle"
                    icon="hand-paper"
                    selected={refuse_side === 'East'}
                    onClick={() => act('setside_refuse', { side: 'EAST' })}
                  />
                </Stack.Item>
              </Stack>
            </Stack.Item>
            <Stack.Item>
              <Button
                width={4.3}
                height={4.3}
                textAlign="center"
                verticalAlignContent="middle"
                icon="hand-paper"
                selected={refuse_side === 'South'}
                onClick={() => act('setside_refuse', { side: 'SOUTH' })}
              />
            </Stack.Item>
          </Stack>
        </Flex.Item>
      </Flex>
    </Section>
  );
};

// Shinies below here

export const AnimatedArrows = (props: { on: boolean }) => {
  const { on } = props;

  const [activeArrow, setActiveArrow] = useState(0);

  // Lower to make it animate faster
  const SPEED = 200;

  useEffect(() => {
    const id = setInterval(() => {
      setActiveArrow((arrow) => (arrow + 1) % 3);
    }, SPEED);
    return () => clearInterval(id);
  }, []);

  return (
    <Box>
      <Icon
        color={!on ? 'gray' : activeArrow === 0 ? 'green' : 'white'}
        name="chevron-right"
      />
      <Icon
        color={!on ? 'gray' : activeArrow === 1 ? 'green' : 'white'}
        name="chevron-right"
      />
      <Icon
        color={!on ? 'gray' : activeArrow === 2 ? 'green' : 'white'}
        name="chevron-right"
      />
    </Box>
  );
};

export const ShakingElement = (props: {
  children: ReactNode;
  speed?: number;
  bounds?: [number, number];
}) => {
  const { children } = props;

  const speed = props.speed || 100;
  const bounds = props.bounds || [1, 1];

  const [offsetX, setOffsetX] = useState(0);
  const [offsetY, setOffsetY] = useState(0);

  useEffect(() => {
    const id = setInterval(() => {
      setOffsetX((offsetX) => {
        let diffX = Math.random() - 0.5;
        let newOffsetX = offsetX + diffX;
        if (newOffsetX > bounds[0] || newOffsetX < -bounds[0]) {
          newOffsetX = offsetX - diffX;
        }
        return newOffsetX;
      });

      setOffsetY((offsetY) => {
        let diffY = Math.random() - 0.5;
        let newOffsetY = offsetY + diffY;
        if (newOffsetY > bounds[0] || newOffsetY < -bounds[0]) {
          newOffsetY = offsetY - diffY;
        }
        return newOffsetY;
      });
    }, speed);
    return () => clearInterval(id);
  }, [speed, bounds]);

  return (
    <Box ml={offsetX} mt={offsetY}>
      {children}
    </Box>
  );
};

export const RollyIcon = (
  props: IconProps & {
    speed?: number;
    rotMin?: number;
    rotMax?: number;
    stepSize?: number;
  },
) => {
  const speed = props.speed !== undefined ? props.speed : 90;
  const stepSize = props.stepSize !== undefined ? props.stepSize : 5;
  const rotMin = props.rotMin !== undefined ? props.rotMin : 0;
  const rotMax = props.rotMax !== undefined ? props.rotMax : 360;

  const [rotation, setRotation] = useState(rotMin);
  const [step, setStep] = useState(stepSize);
  useEffect(() => {
    const id = setInterval(() => {
      setRotation((rot) => {
        return rot + step;
      });
    }, speed);
    return () => clearInterval(id);
  }, [speed, step]);
  useEffect(() => {
    const id = setInterval(() => {
      setStep((step) => {
        if (rotation > rotMax && step > 0) {
          return -step;
        } else if (rotation < rotMin && step < 0) {
          return -step;
        } else {
          return step;
        }
      });
    }, speed);
    return () => clearInterval(id);
  }, [speed, rotation]);

  return <Icon rotation={rotation} {...props} />;
};
