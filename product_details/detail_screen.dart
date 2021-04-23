import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/app/home/Models/product.dart';
import 'package:flutter_course/app/home/Models/product.dart';
import 'file:///D:/flutter/flutter_course/lib/app/dashboard/constants.dart';
import 'package:flutter_course/app/product_details/detail.dart';
import 'package:flutter_course/app/services/APIPath.dart';
import 'package:flutter_course/app/services/database.dart';
import 'package:flutter_course/app/services/firestore_service.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'dart:io';
class DetailScreen extends StatefulWidget {
  final Product product;

  var context;



  DetailScreen({Key key, this.product}) : super(key: key);
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  //void initState() {
  //   String uid = FirebaseAuth.instance.currentUser.uid;
  //
  //   checkdata(uid);
  //
  //   // TODO: implement initState
  //   super.initState();
  // }
  // checkdata(uid)async{
  //   final List<String> list =[];
  //   list.add(widget.product.name);
  //     final reference = FirebaseFirestore.instance.collection('users/$uid').where(
  //       'name', whereIn: list).get().then((value) {
  //       value.docs.forEach((result) {
  //         print(result.data());
  //       });
  //     });
    //Stream fav = await FirestoreService.instance.favoriteStream(path: APIPath.addToFavorite(uid),list: list,builder: (data) => Product.fromMap(data));
    // final database = Provider.of<Database>(context ,listen: false);
    // final Stream<List<Product>> fav  = database.myFav(list);
   // final Future<int> l = fav.length;
   // bool a  =await fav.isEmpty;
   // print(reference.data());
   //  print("call "+widget.product.name + a.toString());
   //  if(a){
   //    print("not fav");
   //  }
//  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        title: Text('Detail Page'),
        ),

    body: Details(product :widget.product , a :true),
    );
  }
}
