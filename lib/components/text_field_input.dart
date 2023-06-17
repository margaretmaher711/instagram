import 'package:flutter/material.dart';
import 'package:instagram/utils/colors.dart';

class TextFieldInput extends StatelessWidget {
  TextEditingController controller;
  String hintTxt;
  // TextInputType txtInputType;
  bool obsecure;

  TextFieldInput(
      {super.key,
      required this.controller,
      required this.hintTxt,
      // required this.txtInputType,
        required this.obsecure});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,obscureText: obsecure,
        // keyboardType: txtInputType,
        decoration: InputDecoration(
            // labelText: labelTxt,
            labelStyle: const TextStyle(
                color: Color(0xffECA400),
                fontSize: 16,
                fontWeight: FontWeight.w400),
            hintText: hintTxt,
            hintStyle: const TextStyle(
                color: primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w400),
            enabledBorder: myInputBorder(context),
            focusedBorder: myInputBorder(context),
            // fillColor: mobileSearchColor,
            filled: true));
  }

  OutlineInputBorder myInputBorder(context) {
    //return type is OutlineInputBorder
    return OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );
  }
}
