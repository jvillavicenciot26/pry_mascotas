import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/ui/widgets/common_text.dart';
import 'package:pry_mascotas/ui/widgets/common_widget.dart';
import 'package:pry_mascotas/ui/widgets/textfield_common_widget.dart';
import 'package:pry_mascotas/utils/constants.dart';
import 'package:pry_mascotas/utils/types.dart';

class AddMyPetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.cWhiteColor,
      appBar: AppBar(
        title: H4(
          text: "Nueva Mascota",
          color: BrandColor.cWhiteColor,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TextFieldCommonWidget(
            //   hintText: "Nombre",
            //   icon: const Icon(
            //     Icons.pets,
            //   ),
            //   type: InputType.text,
            // ),
            // spacing10,
            // TextFieldCommonWidget(
            //   hintText: "Edad",
            //   icon: const Icon(
            //     Icons.pets,
            //   ),
            //   type: InputType.dni,
            // ),
            // spacing10,
          ],
        ),
      ),
    );
  }
}
