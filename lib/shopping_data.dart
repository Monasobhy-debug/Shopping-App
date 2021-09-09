import 'package:flutter/cupertino.dart';
import 'package:shopping_app/model/network_helper.dart';
import 'package:shopping_app/screens/card_page.dart';
import 'package:shopping_app/screens/favorite_page.dart';
import 'package:shopping_app/screens/home-page.dart';

import 'model/product.dart';

class ShoppingData extends ChangeNotifier {
  List<Product> favorite = [];
  List<Product> cart = [];
  List<Product> data = [];
  int _currantTap = 0;

  List<Widget> screens = [HomePage(), FavoritePage(), CardPage()];
  set currantTap(int tap) {
    this._currantTap = tap;
    notifyListeners();
  }

  int get currantTap => this._currantTap;
  Widget get currantScreen => this.screens[this._currantTap];
  Future getData() async {
    this.data = await NetworkHelper().fetchData();
    print('ok data');

    notifyListeners();
  }

  void addFavorite(Product product) {
    // final product = Product(title: title, image: image, price: price);
    favorite.add(product);
    print('addfav');
    print(favorite);
    notifyListeners();
  }

  void setFavorite(List<Product> favorite) {
    favorite = this.favorite;

    notifyListeners();
  }

  void addCart(Product product) {
    // final product = Product(title: title, image: image, price: price);
    cart.add(product);
    print('addcart');
    print(cart);

    notifyListeners();
  }

  void setCart(List<Product> cart) {
    cart = this.cart;
    notifyListeners();
  }

  void updateFav(Product product) {
    product.toBeFav();
    notifyListeners();
  }

  void updateCart(Product product) {
    product.toBeCart();
    print("UpdateCart");
    notifyListeners();
  }
}
