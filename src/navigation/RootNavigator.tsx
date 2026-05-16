import { NavigationContainer } from "@react-navigation/native";
import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";
import { createNativeStackNavigator } from "@react-navigation/native-stack";

import { HomeScreen } from "../screens/HomeScreen";
import { IngredientDetailScreen } from "../screens/IngredientDetailScreen";
import { ProductResultScreen } from "../screens/ProductResultScreen";
import { ProfileScreen } from "../screens/ProfileScreen";
import { SavedShelfScreen } from "../screens/SavedShelfScreen";
import { ScanScreen } from "../screens/ScanScreen";
import { SearchScreen } from "../screens/SearchScreen";
import { SettingsScreen } from "../screens/SettingsScreen";
import { colors } from "../theme/colors";
import type { MainTabParamList, RootStackParamList } from "./types";

const Stack = createNativeStackNavigator<RootStackParamList>();
const Tabs = createBottomTabNavigator<MainTabParamList>();

function MainTabs() {
  return (
    <Tabs.Navigator
      screenOptions={{
        headerShown: false,
        tabBarActiveTintColor: colors.plum,
        tabBarInactiveTintColor: colors.mutedText,
        tabBarStyle: {
          backgroundColor: colors.surface,
          borderTopColor: colors.border
        }
      }}
    >
      <Tabs.Screen name="Home" component={HomeScreen} options={{ title: "Home" }} />
      <Tabs.Screen name="Scan" component={ScanScreen} options={{ title: "Scan" }} />
      <Tabs.Screen name="Search" component={SearchScreen} options={{ title: "Search" }} />
      <Tabs.Screen name="SavedShelf" component={SavedShelfScreen} options={{ title: "Shelf" }} />
      <Tabs.Screen name="Profile" component={ProfileScreen} options={{ title: "Profile" }} />
    </Tabs.Navigator>
  );
}

export function RootNavigator() {
  return (
    <NavigationContainer>
      <Stack.Navigator
        screenOptions={{
          contentStyle: { backgroundColor: colors.background },
          headerStyle: { backgroundColor: colors.background },
          headerShadowVisible: false,
          headerTintColor: colors.text,
          headerTitleStyle: { fontWeight: "700" }
        }}
      >
        <Stack.Screen name="MainTabs" component={MainTabs} options={{ headerShown: false }} />
        <Stack.Screen name="ProductResult" component={ProductResultScreen} options={{ title: "Product" }} />
        <Stack.Screen name="IngredientDetail" component={IngredientDetailScreen} options={{ title: "Ingredient" }} />
        <Stack.Screen name="Settings" component={SettingsScreen} options={{ title: "Settings" }} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}
