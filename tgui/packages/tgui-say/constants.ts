/** Window sizes in pixels */
export enum WINDOW_SIZES {
  small = 30,
  medium = 50,
  large = 70,
  width = 231,
}

/** Line lengths for autoexpand */
export enum LINE_LENGTHS {
  small = 22,
  medium = 45,
}

/**
 * Radio prefixes.
 * Displays the name in the left button, tags a css class.
*/
export const RADIO_PREFIXES = {
  ':b ': 'BlkShld',
  ':c ': 'Cmd',
  ':e ': 'Guild',
  ':h ': 'Dept',
  ':j ': 'MedIcm',
  ':k ': 'Prosp',
  ':m ': 'Med',
  ':n ': 'Sci',
  ':p ': 'AI',
  ':s ': 'Marsh',
  ':t ': 'Church',
  ':u ': 'Supp',
  ':v ': 'Svc',
  ':w ': 'Whis',
  ':y ': 'Merc',
} as const;
