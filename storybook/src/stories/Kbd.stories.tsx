import { Meta, StoryObj } from "@storybook/react";
import { Kbd } from "./Kbd";

const meta = {
  title: "Widgets/Kbd",
  component: Kbd,
  parameters: {
    layout: "centered",
  },
  argTypes: {
    icon: { control: { type: "text" } },
  },
} satisfies Meta<typeof Kbd>;

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  args: {},
};

export const With_Size: Story = {
  args: {},
};
