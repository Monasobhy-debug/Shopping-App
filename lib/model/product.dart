class Product {
  String title;
  var price;
  // String description;
  String image;
  bool isCart;
  bool isFav;

  Product({
    required this.title,
    // required this.description,
    required this.image,
    required this.price,
    this.isCart = false,
    this.isFav = false,
  });
  factory Product.fromJson(Map<String, dynamic> jsonData) {
    return Product(
        title: jsonData["title"],
        // description: jsonData["description"],
        image: jsonData["image"],
        price: jsonData['price']);
  }
  void toBeFav() {
    this.isFav = !this.isFav;
    // print('fav = $isFav');
  }

  void toBeCart() {
    this.isCart = !this.isCart;
    // print('card = $isCart');
  }
}
