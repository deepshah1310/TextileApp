import 'package:flutter_course/app/signin/raised_button/CustomRaisedButton.dart';
import 'package:flutter/material.dart';
class SignInButton extends CustomRaisedButton{
  SignInButton({
    String text,
    Color color,
    Color textcolor,
    VoidCallback onpressed,
  }):super(

    child: Text(text,style: TextStyle(color: textcolor,fontSize: 15,),),
    color: color,
    onPressed: onpressed,

  );
}