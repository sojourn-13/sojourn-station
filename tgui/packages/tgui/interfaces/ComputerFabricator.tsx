import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import {
  AnimatedNumber,
  Box,
  Button,
  Icon,
  Section,
  Stack,
  Table,
  Tooltip,
} from 'tgui-core/components';
import { round } from 'tgui-core/math';

enum State {
  DeviceSelection = 0,
  HardwareSelection = 1,
  Payment = 2,
  ThankYou = 3,
}

enum DeviceType {
  Laptop = 1,
  Tablet = 2,
}

type Data = {
  state: State;
  devtype: number;
  hw_battery: number;
  hw_disk: number;
  hw_netcard: number;
  hw_tesla: number;
  hw_nanoprint: number;
  hw_card: number;
  hw_cpu: number;
  hw_aislot: number;
  totalprice: number;
};

export const ComputerFabricator = (props) => {
  const { act, data } = useBackend<Data>();

  const { state } = data;

  let content = <Box color="bad">Bad state: {state}</Box>;

  let stateNumber = 'three steps';
  if (state === State.DeviceSelection) {
    content = <DeviceSelection />;
  } else if (state === State.HardwareSelection) {
    content = <HardwareSelection />;
    stateNumber = 'two steps';
  } else if (state === State.Payment) {
    content = <Payment />;
    stateNumber = 'one step';
  } else if (state === State.ThankYou) {
    content = (
      <Section title="Thank you for your purchase!">
        Should you experience any issues with your new device, contact technical
        support at support@computerservice.nt
      </Section>
    );
    stateNumber = 'negative one';
  }

  return (
    <Window width={360} height={400}>
      <Window.Content>
        <Section italic>
          <Stack align="center" justify="space-between">
            <Stack.Item>
              The Device of Your Dreams&trade; is just {stateNumber} away...
            </Stack.Item>
            {state !== State.DeviceSelection && (
              <Stack.Item>
                <Button icon="undo" onClick={() => act('clean_order')}>
                  Reset Order
                </Button>
              </Stack.Item>
            )}
          </Stack>
        </Section>
        {content}
      </Window.Content>
    </Window>
  );
};

const DeviceSelection = (props) => {
  const { act } = useBackend();

  return (
    <Section fill height="88%" title="Step 1: Select Device Type">
      <Stack align="center" justify="space-around" height="100%">
        <Stack.Item grow>
          <Button
            textAlign="center"
            p={2}
            pt={4}
            fontSize={2}
            fluid
            onClick={() => act('pick_device', { device: DeviceType.Laptop })}
          >
            <Stack vertical>
              <Stack.Item>
                <Icon name="laptop" size={4} m={0} />
              </Stack.Item>
              <Stack.Item>Laptop</Stack.Item>
            </Stack>
          </Button>
        </Stack.Item>
        <Stack.Item grow>
          <Button
            textAlign="center"
            p={2}
            pt={4}
            fontSize={2}
            fluid
            onClick={() => act('pick_device', { device: DeviceType.Tablet })}
          >
            <Stack vertical>
              <Stack.Item>
                <Icon name="tablet-alt" size={4} m={0} />
              </Stack.Item>
              <Stack.Item>Tablet</Stack.Item>
            </Stack>
          </Button>
        </Stack.Item>
      </Stack>
    </Section>
  );
};

const HardwareSelection = (props) => {
  const { act, data } = useBackend<Data>();

  const {
    totalprice,
    devtype,
    hw_battery,
    hw_disk,
    hw_netcard,
    hw_cpu,
    hw_tesla,
    hw_nanoprint,
    hw_card,
    hw_aislot,
  } = data;

  return (
    <Section title="Step 2: Personalize your device">
      <Table>
        <Table.Row>
          <Table.Cell collapsing color="label">
            Current Price:
          </Table.Cell>
          <Table.Cell collapsing>
            <AnimatedNumber
              value={totalprice}
              format={(val) => round(val, 2) + 'cr'}
            />
          </Table.Cell>
        </Table.Row>
        <HardwareSelectionRow
          label="Battery"
          selected={hw_battery}
          options={{ Standard: 1, Upgraded: 2, Advanced: 3 }}
          onClick={(value) => act('hw_battery', { value: value })}
          tooltip="Allows your device to operate without external utility power source. Advanced batteries increase battery life."
        />
        <HardwareSelectionRow
          label="Hard Drive"
          selected={hw_disk}
          options={{ Standard: 1, Upgraded: 2, Advanced: 3 }}
          onClick={(value) => act('hw_disk', { value: value })}
          tooltip="Stores file on your device. Advanced drives can store more files, but use more power, shortening battery life."
        />
        <HardwareSelectionRow
          label="Network Card"
          selected={hw_netcard}
          options={{ None: 0, Standard: 1, Advanced: 2 }}
          onClick={(value) => act('hw_netcard', { value: value })}
          tooltip="Allows your device to wirelessly connect to the local NTNet network. Basic cards are limited to on-colony use, while advanced cards can operate anywhere near the uplink, which includes the asteroid outposts. Advanced cards also tend to have better bandwidth."
        />
        {devtype === DeviceType.Laptop && (
          <HardwareSelectionRow
            label="Processor Unit"
            selected={hw_cpu}
            options={{ Standard: 1, Advanced: 2 }}
            onClick={(value) => act('hw_cpu', { value: value })}
            tooltip="Critical for your device's functionality. It allows you to run programs from your hard drive. Advanced CPUs use more power, but allow you to run more programs on background at once."
          />
        )}
        <HardwareSelectionRow
          label="Tesla Relay"
          selected={hw_tesla}
          options={{ None: 0, Standard: 1 }}
          onClick={(value) => act('hw_tesla', { value: value })}
          tooltip="An advanced wireless power relay that allows your device to connect to nearby area power controller to provide alternative power source."
        />
        <HardwareSelectionRow
          label="Nano Printer"
          selected={hw_nanoprint}
          options={{ None: 0, Standard: 1 }}
          onClick={(value) => act('hw_nanoprint', { value: value })}
          tooltip="Device that allows printing of various documents. This device was certified EcoFriendlyPlus and is capable of recycling existing paper for printing purposes."
        />
        <HardwareSelectionRow
          label="Card Reader"
          selected={hw_card}
          options={{ None: 0, Standard: 1 }}
          onClick={(value) => act('hw_card', { value: value })}
          tooltip="Adds a slot that allows you to manipulate RFID cards. Please note that this is not necessary to allow the device to read your identification, it is just necessary to manipulate other cards."
        />
        <HardwareSelectionRow
          label="Intellicard Slot"
          selected={hw_aislot}
          options={{ None: 0, Standard: 1 }}
          onClick={(value) => act('hw_aislot', { value: value })}
          tooltip="A specialised high powered hardware that can hold an intellicard with active AI personality. It is required for some specialised programs to run properly."
        />
        <Table.Row>
          <Table.Cell color="label">Confirm Order:</Table.Cell>
          <Table.Cell colSpan={2}>
            <Button
              mt={1}
              fluid
              color="good"
              icon="money-bill-wave"
              fontSize={1.5}
              textAlign="center"
              onClick={() => act('confirm_order')}
            >
              Purchase
            </Button>
          </Table.Cell>
        </Table.Row>
      </Table>
    </Section>
  );
};

const HardwareSelectionRow = (props: {
  label: string;
  selected: number;
  options: { [name: string]: number };
  onClick: (string) => void;
  tooltip?: string;
}) => {
  const { label, selected, options, onClick, tooltip } = props;
  return (
    <Table.Row>
      {tooltip ? (
        <Tooltip content={tooltip} position="right">
          <Table.Cell collapsing color="label">
            <Box
              inline
              style={{ borderBottom: '0.15rem dashed currentcolor ' }}
            >
              {label}:
            </Box>
          </Table.Cell>
        </Tooltip>
      ) : (
        <Table.Cell collapsing color="label">
          {label}:
        </Table.Cell>
      )}
      {Object.entries(options).map(([name, id]) => (
        <Table.Cell collapsing key={id}>
          <Button
            mt={1}
            onClick={() => onClick(id)}
            selected={selected === id}
            fluid
            textAlign="center"
          >
            {name}
          </Button>
        </Table.Cell>
      ))}
      {/* Last cell at the end forces everything to squish */}
      <Table.Cell />
    </Table.Row>
  );
};

const Payment = (props) => {
  const { act, data } = useBackend<Data>();

  const { totalprice } = data;

  return (
    <Section title="Step 3: Payment" textAlign="center" fill height="87%">
      <Stack vertical align="center" justify="center" fill>
        <Stack.Item>
          <Box bold>Your device is now ready for fabrication.</Box>
        </Stack.Item>
        <Stack.Item mt={8}>
          <Icon name="id-card" size={4} />
        </Stack.Item>
        <Stack.Item mt={1} mb={8} italic>
          Please swipe your identification card to finish purchase.
        </Stack.Item>
        <Stack.Item>
          <Box inline color="label" mr={1} fontSize={2}>
            Grand Total:
          </Box>
          <Box inline fontSize={2}>
            {totalprice}cr
          </Box>
        </Stack.Item>
      </Stack>
    </Section>
  );
};
