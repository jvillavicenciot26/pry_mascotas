import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/utils/constants.dart';

class TextFielPasswordWidget extends StatefulWidget {
  @override
  State<TextFielPasswordWidget> createState() => _TextFielPasswordWidgetState();
}

class _TextFielPasswordWidgetState extends State<TextFielPasswordWidget> {
  bool isInvisible = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isInvisible,
      cursorColor: cBlueColor,
      decoration: InputDecoration(
        hintText: "Clave",
        prefixIcon: Icon(
          Icons.key,
          color: cGreyColor,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isInvisible ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
            color: cGreyColor.withOpacity(0.4),
          ),
          onPressed: () {
            isInvisible = !isInvisible;
            setState(() {});
          },
        ),
        filled: true,
        fillColor: cWhiteColor,
        contentPadding: EdgeInsets.symmetric(
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
