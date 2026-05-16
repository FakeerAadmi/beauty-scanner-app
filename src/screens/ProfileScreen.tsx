import type { BottomTabScreenProps } from "@react-navigation/bottom-tabs";
import type { CompositeScreenProps } from "@react-navigation/native";
import type { NativeStackScreenProps } from "@react-navigation/native-stack";

import { PlaceholderState } from "../components/PlaceholderState";
import { PrimaryButton } from "../components/PrimaryButton";
import { Screen } from "../components/Screen";
import type { MainTabParamList, RootStackParamList } from "../navigation/types";

type ProfileScreenProps = CompositeScreenProps<
  BottomTabScreenProps<MainTabParamList, "Profile">,
  NativeStackScreenProps<RootStackParamList>
>;

export function ProfileScreen({ navigation }: ProfileScreenProps) {
  return (
    <Screen>
      <PlaceholderState
        title="Profile"
        body="Skin type, concerns, sensitivities, and avoid-list settings will be collected here."
      />
      <PrimaryButton label="Settings" tone="secondary" onPress={() => navigation.navigate("Settings")} />
    </Screen>
  );
}
