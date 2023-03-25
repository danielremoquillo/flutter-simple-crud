class Product {
  final int id;
  final String title;
  final String description;
  final String image;

  const Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'] as String,
      id: json['id'],
      description: json['description'] as String,
      image: json['image'],
    );
  }
}
