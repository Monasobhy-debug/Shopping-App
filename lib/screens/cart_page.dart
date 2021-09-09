import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/model/shopping_data.dart';
import 'package:shopping_app/widget/cloth_item.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingData>(builder: (context, data, child) {
      List<Product> cart = data.cart;
      // print(cart);
      // print('ok cart');

      return Scaffold(
          body:
              // (cart.isNotEmpty)
              //     ?
              Container(
                  padding: EdgeInsets.all(12.0),
                  child: GridView.builder(
                    padding: EdgeInsets.all(12.0),
                    itemCount: cart.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 200.0,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return ClothItem(
                        product: cart[index],
                        image: cart[index].image,
                        title: cart[index].title,
                        price: cart[index].price,
                        isCart: cart[index].isCart,
                        isFav: cart[index].isFav,
                      );
                    },
                  ))
          // : Center(
          //     child: CircularProgressIndicator(),
          //   ),
          );
    });
  }
}
