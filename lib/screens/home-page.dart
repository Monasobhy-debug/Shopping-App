import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/model/product.dart';
import 'package:shopping_app/model/network_helper.dart';
import 'package:shopping_app/widget/cloth_item.dart';

// class HomePage extends StatelessWidget {
// List<Product> products = [];
// Future getData() async {
//   NetworkHelper networkHelper = NetworkHelper();
//   products = await networkHelper.fetchData();
//   print('ok 2');
// }
//
// @override
// Widget build(BuildContext context) {
//   return FutureBuilder(
//     future: getData(),
//     builder: (context, snapShot) => Scaffold(
//       body: Container(
//           padding: EdgeInsets.all(12.0),
//           child: GridView.builder(
//             padding: EdgeInsets.all(12.0),
//             itemCount: 200,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               mainAxisExtent: 200,
//               childAspectRatio: 3 / 4,
//               crossAxisSpacing: 20.0,
//             ),
//             itemBuilder: (BuildContext context, int index) {
//               print('ok 3');
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Image.network(
//                     products[index].image,
//                     fit: BoxFit.fill,
//                   ),
//                   Row(
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             products[index].title,
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20.0,
//                                 color: Colors.black),
//                           ),
//                           Text(products[index].price.toString(),
//                               style: TextStyle(
//                                   fontSize: 15.0, color: Colors.grey))
//                         ],
//                       ),
//                       CircleAvatar(
//                         child: Icon(Icons.favorite_border),
//                         maxRadius: 10.0,
//                         backgroundColor: Colors.purple,
//                       )
//                     ],
//                   )
//                 ],
//               );
//             },
//           )),
//     ),
//   );
// }
// }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late final Product product;
  List<Product> products = [];
  Future getData() async {
    products = await NetworkHelper().fetchData();
    print('ok 3');
    print(products);
  }

  @override
  void initState() {
    getData();

    print('ok 4');
    print(products);
  }

  @override
  Widget build(BuildContext context) {
    getData();
    print('ok 5');

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
                  print('ok 6');
                  return ClothItem(
                    title: products[index].title,
                    image: products[index].image,
                    price: products[index].price,
                  );
                },
              ))
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
