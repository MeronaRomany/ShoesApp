class Brands{
  String? image;
  String? title;
  Brands({required this.title, required this.image});
}

class BrandeShoes{
  List<Brands> optionsBrandeShoes=
  [
    Brands(title: "Nike", image: "assets/images/web-183282388.webp"),
    Brands(title: "Adidas", image: "assets/images/adidas-white-logo-hd-png-701751694777208ogwssxbgpj.png"),
    Brands(title: "Puma", image: "assets/images/puma-logo-cover.png"),
    Brands(title: "Reebok", image: "assets/images/reebok-logo-design-history-and-evolution-kreafolk_7b82f855-910c-4e4f-9353-a244667028de.webp"),
    Brands(title: "New Balance", image: "assets/images/761f66c4c9922aac002e575aefd77330.jpg"),
    Brands(title: "Vans", image: "assets/images/images.png"),
  ];
}