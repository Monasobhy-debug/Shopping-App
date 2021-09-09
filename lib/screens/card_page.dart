import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/shopping_data.dart';
import 'package:shopping_app/widget/cloth_item.dart';

class CardPage extends StatelessWidget {
  List<Product> cart = [];

  @override
  Widget build(BuildContext context) {
    print(cart);
    return Consumer<ShoppingData>(builder: (context, data, child) {
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
                      Provider.of<ShoppingData>(context).setCart(cart);
                      print('ok cart');
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
