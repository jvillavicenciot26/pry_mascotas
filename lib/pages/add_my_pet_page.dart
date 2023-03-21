import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/utils/constants.dart';

class AddMyPetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      appBar: AppBar(
        title: Text(
          "Nueva Mascota",
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.check),
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
                  borderSide: BorderSide(
                    color: cBlueColor,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(lCircularBorder),
                  borderSide: BorderSide(
                    color: cBlueColor,
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
                  borderSide: BorderSide(
                    color: cBlueColor,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(lCircularBorder),
                  borderSide: BorderSide(
                    color: cBlueColor,
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
