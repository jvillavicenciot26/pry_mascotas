import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/utils/constants.dart';

class TextFieldAccountWidget extends StatelessWidget {
  String hintText;
  Icon icon;
  TextFieldAccountWidget({required this.hintText, required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: cBlueColor,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: icon,
        filled: true,
        fillColor: cWhiteColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 14.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(lCircularBorder),
          borderSide: BorderSide.none,
          // const BorderSide(
          //   color: cGreyColor,
          //   width: 2.0,
          // ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(lCircularBorder),
          borderSide: BorderSide.none,
          // const BorderSide(
          //   color: cGreyColor,
          //   width: 2.0,
          // ),
        ),
      ),
    );
  }
}
