import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/model/shopping_data.dart';

class ClothItem extends StatefulWidget {
  final Product product;
  final String image;
  final String title;
  final price;
  final bool isCart;
  final bool isFav;

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
    return Consumer<ShoppingData>(builder: (context, data, child) {
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
                  offset: Offset(5, 5),
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
                      data.updateCart(widget.product);

                      if (!widget.isCart) {
                        data.addCart(widget.product);
                      } else {
                        data.removeCart(widget.product);
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
                  Text('\$ ${widget.price}',
                      style: TextStyle(fontSize: 12.0, color: Colors.purple)),
                  IconButton(
                    iconSize: 20.0,
                    onPressed: () {
                      data.updateFav(widget.product);

                      if (!widget.isFav) {
                        // print(widget.isFav);
                        data.addFavorite(widget.product);
                      } else {
                        data.removeFavorite(widget.product);
                      }
                    },
                    icon: (widget.isFav)
                        ? Icon(
                            Icons.favorite,
                            color: Colors.purple,
                          )
                        : Icon(
                            Icons.favorite,
                            color: Colors.grey,
                          ),
                  ),
                ],
              )
            ],
          ),
        ],
      );
    });
  }
}
