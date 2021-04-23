import 'package:flutter/cupertino.dart';

class Fav {
  List name = [];
  Fav({@required this.name});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

}