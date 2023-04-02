import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/ui/widgets/common_text.dart';
import 'package:pry_mascotas/utils/constants.dart';

class AddMyPetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.cWhiteColor,
      appBar: AppBar(
        title: H5(
          text: "Nueva Mascota",
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
            TextField(
              decoration: InputDecoration(
                hintText: "Nombre",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(lCircularBorder),
                  borderSide: const BorderSide(
                    color: BrandColor.cBlueColor,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(lCircularBorder),
                  borderSide: const BorderSide(
                    color: BrandColor.cBlueColor,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Edad",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(lCircularBorder),
                  borderSide: const BorderSide(
                    color: BrandColor.cBlueColor,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(lCircularBorder),
                  borderSide: const BorderSide(
                    color: BrandColor.cBlueColor,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
