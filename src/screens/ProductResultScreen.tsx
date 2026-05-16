import type { NativeStackScreenProps } from "@react-navigation/native-stack";

import { PlaceholderState } from "../components/PlaceholderState";
import { PrimaryButton } from "../components/PrimaryButton";
import { Screen } from "../components/Screen";
import type { RootStackParamList } from "../navigation/types";

type ProductResultScreenProps = NativeStackScreenProps<RootStackParamList, "ProductResult">;

export function ProductResultScreen({ navigation }: ProductResultScreenProps) {
  return (
    <Screen>
      <PlaceholderState
        title="Product result"
        body="This screen will show product details, ingredients, transparent warnings, and skin-profile notes."
      />
      <PrimaryButton
        label="Open Ingredient Detail"
        onPress={() => navigation.navigate("IngredientDetail", { ingredientName: "Niacinamide" })}
      />
    </Screen>
  );
}
