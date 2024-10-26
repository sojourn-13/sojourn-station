import { useBackend } from 'tgui/backend';
import { Button } from 'tgui/components';
import { Window } from 'tgui/layouts';
import { Flex, Section } from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';

type Floor = {
  id: number;
  ref: string;
  queued: BooleanLike;
  target: BooleanLike;
  current: BooleanLike;
  label: string;
  name: string;
};

type Data = {
  doors_open: BooleanLike;
  fire_mode: BooleanLike;
  floors: Floor[];
};

export const Turbolift = (props) => {
  const { act, data } = useBackend<Data>();

  const { floors, doors_open, fire_mode } = data;

  return (
    <Window width={480} height={260 + (fire_mode ? 1 : 0) * 25}>
      <Window.Content>
        <Section
          fill
          title="Floor Selection"
          className={fire_mode ? 'Section--elevator--fire' : null}
          buttons={
            <>
              <Button
                icon={doors_open ? 'door-open' : 'door-closed'}
                selected={doors_open && !fire_mode}
                color={fire_mode ? 'red' : null}
                onClick={() => act('toggle_doors')}
              >
                {doors_open
                  ? fire_mode
                    ? 'Close Doors (SAFETY OFF)'
                    : 'Doors Open'
                  : 'Doors Closed'}
              </Button>
              <Button
                icon="exclamation-triangle"
                color="bad"
                onClick={() => act('emergency_stop')}
              >
                Emergency Stop
              </Button>
            </>
          }
        >
          {!fire_mode || (
            <Section
              className="Section--elevator--fire"
              textAlign="center"
              title="FIREFIGHTER MODE ENGAGED"
            />
          )}
          <Flex wrap="wrap">
            {floors.map((floor) => (
              <Flex.Item basis="100%" key={floor.id}>
                <Flex align="center" justify="space-around">
                  <Flex.Item basis="40%" textAlign="right" mr={2}>
                    {floor.label || 'Floor #' + floor.id}
                  </Flex.Item>
                  <Flex.Item basis="8%">
                    <Button
                      icon="circle"
                      color={
                        floor.current
                          ? 'red'
                          : floor.target
                            ? 'green'
                            : floor.queued
                              ? 'yellow'
                              : null
                      }
                      onClick={() => act('move_to_floor', { ref: floor.ref })}
                    />
                  </Flex.Item>
                  <Flex.Item basis="50%" grow={1}>
                    {floor.name}
                  </Flex.Item>
                </Flex>
              </Flex.Item>
            ))}
          </Flex>
        </Section>
      </Window.Content>
    </Window>
  );
};
