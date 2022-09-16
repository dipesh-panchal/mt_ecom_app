class Product {
  final String title;
  final String description;
  final String featuredImage;
  final int price;
  final int id;
  int inTheCart;

  Product({
    required this.title,
    required this.description,
    required this.featuredImage,
    required this.price,
    required this.id,
    required this.inTheCart,
  });

  factory Product.fromJson(Map<String, dynamic> data) {
    final title = data['title'] as String;
    final description = data['description'] as String;
    final featuredImage = data['featured_image'] as String;
    final price = data['price'] as int;
    final id = data['id'] as int;
    final inTheCart = data['inTheCart'] ?? 0;
    return Product(
      title: title,
      description: description,
      featuredImage: featuredImage,
      price: price,
      id: id,
      inTheCart: inTheCart,
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title ?? '',
        "description": description ?? '',
        "featured_image": featuredImage ?? '',
        "price": price ?? 0,
        "id": id ?? 0,
        "inTheCart": inTheCart ?? 0,
      };
}
