import { BooleanLike } from 'common/react';

import { AnimatedNumber, Box } from '../../components';

export type BeakerReagentData = {
  name: string;
  volume: number;
};

export type BeakerContentsProps = {
  beakerLoaded: BooleanLike;
  beakerContents: BeakerReagentData[];
};

export const BeakerContents = (props: BeakerContentsProps) => {
  const { beakerLoaded, beakerContents } = props;
  return (
    <Box>
      {(!beakerLoaded && <Box color="label">No beaker loaded.</Box>) ||
        (beakerContents.length === 0 && (
          <Box color="label">Beaker is empty.</Box>
        ))}
      {beakerContents.map((chemical) => (
        <Box key={chemical.name} color="label">
          <AnimatedNumber initial={0} value={chemical.volume} />
          {' units of ' + chemical.name}
        </Box>
      ))}
    </Box>
  );
};
