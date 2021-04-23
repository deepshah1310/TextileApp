import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color darkBg = Color(0xff000030),
    lighterBg = Color(0xff05053b),
    accent = Color(0xffff785a),
    beige = Color(0xffe0dac8);
List<Color> productColors = [
  Color(0xffd9e3e4),
  Color(0xffe0dac8),
  Color(0xffffffff),
];

List<Map<String, dynamic>> productSpecifications = [
  {
    "type": "Orange",
    "value": "Color",
  },
  {
    "type": "Polyester",
    "value": "Type",
  },
  {
    "type": "10 m",
    "value": "Length",
  },
  {
    "type": "Reel",
    "value": "Packaging Type",
  },
];
List<String> categories = ["Threads","Spare Parts"];
List<Map<String, dynamic>> products = [
  {
    "productName": "Aelias Polyester Dyed Thread",
    "price": "\Rs. 160/kg",
    "pictureLink":
    "https://5.imimg.com/data5/FO/VN/KR/SELLER-16649165/plain-dyed-polyester-threads-500x500.jpg",
  },
  {
    "productName": "Cotton Threads",
    "price": "\Rs. 120/packet",
    "pictureLink":
    "https://5.imimg.com/data5/SELLER/Default/2020/11/IE/JN/BY/97297296/4ply-cotton-thread-500x500.jpg",
  },
  {
    "productName": "Polyester Thread,",
    "price": "\Rs. 19/piece",
    "pictureLink":
    "https://5.imimg.com/data5/LI/RW/KI/SELLER-96766719/4x2a9005-500x500.jpg",
  },
];