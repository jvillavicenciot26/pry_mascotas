import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/utils/constants.dart';

class TextFielPasswordWidget extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  TextFielPasswordWidget({required this.controller});
  @override
  State<TextFielPasswordWidget> createState() => _TextFielPasswordWidgetState();
}

class _TextFielPasswordWidgetState extends State<TextFielPasswordWidget> {
  bool isInvisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: isInvisible,
      cursorColor: BrandColor.cBlueColor,
      decoration: InputDecoration(
        hintText: "Clave",
        prefixIcon: const Icon(
          Icons.key,
          color: BrandColor.cGreyColor,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isInvisible ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
            color: BrandColor.cGreyColor.withOpacity(0.4),
          ),
          onPressed: () {
            isInvisible = !isInvisible;
            setState(() {});
          },
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
          return "Campo obligatorio";
        }
        return null;
      },
    );
  }
}
