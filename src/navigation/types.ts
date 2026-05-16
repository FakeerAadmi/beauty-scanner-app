export type RootStackParamList = {
  MainTabs: undefined;
  ProductResult: { productId?: string; barcode?: string } | undefined;
  IngredientDetail: { ingredientId?: string; ingredientName?: string } | undefined;
  Settings: undefined;
};

export type MainTabParamList = {
  Home: undefined;
  Scan: undefined;
  Search: undefined;
  SavedShelf: undefined;
  Profile: undefined;
};
