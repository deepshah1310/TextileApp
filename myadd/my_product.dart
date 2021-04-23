import 'package:flutter/material.dart';
import 'package:flutter_course/app/home/Models/product.dart';
import 'package:flutter_course/app/home/product/list_item_builder.dart';
import 'package:flutter_course/app/home/product/product_list_tile.dart';
import 'package:flutter_course/app/product_details/screen.dart';
import 'package:flutter_course/app/services/database.dart';
import 'package:provider/provider.dart';

import 'my_product_list_tile.dart';
class MyProduct extends StatefulWidget {
  MyProduct(BuildContext context);


  @override
  _MyProductState createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    return StreamBuilder<List<Product>>(
        stream: database.myProduct(),
        builder: (context,snapshot){
          return ListItemsBuilder<Product>(
            snapshot: snapshot,
            itemBuilder: (context, product) => MyProductListTile(
              product: product,
              onTap: () => Screen(product: product,),
            ),
            /*    itemBuilder: (context, product) => ItemCard(
            product: product,
            press: () {},
              ),*/
          );
        });
  }
}
