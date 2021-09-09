import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/screens/favorite_page.dart';
import 'package:shopping_app/screens/sign_in_page.dart';
import 'package:shopping_app/screens/sign_up_page.dart';
import 'package:shopping_app/shopping_data.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingData>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.purple),
          backgroundColor: Colors.white,
          title: Container(
            width: 250.0,
            height: 40.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(color: Colors.purple, width: 1)),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(
                      height: 8.0,
                      color: Colors.purple,
                    ),
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.search,
                      color: Colors.purple,
                    ),
                  ),
                  onChanged: (text) async {
                    text = text.toLowerCase();
                  },
                )
                // TextFormField(
                //     decoration: InputDecoration(
                //       hintText:  'Search...',
                //   labelStyle: TextStyle(
                //     color: Colors.purple,
                //   ),
                //   border: InputBorder.none,
                //   // labelText: 'Search',
                //   icon: Icon(
                //     Icons.search,
                //     color: Colors.purple,
                //   ),
                // )),
                ),
          ),
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
                // backgroundColor: Colors.purple,
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
                  accountName: Text(name.text.toString()),
                  accountEmail: Text(email.text.toString())),
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
