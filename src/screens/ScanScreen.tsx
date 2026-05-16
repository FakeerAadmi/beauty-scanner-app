import type { BottomTabScreenProps } from "@react-navigation/bottom-tabs";
import type { CompositeScreenProps } from "@react-navigation/native";
import type { NativeStackScreenProps } from "@react-navigation/native-stack";

import { PlaceholderState } from "../components/PlaceholderState";
import { PrimaryButton } from "../components/PrimaryButton";
import { Screen } from "../components/Screen";
import type { MainTabParamList, RootStackParamList } from "../navigation/types";

type ScanScreenProps = CompositeScreenProps<
  BottomTabScreenProps<MainTabParamList, "Scan">,
  NativeStackScreenProps<RootStackParamList>
>;

export function ScanScreen({ navigation }: ScanScreenProps) {
  return (
    <Screen>
      <PlaceholderState
        title="Scan"
        body="Barcode scanning will be added after the app shell and data model are stable."
      />
      <PrimaryButton
        label="Open Product Result"
        onPress={() => navigation.navigate("ProductResult", { barcode: "demo-barcode" })}
      />
    </Screen>
  );
}
