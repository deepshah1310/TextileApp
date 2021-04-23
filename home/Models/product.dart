import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_course/app/services/auth.dart';
final user = FirebaseAuth.instance.currentUser;
final String uid = user.uid;
class Product{

  
  Product({ @required this.documentId ,@required this.name , @required this.contact, @required this.price,@required this.specification , @required this.address ,@required this.imgUrl ,@required  this.id});
  final String documentId;
  final String name;
  final String specification;
  final String address;
  final int contact;
  final int price;
  final String imgUrl;
  final String id;

  factory Product.fromMap(Map<String,dynamic>data ,String documentId){
    if(data == null){
      return null;
    }
      final String name =data['name'];
    final String specification  =data['specification'];
    final String address =data['address'];
      final int contact =data['contact'];
      final int price = data['price'];
      final String imgUrl = data['imgUrl'];
      final String id = data['id'];

    return Product(documentId : documentId,name: name, contact: contact, price: price , specification: specification ,address: address , imgUrl:imgUrl ,id : id);
  }
  Map<String , dynamic> toMap(){
    return{
      'name' : name,
      'contact' : contact,
      'price' :price,
      'specification' : specification,
      'address' : address,
      'imgUrl' : imgUrl,
      'id' : uid,
    };
  }
}