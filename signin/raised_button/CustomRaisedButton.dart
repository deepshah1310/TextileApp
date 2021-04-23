import 'package:flutter/material.dart';
class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton({this.child,this.color,this.borderRadius:5,this.onPressed});
  final Widget child;
  final Color color;
  final double borderRadius;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
      ),
      child: child,
      color: color,
      onPressed: onPressed,
    );
  }
}
