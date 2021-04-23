
import 'package:flutter/material.dart';
import 'package:flutter_course/app/home/Models/product.dart';
import 'file:///D:/flutter/flutter_course/lib/app/dashboard/constants.dart';
import 'package:flutter_course/app/product_details/detail.dart';
import 'package:flutter_course/app/services/auth.dart';
import 'package:flutter_svg/svg.dart';
class Screen extends StatelessWidget {
  final Product product;
 // final  AuthBase auth;

  const Screen({Key key, this.product }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor:ksecond,
      appBar: buildAppBar(context),
      body: Details(product: product ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor:kprimary,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/search.svg"),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset("assets/cart.svg"),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
