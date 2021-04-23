import 'package:flutter/cupertino.dart';

class Shop{
  final String title, address,email,description;

  final int contact_no;
  final bool spareparts,threads;
// final List<String> photos;

  Shop(
      {
        @required this.email,
        @required this.address,
        @required this.spareparts,
        @required this.contact_no,
        @required this.description,
        @required this.threads,
        @required this.title});
  factory Shop.fromMap(Map<String,dynamic>data){
    if(data == null){
      return null;
    }
    final String title =data['title'];
    final String email=data['email'];
    final String address =data['address'];
    final int contact_no =data['contact_no'];
    final bool spareparts = data['spareparts'];
    final bool threads = data['threads'];
    final String description= data['description'];
    // final String id = data['id'];

    return Shop(title: title, email: email, address: address , contact_no: contact_no ,description: description ,spareparts: spareparts,threads: threads);
  }
  Map<String , dynamic> toMap(){
    return{
      'title' : title,
      'email' : email,
      'contact_no' :contact_no,
      // 'no_employee' : no_employee,
      'address' : address,
      //'salary' : salary,
      'description' : description,
      'spareparts' : spareparts,
      'threads' : threads
      //'id' : uid,
    };
  }
}
