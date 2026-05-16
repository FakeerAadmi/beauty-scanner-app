import { PlaceholderState } from "../components/PlaceholderState";
import { Screen } from "../components/Screen";

export function SavedShelfScreen() {
  return (
    <Screen>
      <PlaceholderState
        title="Saved shelf"
        body="Saved products and favorites will appear here once authentication and Supabase storage are added."
      />
    </Screen>
  );
}
