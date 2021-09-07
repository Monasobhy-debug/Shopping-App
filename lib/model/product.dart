class Product {
  String title;
  var price;
  String description;
  String image;
  Product(
      {required this.title,
      required this.description,
      required this.image,
      required this.price});
  factory Product.fromJson(Map<String, dynamic> jsonData) {
    return Product(
        title: jsonData["title"],
        description: jsonData["description"],
        image: jsonData["image"],
        price: jsonData['price']);
  }
}
