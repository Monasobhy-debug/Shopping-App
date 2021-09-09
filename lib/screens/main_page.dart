import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/model/search.dart';
import 'package:shopping_app/screens/favorite_page.dart';
import 'package:shopping_app/screens/sign_in_page.dart';
import 'package:shopping_app/screens/sign_up_page.dart';
import 'package:shopping_app/model/shopping_data.dart';

import 'cart_page.dart';
import 'home-page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    var result = Provider.of<ShoppingData>(context);
    if (result.data.isEmpty) {
      result.setData();
      // print('ok data');
    }
    return Consumer<ShoppingData>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.purple),
          backgroundColor: Colors.white,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Shopping App',
              style: TextStyle(color: Colors.purple),
            ),
            IconButton(
              onPressed: () {
                showSearch(
                    context: (context), delegate: Search(list: model.data));
              },
              icon: Icon(
                Icons.search,
                color: Colors.purple,
              ),
            ),
          ]),
        ),
        body: model.currantScreen,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: model.currantTap,
          onTap: (newIndex) {
            model.currantTap = newIndex;
          },
          fixedColor: Colors.purple,
          showSelectedLabels: true,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'Home',
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.purple,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border,
                ),
                label: 'Favorite',
                activeIcon: Icon(
                  Icons.favorite,
                  color: Colors.purple,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                ),
                label: 'Cart',
                activeIcon: Icon(
                  Icons.shopping_bag,
                  color: Colors.purple,
                )),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.purple),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50.0,
                    child: Icon(
                      Icons.person_outline,
                      color: Colors.purple,
                    ),
                  ),
                  accountName: Text(name.text.toString()),
                  accountEmail: Text(email.text.toString())),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.purple,
                ),
                title: Text("Home"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.favorite_border,
                  color: Colors.purple,
                ),
                title: Text("Favorite"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FavoritePage()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.purple,
                ),
                title: Text("Cart"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.purple,
                ),
                title: Text("Settings"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.purple,
                ),
                title: Text("Log Out"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInPage()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
