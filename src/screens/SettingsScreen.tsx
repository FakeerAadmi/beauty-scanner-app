import { PlaceholderState } from "../components/PlaceholderState";
import { Screen } from "../components/Screen";

export function SettingsScreen() {
  return (
    <Screen>
      <PlaceholderState
        title="Settings"
        body="Privacy, app preferences, and educational disclaimers will be configured here."
      />
    </Screen>
  );
}
