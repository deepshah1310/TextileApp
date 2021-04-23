import 'package:flutter/material.dart';
import 'package:flutter_course/app/home/Models/shop.dart';
import 'package:flutter_course/app/home/product/list_item_builder.dart';
import 'package:flutter_course/app/localShop/addShop.dart';
import 'package:flutter_course/app/localShop/shopListTile.dart';
import 'package:flutter_course/app/localShop/shopScreen.dart';
import 'package:flutter_course/app/localShop/spareParts.dart';
import 'package:flutter_course/app/services/database.dart';
import 'package:provider/provider.dart';

import 'constants.dart';

class Localshop extends StatefulWidget {
  @override
  _LocalshopState createState() => _LocalshopState();
}

class _LocalshopState extends State<Localshop> {
  final PageStorageBucket bucket = PageStorageBucket();
  int _currentindex = 0;
  @override
  Widget build(BuildContext context) {


    final List<Widget> screens = [
      _buildContents(context),
      SpareParts(context),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Local Shops'), actions: [
        FlatButton(
          onPressed: () => AddShopPage.show(context),
          child: Text("Add Shop"),
        )
      ]),
      body: screens[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: color1,
        currentIndex: _currentindex,
        //backgroundColor: Colors.cyanAccent,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit_sharp), title: Text('Thread')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_applications_rounded), title: Text('Spare Part'))
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
    );
  }

  Widget _buildContents(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    return StreamBuilder<List<Shop>>(
        stream: database.shopThreadStream(),
        builder: (context, snapshot) {
          return ListItemsBuilder<Shop>(
            snapshot: snapshot,
            itemBuilder: (context, shop) => ShopListTile(
              shop: shop,
              onTap: () => ShopScreen(shop: shop),
            ),
            /*    itemBuilder: (context, product) => ItemCard(
            product: product,
            press: () {},
              ),*/
          );
        });
  }
}
