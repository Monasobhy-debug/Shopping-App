import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/widget/cloth_item.dart';

import '../shopping_data.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<Product> favorite = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<ShoppingData>(
      builder: (context, data, child) {
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
                        print('ok <3');
                        Provider.of<ShoppingData>(context, listen: false)
                            .setFavorite(favorite);
                        print('ok fav');
                        print(favorite);

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
