import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/app/home/Models/product.dart';
import 'file:///D:/flutter/flutter_course/lib/app/dashboard/constants.dart';
class ItemCard extends StatelessWidget {
  const ItemCard({
    Key key,
    @required this.product,
    @required this.press,
  }) : super(key: key);
  final Product product;
  final Function press;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
               height: 180,
               width: 160,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "1",
                child: Image.network(product.imgUrl),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              product.name,
              style: TextStyle(color: kTextLightColor, fontSize: 15.0),
            ),
          ),
          Text(
            "\Rs.${product.price}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
          )
        ],
      ),
    );
  }
}
