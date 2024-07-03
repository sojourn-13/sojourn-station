export type Reagent = {
  name: string;
  volume: number;
  id: string;
};

export type Reagents = {
  total_volume: number;
  maximum_volume: number;
  chem_temp: number;
  contents: Reagent[];
};
