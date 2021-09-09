import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/screens/favorite_page.dart';
import 'package:shopping_app/shopping_data.dart';
import 'package:favorite_button/favorite_button.dart';

class ClothItem extends StatefulWidget {
  final Product product;
  final String image;
  final String title;
  final price;
  bool isCart;
  bool isFav;

  ClothItem({
    required this.product,
    required this.image,
    required this.title,
    required this.price,
    required this.isCart,
    required this.isFav,
  });
  @override
  _ClothItemState createState() => _ClothItemState();
}

class _ClothItemState extends State<ClothItem> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShoppingData>(
      create: (context) => ShoppingData(),
      child: Consumer<ShoppingData>(builder: (context, shoppingData, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 130.0,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey.shade600,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    '${widget.image}',
                  ),
                ),
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2.0,
                    blurRadius: 5.0,
                    offset: Offset(5, 5), // changes position of shadow
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 150.0,
                  child: Text(
                    widget.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        color: Colors.black),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      iconSize: 20.0,
                      onPressed: () {
                        setState(() {
                          Provider.of<ShoppingData>(context, listen: false)
                              .updateCart(widget.product);
                        });

                        if (widget.isCart) {
                          Provider.of<ShoppingData>(context, listen: false)
                              .addCart(widget.product);
                        }
                      },
                      icon: (widget.isCart)
                          ? Icon(
                              Icons.add_shopping_cart,
                              color: Colors.purple,
                            )
                          : Icon(
                              Icons.add_shopping_cart_outlined,
                              color: Colors.grey,
                            ),
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     shoppingData.updateCart(widget.product);
                    //     if (widget.isCart) {
                    //       shoppingData.addCart(widget.product);
                    //     }
                    //   },
                    //   child: (widget.isCart)
                    //       ? Icon(
                    //           Icons.add_shopping_cart,
                    //           color: Colors.purple,
                    //         )
                    //       : Icon(
                    //           Icons.add_shopping_cart_outlined,
                    //           color: Colors.grey,
                    //         ),
                    // ),
                    Text('\$ ${widget.price}',
                        style: TextStyle(fontSize: 12.0, color: Colors.purple)),
                    FavoriteButton(
                      iconSize: 30.0,
                      iconColor: Colors.purple,
                      isFavorite: widget.isFav,
                      iconDisabledColor: Colors.grey,
                      valueChanged: (_isFavorite) {
                        shoppingData.updateFav(widget.product);
                        Provider.of<ShoppingData>(context, listen: false)
                            .addFavorite(widget.product);
                        print('Is Favorite : $_isFavorite');
                      },
                    ),

                    // GestureDetector(
                    //   onTap: () {
                    //     if (widget.isFav) {
                    //       Provider.of<ShoppingData>(context, listen: false)
                    //           .addFavorite(
                    //               widget.title, widget.image, widget.price);
                    //     }
                    //   },
                    //   child: (widget.isFav)
                    //       ? Icon(
                    //           Icons.favorite,
                    //           color: Colors.purple,
                    //         )
                    //       : Icon(
                    //           Icons.favorite_border,
                    //           color: Colors.purple,
                    //         ),
                    // ),
                  ],
                )
              ],
            ),
          ],
        );
      }),
    );
  }
}
