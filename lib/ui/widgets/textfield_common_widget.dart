import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/utils/constants.dart';
import 'package:pry_mascotas/utils/types.dart';

class TextFieldCommonWidget extends StatelessWidget {
  String hintText;
  Icon icon;
  InputType type;
  TextFieldCommonWidget({
    required this.hintText,
    required this.icon,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: BrandColor.cBlueColor,
      keyboardType: type == InputType.dni || type == InputType.phone
          ? TextInputType.number
          : TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: icon,
        filled: true,
        fillColor: BrandColor.cWhiteColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 14.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(lCircularBorder),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(lCircularBorder),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
