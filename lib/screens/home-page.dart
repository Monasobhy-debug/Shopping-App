import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/model/network_helper.dart';
import 'package:shopping_app/screens/main_page.dart';
import 'package:shopping_app/widget/cloth_item.dart';

import '../model/shopping_data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<ShoppingData>(context).data;
    // print(products);
    // print("ok products");
    return Consumer<ShoppingData>(builder: (context, data, child) {
      return Scaffold(
        body: (products.isNotEmpty)
            ? Container(
                padding: EdgeInsets.all(12.0),
                child: GridView.builder(
                  padding: EdgeInsets.all(12.0),
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 200.0,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    // print(products);
                    // print('ok cloth');
                    return ClothItem(
                      product: products[index],
                      title: products[index].title,
                      image: products[index].image,
                      price: products[index].price,
                      isFav: products[index].isFav,
                      isCart: products[index].isCart,
                    );
                  },
                ))
            : Center(
                child: CircularProgressIndicator(),
              ),
      );
    });
  }
}
