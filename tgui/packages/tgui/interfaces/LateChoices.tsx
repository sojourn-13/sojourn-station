import { uniq } from '../../common/collections';
import { useBackend } from '../backend';
import { Box, Button, Divider, NoticeBox, Section, Stack } from '../components';
import { Window } from '../layouts';
import { departmentData } from './common/departments';

type Job = {
  title: string;
  departments: string[];
  current_positions: number;
  active: number;
};

type Data = {
  name: string;
  duration: string;
  evac: 'None' | 'CrewTransfer' | 'Emergency' | 'Gone';
  jobs: Job[];
};

export const LateChoices = (props) => {
  const { act, data } = useBackend<Data>();

  const { name, duration, evac, jobs } = data;

  const departments = uniq(jobs.flatMap((job) => job.departments)).sort(
    (a, b) =>
      Object.keys(departmentData).indexOf(a) -
      Object.keys(departmentData).indexOf(b),
  );

  const unassociated_jobs = jobs.filter((job) => job.departments.length === 0);

  return (
    <Window width={400} height={640}>
      <Window.Content scrollable>
        <Section>
          <Box fontSize={1.4} bold textAlign="center">
            Welcome, {name}
          </Box>
          <Box fontSize={1.2} textAlign="center">
            Round Duration: {duration}
          </Box>
          <Divider />
          <Evacuation data={evac} />
          <Box>Choose one of the following open/valid positions.</Box>
          {departments.map((department) => {
            let filtered_jobs = jobs.filter(
              (job) => job.departments.indexOf(department) !== -1,
            );

            return (
              <Section
                key={department}
                className={'CrewManifest--' + department}
                title={departmentData[department].name}
              >
                {filtered_jobs.map((job) => (
                  <Button
                    fluid
                    key={job.title}
                    onClick={() => act('join', { job: job.title })}
                  >
                    <Stack>
                      <Stack.Item grow>{job.title}</Stack.Item>
                      <Stack.Item>
                        ({job.current_positions}) (Active: {job.active})
                      </Stack.Item>
                    </Stack>
                  </Button>
                ))}
              </Section>
            );
          })}
          {unassociated_jobs.length !== 0 && (
            <Section title="Misc">
              {unassociated_jobs.map((job) => (
                <Button
                  fluid
                  key={job.title}
                  onClick={() => act('join', { job: job.title })}
                >
                  <Stack>
                    <Stack.Item grow>{job.title}</Stack.Item>
                    <Stack.Item>
                      ({job.current_positions}) (Active: {job.active})
                    </Stack.Item>
                  </Stack>
                </Button>
              ))}
            </Section>
          )}
        </Section>
      </Window.Content>
    </Window>
  );
};

export const Evacuation = (props) => {
  const { data } = props;

  switch (data) {
    case 'None':
      return '';
    case 'CrewTransfer':
      return (
        <NoticeBox danger>
          The vessel is currently undergoing crew transfer procedures.
        </NoticeBox>
      );
    case 'Emergency':
      return (
        <NoticeBox danger>
          The vessel is currently undergoing evacuation procedures.
        </NoticeBox>
      );
    case 'Gone':
      return <NoticeBox danger>The vessel has been evacuated.</NoticeBox>;
  }
};
