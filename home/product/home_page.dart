import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_course/app/dashboard/constants.dart';
import 'package:flutter_course/app/home/Models/product.dart';
import 'package:flutter_course/app/home/product/add_product.dart';
import 'package:flutter_course/app/home/product/product_list_tile.dart';
import 'package:flutter_course/app/machinery/item_card.dart';
import 'package:flutter_course/app/myadd/my_product.dart';
import 'package:flutter_course/app/product_details/detail.dart';
import 'package:flutter_course/app/product_details/detail_screen.dart';
import 'package:flutter_course/app/product_details/favorite.dart';
import 'package:flutter_course/app/product_details/screen.dart';
import 'package:flutter_course/app/services/auth.dart';
import 'package:flutter_course/app/services/database.dart';
import 'package:flutter_course/app/services/platform_exception_alert_dialog.dart';
import 'package:provider/provider.dart';

import 'list_item_builder.dart';

class HomePage extends StatefulWidget {
  HomePage({@required this.auth});
  final AuthBase auth;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentindex = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  //Widget currentScreen = DetailScreen();
  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      _buildContents(context),
      MyProduct(context),
    ];

    final database = Provider.of<Database>(context);
    database.productStream();
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        title: Text('Machinery'),
        actions: [
          FlatButton(
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (_) {
              return Provider<Database>(
                create: (_) => FirestoreDatabase(uid: user.uid),
                child: Favorite(),
              );
            })),
            // child: Text(
            //   'Favorite',
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 17,
            //   ),
            // )
            child: Icon(
              Icons.favorite,
              size: 35,
              color: Colors.white70,
            ),
          )
        ],
      ),
      body: screens[_currentindex],
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => AddProduct.show(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: color1,
        currentIndex: _currentindex,
        //backgroundColor: Colors.cyanAccent,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), title: Text('MyAdd'))
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
    return StreamBuilder<List<Product>>(
        stream: database.productStream(),
        builder: (context, snapshot) {
          return ListItemsBuilder<Product>(
            snapshot: snapshot,
            itemBuilder: (context, product) => ProductListTile(
              product: product,
              onTap: () => Screen(product: product),
            ),
            /*    itemBuilder: (context, product) => ItemCard(
            product: product,
            press: () {},
              ),*/
          );
        });
  }
}
