/**
 * A single, uniquely identifiable material.
 */
export type Material = {
  /**
   * The human-readable name of the material.
   */
  name: string;

  /**
   * An asset URL for the material's icon
   */
  icon: string;

  /**
   * The amount of material; 100 units is one sheet.
   */
  count: number;
};
