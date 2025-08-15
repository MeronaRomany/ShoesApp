class ShoesProduct {
  final String image;
  final String title;
  final String brand;
  final double price;

  ShoesProduct({
    required this.image,
    required this.title,
    required this.price,
    required this.brand,
  });

  factory ShoesProduct.fromJson(Map<String, dynamic> json) {
    return ShoesProduct(
      image: (json['images'] as List).isNotEmpty ? json['images'][0] : '',
      title: json['title'] ?? '',
      brand: json['brand'] ?? '',
      price: (json['price'] as num).toDouble(),
    );
  }
}
