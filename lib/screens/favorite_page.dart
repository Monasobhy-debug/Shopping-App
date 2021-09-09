import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/widget/cloth_item.dart';

import '../model/shopping_data.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingData>(
      builder: (context, data, child) {
        List<Product> favorite = data.favorite;
        // print('ok fav');
        // print(favorite);
        return Scaffold(
            body:
                // (favorite.isNotEmpty)
                //     ?
                Container(
                    padding: EdgeInsets.all(12.0),
                    child: GridView.builder(
                      padding: EdgeInsets.all(12.0),
                      itemCount: favorite.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 200.0,
                        childAspectRatio: 1.0,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return ClothItem(
                          product: favorite[index],
                          image: favorite[index].image,
                          title: favorite[index].title,
                          price: favorite[index].price,
                          isFav: favorite[index].isFav,
                          isCart: favorite[index].isCart,
                        );
                      },
                    ))
            //     : Center(
            //   child: CircularProgressIndicator(),
            // ),
            );
      },
    );
  }
}
