class Product {
  const Product({
    required this.id,
    required this.brandName,
    required this.name,
    this.barcode,
    this.rawIngredientsText,
  });

  final String id;
  final String brandName;
  final String name;
  final String? barcode;
  final String? rawIngredientsText;
}
