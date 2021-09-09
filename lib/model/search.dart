import 'package:flutter/material.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/widget/cloth_item.dart';

class Search extends SearchDelegate {
  List<Product> list = [];
  Search({required this.list});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(
            Icons.clear,
            color: Colors.purple,
          ))
    ];
    // throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.purple,
        ));
    // throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
        child: Text(
      'Results',
      style: TextStyle(
          color: Colors.purple, fontSize: 30.0, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    ));
    // throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var searchList = query.isEmpty
        ? list
        : list.where((p) => p.title.toLowerCase().startsWith(query)).toList();
    return GridView.builder(
      padding: EdgeInsets.all(12.0),
      itemCount: searchList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 200.0,
        childAspectRatio: 1.0,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ClothItem(
          product: searchList[index],
          title: searchList[index].title,
          image: searchList[index].image,
          price: searchList[index].price,
          isFav: searchList[index].isFav,
          isCart: searchList[index].isCart,
        );
      },
    );
    // throw UnimplementedError();
  }
}
