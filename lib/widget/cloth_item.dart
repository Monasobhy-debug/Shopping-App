import 'package:flutter/material.dart';

class ClothItem extends StatefulWidget {
  final String image;
  final String title;
  final price;

  ClothItem({required this.image, required this.title, required this.price});
  @override
  _ClothItemState createState() => _ClothItemState();
}

class _ClothItemState extends State<ClothItem> {
  bool fav = false;
  bool card = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 150.0,
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      card = !card;
                    });
                  },
                  child: (card)
                      ? Icon(
                          Icons.credit_card,
                          color: Colors.grey,
                        )
                      : Icon(
                          Icons.favorite_border,
                          color: Colors.purple,
                        ),
                ),
                Text('\$ ${widget.price}',
                    style: TextStyle(fontSize: 12.0, color: Colors.purple)),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      fav = !fav;
                    });
                  },
                  child: (fav)
                      ? Icon(
                          Icons.favorite,
                          color: Colors.purple,
                        )
                      : Icon(
                          Icons.favorite_border,
                          color: Colors.purple,
                        ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
//
// class ClothItem extends StatelessWidget {
//   final String image;
//   final String title;
//   final double price;
//
//   ClothItem({required this.image, required this.title, required this.price});
//   bool fav = false;
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             height: 130.0,
//             padding: EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.grey.shade600,
//               image: DecorationImage(
//                 fit: BoxFit.fill,
//                 image: NetworkImage(
//                   '$image',
//                 ),
//               ),
//               borderRadius: BorderRadius.circular(15.0),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 2.0,
//                   blurRadius: 5.0,
//                   offset: Offset(5, 5), // changes position of shadow
//                 ),
//               ],
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: 100.0,
//                     child: Text(
//                       title,
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15.0,
//                           color: Colors.black),
//                     ),
//                   ),
//                   Text('\$ $price',
//                       style: TextStyle(fontSize: 12.0, color: Colors.purple))
//                 ],
//               ),
//               GestureDetector(
//                 onTap: () {
//                   SetState{
//                     fav = !fav;
//                   }
//                 },
//                 child: (fav)
//                     ? Icon(
//                         Icons.favorite_border,
//                         color: Colors.purple,
//                       )
//                     : Icon(
//                         Icons.favorite_border,
//                         color: Colors.purple,
//                       ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
