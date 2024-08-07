import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import {
  Box,
  Flex,
  Icon,
  Image,
  LabeledList,
  Section,
} from 'tgui-core/components';

const rank2icon = {
  // Blackshield
  'Blackshield Commander': ['user-tie', 'flag'],
  Sergeant: 'flag',
  Corpsman: 'shield-virus',
  'Corpsman Cadet': ['shield-virus', 'school'],
  'Combat Medic': 'shield-virus',
  'Blackshield Trooper': 'fighter-jet',
  'Blackshield Cadet': ['fighter-jet', 'school'],
  // Command
  Premier: 'user-tie',
  Steward: ['user-tie', 'shield-alt'],
  // Church
  Prime: 'sun',
  Vector: 'place-of-worship',
  Divisor: 'place-of-worship',
  Factorial: 'place-of-worship',
  Monomial: 'place-of-worship',
  Lemniscate: 'place-of-worship',
  Tessellate: 'place-of-worship',
  // Civilian
  Colonist: 'user',
  Freelancer: 'user',
  Journalist: 'newspaper',
  Visitor: 'user',
  // Lonestar
  'Chief Executive Officer': ['user-tie', 'box-open'],
  Bartender: 'cocktail',
  Barkeep: 'glass-whiskey',
  Barista: 'coffee',
  Mixologist: 'cocktail',
  Chef: 'cookie-bite',
  'Culinary Artist': 'cookie-bite',
  Cook: 'cookie-bite',
  'Line Chef': 'cookie-bite',
  Gardener: 'seedling',
  Hydroponicist: 'seedling',
  Artist: 'paint-brush',
  Clown: 'blender-phone',
  Entertainer: 'person-booth',
  Mime: 'volume-mute',
  Janitor: 'soap',
  Custodian: 'soap',
  'Sanitation Technician': 'soap',
  'Cargo Technician': 'box-open',
  'Cargo Specialist': 'box-open',
  'Lonestar Sales Technician': 'box-open',
  'Lonestar Retail Assistant': ['box-open', 'school'],
  'Lonestar Miner': 'hard-hat',
  'Lonestar Drill Technician': 'hard-hat',
  'Junior Lonestar Miner': 'hard-hat',
  // Guild
  'Guild Master': ['user-tie', 'toolbox'],
  'Guild Adept': 'toolbox',
  'Guild Trainee': ['toolbox', 'school'],
  'Guild Electrician': 'bolt',
  'Guild Mechanical Engineer': 'toolbox',
  // Medical
  'Chief Biolab Overseer': ['user-tie', 'user-md'],
  'Soteria Doctor': 'user-md',
  'Soteria Medical Student': ['user-md', 'school'],
  'Soteria Nurse': 'user-nurse',
  'Soteria Emergency Physician': ['user-md', 'hospital'],
  'Soteria Surgeon': 'user-md',
  'Soteria Lifeline Technician': 'ambulance',
  'Soteria Psychiatrist': ['user-md', 'brain'],
  'Soteria Psychologist': ['user-md', 'brain'],
  'Soteria Empath': ['user-md', 'brain'],
  // Offcolony
  'Lodge Hunt Master': ['user-tie', 'campground'],
  'Lodge Hunter': 'campground',
  'Lodge Herbalist': ['campground', 'user-md'],
  Outsider: 'campground',
  // Prospectors
  Foreman: ['user-tie', 'truck-pickup'],
  Fence: ['truck-pickup', 'money-bill-wave'],
  Salvager: ['truck-pickup', 'user-md'],
  Sawbones: ['truck-pickup', 'user-md'],
  'Rookie Salvager': ['truck-pickup', 'user-md', 'school'],
  Prospector: 'truck-pickup',
  'Rookie Prospector': ['truck-pickup', 'school'],
  'Hired Muscle': 'truck-pickup',
  // Science
  'Chief Research Overseer': 'user-graduate',
  'Soteria Scientist': 'flask',
  'Soteria Research Student': ['flask', 'school'],
  'Soteria Xenobiologist': 'meteor',
  'Soteria Xenoarcheologist': 'meteor',
  'Soteria Xenobotanist': ['biohazard', 'seedling'],
  'Soteria Research Fabricator': ['flask', 'hammer'],
  'Soteria Geneticist': 'dna',
  'Soteria Roboticist': 'robot',
  'Soteria Roboticist Trainee': ['robot', 'school'],
  'Soteria Cyberneticist': 'robot',
  'Soteria Mechanist': 'robot',
  'Soteria Biomechanical Engineer': 'robot',
  // Security
  'Warrant Officer': ['user-tie', 'user-shield'],
  'Supply Specialist': ['hat-cowboy', 'user-shield'],
  Ranger: ['user-shield', 'search'],
  'Junior Ranger': ['user-shield', 'search', 'school'],
  Detective: ['user-shield', 'search'],
  'Forensics Specialist': ['user-shield', 'search'],
  'Marshal Officer': 'user-shield',
  'Junior Marshal Officer': ['user-shield', 'school'],
  'Marshal Civil Servant': 'user-shield',
};

const RankIcon = (props: { rank: string }) => {
  const { rank } = props;

  let rankObj = rank2icon[rank];
  if (typeof rankObj === 'string') {
    return <Icon inline color="label" name={rankObj} size={2} />;
  } else if (Array.isArray(rankObj)) {
    return rankObj.map((icon) => (
      <Icon
        inline
        key={icon}
        color="label"
        name={icon}
        size={2}
        ml={0.5}
        mr={0.5}
      />
    ));
  } else {
    return <Icon inline color="label" name="user" size={2} />;
  }
};

type Data = {
  registered_name: string;
  sex: string;
  age: number;
  assignment: string;
  fingerprint_hash: string;
  blood_type: string;
  dna_hash: string;
};

export const IDCard = (props) => {
  const { data } = useBackend<Data>();

  const {
    registered_name,
    sex,
    age,
    assignment,
    fingerprint_hash,
    blood_type,
    dna_hash,
  } = data;

  const dataIter = [
    { name: 'Sex', val: sex },
    { name: 'Age', val: age },
    { name: 'Blood Type', val: blood_type },
    { name: 'Fingerprint', val: fingerprint_hash },
    { name: 'DNA Hash', val: dna_hash },
  ];

  return (
    <Window width={470} height={230}>
      <Window.Content>
        <Section fill>
          <Flex>
            <Flex.Item basis="25%" textAlign="left">
              <Box
                inline
                style={{
                  width: '101px',
                  height: '120px',
                  overflow: 'hidden',
                  outline: '2px solid #4972a1',
                }}
              >
                <Image src="front.png" width={20} ml={-11} mt={1.2} />
              </Box>
            </Flex.Item>
            <Flex.Item basis={0} grow={1}>
              <LabeledList>
                {dataIter.map((data) => (
                  <LabeledList.Item key={data.name} label={data.name}>
                    {data.val}
                  </LabeledList.Item>
                ))}
              </LabeledList>
            </Flex.Item>
          </Flex>
          <Flex
            className="IDCard__NamePlate"
            align="center"
            justify="space-around"
          >
            <Flex.Item>
              <Box textAlign="center">{registered_name}</Box>
            </Flex.Item>
            <Flex.Item>
              <Box textAlign="center">
                <RankIcon rank={assignment} />
              </Box>
            </Flex.Item>
            <Flex.Item>
              <Box textAlign="center">{assignment}</Box>
            </Flex.Item>
          </Flex>
        </Section>
      </Window.Content>
    </Window>
  );
};
