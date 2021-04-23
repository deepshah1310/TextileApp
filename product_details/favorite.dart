import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/app/home/Models/product.dart';
import 'package:flutter_course/app/home/product/list_item_builder.dart';
import 'package:flutter_course/app/home/product/product_list_tile.dart';
import 'package:flutter_course/app/product_details/screen.dart';
import 'package:flutter_course/app/services/database.dart';
import 'package:flutter_course/app/services/firestore_service.dart';
import 'package:provider/provider.dart';
class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
 // List<String> pointList = <String>[];
  List<String> l=[];

/*
  getdata() async{
    await FirebaseFirestore.instance.collection("users").doc('$uid').get().then((value){
      setState(() {
        // first add the data to the Offset object
        List<String> n =value.data['name'];
        List.from(n).forEach((element){
          Offset data = new Offset(element,n);

          //then add the data to the List<Offset>, now we have a type Offset
          pointList.add(data);
        });
      });
    });
  }*/



  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context, listen: false);
    return  Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
      ),
      body: Container(
        color: Colors.teal[50],
        child: Center(
          child: new StreamBuilder(
              stream: FirebaseFirestore.instance.collection('users').doc('$uid').snapshots(),
              builder: (context, snapshot) {
                if (!(snapshot.hasData)) {
                  print("${snapshot.hasData}");
                  return new Text("Loading");
                }
                  var userDocument = snapshot.data;
                  l = List.from(userDocument["name"]);
                  print("${l} list");
                  if(l.isNotEmpty){
                  return StreamBuilder<List<Product>>(
                      stream: database.myFav(l),
                      builder: (context, snapshot) {
                        return ListItemsBuilder<Product>(
                          snapshot: snapshot,
                          itemBuilder: (context, product) =>
                              ProductListTile(
                                product: product,
                                onTap: () => Screen(product: product),
                              ),
                          /*    itemBuilder: (context, product) => ItemCard(
            product: product,
            press: () {},
              ),*/
                        );
                      });
                  /*    itemBuilder: (context, product) => ItemCard(
            product: product,
            press: () {},
              ),*/
                  //);;
                  }
                  else{
                    return Scaffold(
                      body: Container(
                        child: Center(child: Text("Nothing to show any favorite item",style: TextStyle(fontSize: 20),)),
                      ),
                    );
                  }
                }

          ),
        ),
      ),
    );
  }
}
