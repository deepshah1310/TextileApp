//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/app/home/Models/fav.dart';
import 'package:flutter_course/app/home/Models/product.dart';
import 'dart:io';
import 'file:///D:/flutter/flutter_course/lib/app/dashboard/constants.dart';
import 'package:flutter_course/app/product_details/add_to_cart.dart';
import 'package:flutter_course/app/product_details/address.dart';
import 'package:flutter_course/app/product_details/contact.dart';
import 'package:flutter_course/app/product_details/counter_with_fav_btn.dart';
import 'package:flutter_course/app/product_details/description.dart';
//import 'package:flutter_course/app/product_details/favorite.dart';
import 'package:flutter_course/app/product_details/product_title_with_image.dart';
import 'package:flutter_course/app/services/APIPath.dart';
import 'package:flutter_course/app/services/database.dart';
import 'package:flutter_course/app/services/firestore_service.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatefulWidget {
  final Product product;
  final bool a;
  static String uid = FirebaseAuth.instance.currentUser.uid;

  //final Database database;
  const Details({Key key, this.product ,this.a }) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool _isFavorited=false;
  // addBoolToSF() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool('_isFavorited', true);
  // }
  //
  //
  // @override
  // void initState() {
  //   getBoolValuesSF() async {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     //Return bool
  //     bool _isFavorited = prefs.getBool('_isFavorited');
  //     return _isFavorited;
  //   }



  final _service = FirestoreService.instance;


  Future<void> addFavorite(List<String> a) async => _service.updateData(

      path: APIPath.addToFavorite(uid),
      //data: {'name' :widget.product.name,}
      data: a,
  );
  Future<void> removeFavorite(List<String> value) async => _service.removeData(
      path: APIPath.addToFavorite(uid),
      //data: {'name' :widget.product.name,}
      data: value);
  @override
  Widget build(BuildContext context) {
    //final database = Provider.of<Database>(context);
    Size size = MediaQuery.of(context).size;
    //print("brijesh");
    return Container(
      // color: Colors.teal[50],
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Stack(
            children: [
              Image(
                image: NetworkImage(widget.product.imgUrl),
                height: 220,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),

              /* Padding(
                padding: const EdgeInsets.fromLTRB(20,25,0,0),
                child: IconButton(
                  icon: SvgPicture.asset(
                    'assets/back.svg',
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),*/
            ],
          ),
          Container(
            padding: EdgeInsets.only(
              top: size.height * 0.00,
              left: kDefaultPaddin,
              right: kDefaultPaddin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${widget.product.name}',
                      style: TextStyle(
                          color: Colors.teal[800],
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    if (_isFavorited)
                      IconButton(
                          icon: Icon(
                            Icons.favorite,
                            size: 35,
                            color: Colors.redAccent,
                          ),
                          onPressed: _fav)
                    else
                      IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            size: 35,
                            color: Colors.redAccent,
                          ),
                          onPressed: _fav)

                    /*Container(
                      padding: EdgeInsets.all(8),
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF6464),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/heart.svg"),
                    )*/
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                    text: TextSpan(
                        text: 'Price :',
                        style: TextStyle(color: Colors.teal[300]))),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Rs.${widget.product.price}',
                  style: TextStyle(
                      color: ksecond,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                    text: TextSpan(
                        text: 'Specification :',
                        style: TextStyle(color: Colors.teal[300]))),
                SizedBox(
                  height: 2,
                ),
                Text(
                  '${widget.product.specification}',
                  style: TextStyle(
                      color: ksecond,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                    text: TextSpan(
                        text: 'Contact No :',
                        style: TextStyle(color: Colors.teal[300]))),
                SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Text(
                      '${widget.product.contact}',
                      style: TextStyle(
                          color: ksecond,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    // new FlatButton(
                    //     onPressed: () => launch("tel:${widget.product.contact}"),
                    //     child: new Icon(Icons.phone,color: Colors.green,size: 30,),
                    // )
                    new IconButton(icon: Icon(Icons.phone,color: Colors.green,size: 30,), onPressed: () => launch("tel:${widget.product.contact}"),)
                  ],
                ),

                SizedBox(
                  height: 20,
                ),
                RichText(
                    text: TextSpan(
                        text: 'Address:',
                        style: TextStyle(color: Colors.teal[300]))),
                SizedBox(
                  height: 2,
                ),
                Text(
                  '${widget.product.address}',
                  style: TextStyle(
                      color: ksecond,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _fav() {
    setState(() {


      if (_isFavorited) {
        //_favoriteCount -= 1;
        _isFavorited = false;
        print(" not favorite");
        List<String> list = [];
        list.add(widget.product.name);
        print(list);
        removeFavorite(list);
      } else {
        //_favoriteCount += 1;
        _isFavorited = true;
        print(" favorite");
        List<String> a = [];
        a.add(widget.product.name);
        //final fav = Fav(name:a);
        //String a = widget.product.name;
        print(a);
        addFavorite(a);
      }
    });
  }
}
