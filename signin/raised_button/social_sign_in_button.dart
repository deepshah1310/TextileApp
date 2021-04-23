import 'package:flutter_course/app/signin/raised_button/CustomRaisedButton.dart';
import 'package:flutter/material.dart';
class SocialSignInButton extends CustomRaisedButton{
  SocialSignInButton({
    String text,
    Color color,
    String assetName,
    Color textcolor,
    VoidCallback onpressed,
  }):super(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(assetName),
        Text(text,style: TextStyle(color: textcolor,fontSize: 15,),),
        Opacity(
            opacity: 0    ,
            child: Image.asset(assetName)),
      ],
    ),
    color: color,
    onPressed: onpressed,

  );
}