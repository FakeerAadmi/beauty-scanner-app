import type { BottomTabScreenProps } from "@react-navigation/bottom-tabs";
import type { CompositeScreenProps } from "@react-navigation/native";
import type { NativeStackScreenProps } from "@react-navigation/native-stack";

import { PlaceholderState } from "../components/PlaceholderState";
import { PrimaryButton } from "../components/PrimaryButton";
import { Screen } from "../components/Screen";
import type { MainTabParamList, RootStackParamList } from "../navigation/types";

type SearchScreenProps = CompositeScreenProps<
  BottomTabScreenProps<MainTabParamList, "Search">,
  NativeStackScreenProps<RootStackParamList>
>;

export function SearchScreen({ navigation }: SearchScreenProps) {
  return (
    <Screen>
      <PlaceholderState
        title="Search"
        body="Product search will connect to Supabase in a later phase. This route is ready for the search UI."
      />
      <PrimaryButton
        label="Open Product Result"
        onPress={() => navigation.navigate("ProductResult", { productId: "sample-product" })}
      />
    </Screen>
  );
}
