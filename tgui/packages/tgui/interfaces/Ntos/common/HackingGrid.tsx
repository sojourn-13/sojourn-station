import { ReactElement, useEffect, useState } from 'react';
import { Box } from 'tgui/components';

/**
 * Used as a progress indicator in many different syndicate programs
 *
 * Produces a `width`x`height` (24x10) character grid of 1s or 0s, the number of 1s increases as `percentage` goes from 0 to 1
 *
 * Looks like this:
 *
 * ```
 * 01010111
 * 00101001
 * 00110011
 * ```
 */
export const HackingGrid = (props: {
  percentage: number;
  width?: number;
  height?: number;
}) => {
  const { percentage } = props;
  let { width, height } = props;

  if (width === undefined) {
    width = 24;
  }
  if (height === undefined) {
    height = 10;
  }

  const [items, setItems] = useState<ReactElement[]>([]);

  useEffect(() => {
    const items: ReactElement[] = [];
    for (let y = 0; y < height; y++) {
      let row = '';
      for (let x = 0; x < width; x++) {
        row += Math.random() < percentage ? '1' : '0';
      }
      items.push(<Box>{row}</Box>);
    }
    setItems(items);
  }, [percentage, width, height]);

  return <Box>{items}</Box>;
};
