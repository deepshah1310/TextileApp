import 'package:flutter/cupertino.dart';
import 'package:flutter_course/app/home/Models/shop.dart';
import 'package:flutter_course/app/home/product/list_item_builder.dart';
import 'package:flutter_course/app/localShop/shopListTile.dart';
import 'package:flutter_course/app/localShop/shopScreen.dart';
import 'package:flutter_course/app/services/database.dart';
import 'package:provider/provider.dart';

class SpareParts extends StatefulWidget {
  SpareParts(BuildContext context);
  @override
  _SparePartsState createState() => _SparePartsState();
}

class _SparePartsState extends State<SpareParts> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    return StreamBuilder<List<Shop>>(
        stream: database.shopSparepartsStream(),
        builder: (context,snapshot){
          return ListItemsBuilder<Shop>(
            snapshot: snapshot,
            itemBuilder: (context, shop) => ShopListTile(
              shop: shop,
              onTap: () => ShopScreen(shop: shop,),
            ),
            /*    itemBuilder: (context, product) => ItemCard(
            product: product,
            press: () {},
              ),*/
          );
        });
  }
}
