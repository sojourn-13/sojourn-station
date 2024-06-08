/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

import { Flex, FlexProps } from './Flex';

export function LabeledControls(props: FlexProps) {
  const { children, wrap, ...rest } = props;

  return (
    <Flex
      mx={-0.5}
      wrap={wrap}
      align="stretch"
      justify="space-between"
      {...rest}
    >
      {children}
    </Flex>
  );
}

type ItemProps = {
  label: string;
  basis?: string | number;
} & FlexProps;

function LabeledControlsItem(props: ItemProps) {
  const { label, children, mx = 1, basis, ...rest } = props;

  return (
    <Flex.Item mx={mx} basis={basis}>
      <Flex
        height="100%"
        direction="column"
        align="center"
        textAlign="center"
        justify="space-between"
        {...rest}
      >
        <Flex.Item />
        <Flex.Item>{children}</Flex.Item>
        <Flex.Item color="label">{label}</Flex.Item>
      </Flex>
    </Flex.Item>
  );
}

LabeledControls.Item = LabeledControlsItem;
