import { useBackend } from 'tgui/backend';
import { Window } from 'tgui/layouts';
import { Section } from 'tgui-core/components';

type Data = {
  priority: string[];
  minor: string[];
};

export const AtmosAlertConsole = (props) => {
  const { act, data } = useBackend<Data>();
  const { priority = [], minor = [] } = data;

  return (
    <Window width={350} height={300}>
      <Window.Content scrollable>
        <Section title="Alarms" fill>
          <ul>
            {priority.length === 0 && (
              <li className="color-good">No Priority Alerts</li>
            )}
            {priority.map((alert) => (
              <li key={alert}>{alert}</li>
            ))}
            {minor.length === 0 && (
              <li className="color-good">No Minor Alerts</li>
            )}
            {minor.map((alert) => (
              <li key={alert}>{alert}</li>
            ))}
          </ul>
        </Section>
      </Window.Content>
    </Window>
  );
};
