class Product {
  final String id;
  final List<String> category;

  Product({
    required this.id,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    var obj = json["category"];

    return Product(
      id: json["product_id"],
      category: List<String>.from(obj),
    );
  }
}
