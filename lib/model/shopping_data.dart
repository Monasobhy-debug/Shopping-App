import 'package:flutter/cupertino.dart';
import 'package:shopping_app/model/network_helper.dart';
import 'package:shopping_app/screens/cart_page.dart';
import 'package:shopping_app/screens/favorite_page.dart';
import 'package:shopping_app/screens/home-page.dart';
import 'package:shopping_app/model/product.dart';
import 'product.dart';

class ShoppingData extends ChangeNotifier {
  List<Product> favorite = [];
  List<Product> cart = [];
  List<Product> data = [];

  int _currantTap = 0;

  List<Widget> screens = [HomePage(), FavoritePage(), CartPage()];
  set currantTap(int tap) {
    this._currantTap = tap;
    notifyListeners();
  }

  int get currantTap => this._currantTap;
  Widget get currantScreen => this.screens[this._currantTap];
  void setData() async {
    data = await NetworkHelper().fetchData();

    // print('add data');
    // print(data);
    notifyListeners();
  }

  void addFavorite(Product product) {
    favorite.add(product);
    // print('add fav');
    // print(favorite);
    notifyListeners();
  }

  void removeFavorite(Product product) {
    favorite.remove(product);
    // print('remove fav');
    // print(favorite);
    notifyListeners();
  }

  void setFavorite(List<Product> favorite) {
    favorite = this.favorite;

    notifyListeners();
  }

  void addCart(Product product) {
    cart.add(product);
    // print('add cart');
    // print(cart);

    notifyListeners();
  }

  void removeCart(Product product) {
    cart.remove(product);
    // print('remove cart');
    // print(cart);

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
    // print("cart u ");
    // print(product.isCart);
    // print("UpdateCart");
    notifyListeners();
  }
}
