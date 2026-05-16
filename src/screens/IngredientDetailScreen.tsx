import { PlaceholderState } from "../components/PlaceholderState";
import { Screen } from "../components/Screen";

export function IngredientDetailScreen() {
  return (
    <Screen>
      <PlaceholderState
        title="Ingredient detail"
        body="Ingredient explanations, aliases, functions, evidence labels, and caution notes will live here."
      />
    </Screen>
  );
}
