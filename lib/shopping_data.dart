import 'package:flutter/cupertino.dart';
import 'package:shopping_app/screens/card_page.dart';
import 'package:shopping_app/screens/favorite_page.dart';
import 'package:shopping_app/screens/home-page.dart';

class ShoppingData extends ChangeNotifier {
  int _currantTap = 0;
  List<Widget> screens = [HomePage(), FavoritePage(), CardPage()];
  set currantTap(int tap) {
    this._currantTap = tap;
    notifyListeners();
  }

  int get currantTap => this._currantTap;
  Widget get currantScreen => this.screens[this._currantTap];
}
