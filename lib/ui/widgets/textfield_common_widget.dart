import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/ui/widgets/common_text.dart';
import 'package:pry_mascotas/utils/constants.dart';
import 'package:pry_mascotas/utils/types.dart';

class TextFieldCommonWidget extends StatelessWidget {
  String? label;
  String hintText;
  Icon icon;
  InputType? type;
  TextEditingController controller = TextEditingController();
  VoidCallback? onTap;
  bool? readOnly;

  TextFieldCommonWidget({
    this.label,
    required this.hintText,
    required this.icon,
    this.type,
    required this.controller,
    this.onTap,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? H5(
                text: "   ${label!}",
                fontWeight: FontWeight.w500,
              )
            : const SizedBox(),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: BrandColor.cBlackColor.withOpacity(0.05),
                blurRadius: 12.0,
                offset: const Offset(4, 4),
              ),
            ],
          ),
          child: TextFormField(
            readOnly: readOnly ?? false,
            onTap: onTap ?? () {},
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
          ),
        ),
      ],
    );
  }
}
