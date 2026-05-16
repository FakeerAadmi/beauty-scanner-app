import { Pressable, StyleSheet, Text } from "react-native";

import { colors } from "../theme/colors";
import { spacing } from "../theme/spacing";

type PrimaryButtonProps = {
  label: string;
  onPress: () => void;
  tone?: "primary" | "secondary";
};

export function PrimaryButton({ label, onPress, tone = "primary" }: PrimaryButtonProps) {
  return (
    <Pressable
      accessibilityRole="button"
      onPress={onPress}
      style={({ pressed }) => [
        styles.button,
        tone === "secondary" && styles.secondary,
        pressed && styles.pressed
      ]}
    >
      <Text style={[styles.label, tone === "secondary" && styles.secondaryLabel]}>{label}</Text>
    </Pressable>
  );
}

const styles = StyleSheet.create({
  button: {
    alignItems: "center",
    backgroundColor: colors.plum,
    borderRadius: 8,
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.md
  },
  secondary: {
    backgroundColor: colors.surface,
    borderColor: colors.border,
    borderWidth: 1
  },
  pressed: {
    opacity: 0.8
  },
  label: {
    color: colors.surface,
    fontSize: 16,
    fontWeight: "700"
  },
  secondaryLabel: {
    color: colors.text
  }
});
