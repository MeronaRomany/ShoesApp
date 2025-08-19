class ShoesProduct {
  final String image;
  final String title;
  final String description;
  final double price;

  ShoesProduct({
    required this.image,
    required this.title,
    required this.price,
    required this.description,
  });

  factory ShoesProduct.fromJson(Map<String, dynamic> json) {
    return ShoesProduct(
      image: (json['image'])??'',
      title: json['name'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] as num).toDouble(),
    );
  }
  String get shortDescription {
    List<String> words=description.split(" ");
    if(words.length <= 5){
      return description ;
    }else{
      return words.take(5).join(" ");
    }

  }
}
