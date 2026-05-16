class Ingredient {
  const Ingredient({
    required this.id,
    required this.inciName,
    required this.functions,
    this.commonName,
    this.description,
  });

  final String id;
  final String inciName;
  final List<String> functions;
  final String? commonName;
  final String? description;
}
