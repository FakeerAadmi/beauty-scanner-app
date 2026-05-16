import type { BottomTabScreenProps } from "@react-navigation/bottom-tabs";
import type { CompositeScreenProps } from "@react-navigation/native";
import type { NativeStackScreenProps } from "@react-navigation/native-stack";
import { StyleSheet, Text, View } from "react-native";

import { PrimaryButton } from "../components/PrimaryButton";
import { Screen } from "../components/Screen";
import { colors } from "../theme/colors";
import { spacing } from "../theme/spacing";
import type { MainTabParamList, RootStackParamList } from "../navigation/types";

type HomeScreenProps = CompositeScreenProps<
  BottomTabScreenProps<MainTabParamList, "Home">,
  NativeStackScreenProps<RootStackParamList>
>;

export function HomeScreen({ navigation }: HomeScreenProps) {
  return (
    <Screen>
      <View style={styles.header}>
        <Text style={styles.eyebrow}>Skincare scanner</Text>
        <Text style={styles.title}>Understand a product before it reaches your shelf.</Text>
        <Text style={styles.body}>
          Scan a barcode, search products, or inspect ingredients with clear educational notes.
        </Text>
      </View>

      <View style={styles.actions}>
        <PrimaryButton label="Scan Barcode" onPress={() => navigation.navigate("Scan")} />
        <PrimaryButton label="Search Products" tone="secondary" onPress={() => navigation.navigate("Search")} />
        <PrimaryButton
          label="View Sample Product"
          tone="secondary"
          onPress={() => navigation.navigate("ProductResult", { productId: "sample-product" })}
        />
        <PrimaryButton label="My Shelf" tone="secondary" onPress={() => navigation.navigate("SavedShelf")} />
      </View>
    </Screen>
  );
}

const styles = StyleSheet.create({
  header: {
    gap: spacing.sm,
    marginBottom: spacing.xl
  },
  eyebrow: {
    color: colors.sage,
    fontSize: 14,
    fontWeight: "800",
    textTransform: "uppercase"
  },
  title: {
    color: colors.text,
    fontSize: 32,
    fontWeight: "800",
    lineHeight: 38
  },
  body: {
    color: colors.mutedText,
    fontSize: 16,
    lineHeight: 24
  },
  actions: {
    gap: spacing.md
  }
});
