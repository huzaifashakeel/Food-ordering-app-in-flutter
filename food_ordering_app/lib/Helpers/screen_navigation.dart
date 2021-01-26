import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void ChangeScreen(BuildContext context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void ChangeScreenReplacement(BuildContext context, Widget widget) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widget));
}
