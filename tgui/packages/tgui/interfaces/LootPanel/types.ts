export type SearchItem = {
  name: string;
  path: string;
  ref: string;
} & Partial<{
  icon: string;
}>;

export type SearchGroup = {
  amount: number;
  item: SearchItem;
};
