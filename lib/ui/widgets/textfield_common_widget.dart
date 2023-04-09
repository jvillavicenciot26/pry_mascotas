import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/utils/constants.dart';
import 'package:pry_mascotas/utils/types.dart';

class TextFieldCommonWidget extends StatelessWidget {
  String hintText;
  Icon icon;
  InputType type;
  TextEditingController controller = TextEditingController();

  TextFieldCommonWidget({
    required this.hintText,
    required this.icon,
    required this.type,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: BrandColor.cBlueColor,
      keyboardType: type == InputType.dni || type == InputType.phone
          ? TextInputType.number
          : TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: icon,
        errorStyle: const TextStyle(
          color: BrandColor.cRedColor,
          fontWeight: FontWeight.bold,
        ),
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(lCircularBorder),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(lCircularBorder),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty) {
          return "Campo Obligatorio";
          //return null;
        }
        return null;
      },
    );
  }
}
