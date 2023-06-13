import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
          // labelText: labelTxt,
            labelStyle: const TextStyle(
                color: Color(0xffECA400),
                fontSize: 16,
                fontWeight: FontWeight.w400),
            // hintText: hintTxt,
            hintStyle: const TextStyle(
                color: Color(0xff03314B),
                fontSize: 16,
                fontWeight: FontWeight.w400),
            enabledBorder: myInputBorder(context),
            focusedBorder:myInputBorder(context),
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
