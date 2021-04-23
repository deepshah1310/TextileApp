import 'package:flutter/material.dart';
import 'package:flutter_course/app/dashboard/constants.dart';
import 'package:flutter_course/app/home/Models/job.dart';
import 'package:flutter_course/app/home/Models/shop.dart';

import 'shopScreen.dart';

class ShopListTile extends StatelessWidget {
  const ShopListTile ({Key key, @required this.shop, this.onTap })
      : super(key: key);
  final Shop shop;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (_) => ShopScreen(shop: shop))),

      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.teal[100],
          borderRadius: BorderRadius.circular(9.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[300], blurRadius: 5.0, offset: Offset(0, 3))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(15.0),
                //   child: Image.asset(
                //     'assets/images/logo.jpg',
                //     height: 71,
                //     width: 71,
                //   ),
                // ),
                // SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "${shop.title}",
                        style: TextStyle(
                            color: Colors.teal[900],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      // Text(
                      //   "${job.address}",
                      //   style: Theme.of(context).textTheme.subtitle.apply(
                      //     color: Colors.grey,
                      //   ),
                      // )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 10),

            Text(
              "Contact number : ${shop.contact_no}",
              style:
              Theme.of(context).textTheme.subhead.apply(fontWeightDelta: 2,color: ksecond),
            )
          ],
        ),
      ),
    );
  }
}
