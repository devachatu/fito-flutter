import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  String label;
  TextEditingController controller;
  double width;
  CustomTextField(
      {required this.label, required this.controller, this.width = 0, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
      width: width,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.white)),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: InputBorder.none,
            floatingLabelStyle: TextStyle(color: Colors.blue),
            labelText: label,
            labelStyle: TextStyle(color: Colors.black, fontSize: 14)),
        controller: controller,
      ),
    );
  }
}
