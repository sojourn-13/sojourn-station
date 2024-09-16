import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import {
  AnimatedNumber,
  Button,
  LabeledList,
  ProgressBar,
  Section,
} from 'tgui-core/components';
import { BooleanLike } from 'tgui-core/react';

import { BeakerContents, BeakerReagentData } from './common/BeakerContents';

const damageTypes = [
  {
    label: 'Brute',
    type: 'bruteLoss',
  },
  {
    label: 'Respiratory',
    type: 'oxyLoss',
  },
  {
    label: 'Toxin',
    type: 'toxLoss',
  },
  {
    label: 'Burn',
    type: 'fireLoss',
  },
];

type Occupant = {
  name: string;
  statstate: string;
  stat: string;
  temperaturestatus: string;
  bodyTemperature: number;
  health: number;
  maxHealth: number;
  bruteLoss: number;
  oxyLoss: number;
  toxLoss: number;
  fireLoss: number;
};

type Data = {
  occupant: Occupant;
  hasOccupant: BooleanLike;
  isOperating: BooleanLike;
  isOpen: BooleanLike;
  cellTemperature: number;
  autoEject: BooleanLike;
  isBeakerLoaded: BooleanLike;
  beakerContents: BeakerReagentData[];
};

export const Cryo = () => {
  return (
    <Window width={400} height={550}>
      <Window.Content scrollable>
        <CryoContent />
      </Window.Content>
    </Window>
  );
};

const CryoContent = (props) => {
  const { act, data } = useBackend<Data>();
  return (
    <>
      <Section title="Occupant">
        <LabeledList>
          <LabeledList.Item label="Occupant">
            {data.occupant.name || 'No Occupant'}
          </LabeledList.Item>
          {!!data.hasOccupant && (
            <>
              <LabeledList.Item label="State" color={data.occupant.statstate}>
                {data.occupant.stat}
              </LabeledList.Item>
              <LabeledList.Item
                label="Temperature"
                color={data.occupant.temperaturestatus}
              >
                <AnimatedNumber value={data.occupant.bodyTemperature} />
                {' K'}
              </LabeledList.Item>
              <LabeledList.Item label="Health">
                <ProgressBar
                  value={data.occupant.health / data.occupant.maxHealth}
                  color={data.occupant.health > 0 ? 'good' : 'average'}
                >
                  <AnimatedNumber value={data.occupant.health} />
                </ProgressBar>
              </LabeledList.Item>
              {damageTypes.map((damageType) => (
                <LabeledList.Item
                  key={damageType.type}
                  label={damageType.label}
                >
                  <ProgressBar value={data.occupant[damageType.type] / 100}>
                    <AnimatedNumber value={data.occupant[damageType.type]} />
                  </ProgressBar>
                </LabeledList.Item>
              ))}
            </>
          )}
        </LabeledList>
      </Section>
      <Section title="Cell">
        <LabeledList>
          <LabeledList.Item label="Power">
            <Button
              icon={data.isOperating ? 'power-off' : 'times'}
              disabled={data.isOpen}
              onClick={() => act('power')}
              color={data.isOperating && 'green'}
            >
              {data.isOperating ? 'On' : 'Off'}
            </Button>
          </LabeledList.Item>
          <LabeledList.Item label="Temperature">
            <AnimatedNumber value={data.cellTemperature} /> K
          </LabeledList.Item>
          <LabeledList.Item label="Door">
            <Button
              icon={data.isOpen ? 'unlock' : 'lock'}
              onClick={() => act('door')}
            >
              {data.isOpen ? 'Open' : 'Closed'}
            </Button>
            <Button
              icon={data.autoEject ? 'sign-out-alt' : 'sign-in-alt'}
              onClick={() => act('autoeject')}
            >
              {data.autoEject ? 'Auto' : 'Manual'}
            </Button>
          </LabeledList.Item>
        </LabeledList>
      </Section>
      <Section
        title="Beaker"
        buttons={
          <Button
            icon="eject"
            disabled={!data.isBeakerLoaded}
            onClick={() => act('ejectbeaker')}
          >
            Eject
          </Button>
        }
      >
        <BeakerContents
          beakerLoaded={data.isBeakerLoaded}
          beakerContents={data.beakerContents}
        />
      </Section>
    </>
  );
};
