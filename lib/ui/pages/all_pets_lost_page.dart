import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/ui/widgets/common_text.dart';
import 'package:pry_mascotas/ui/widgets/item_all_pet_lost_widget.dart';

class AllPetsLostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //double cHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: BrandColor.cWhiteColor,
      appBar: AppBar(
        title: H4(
          text: "Mascotas Perdidas",
          color: BrandColor.cWhiteColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: BrandColor.cBlueColor,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 12.0,
            childAspectRatio: 0.6,
          ),
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            return ItemAllPetLostWidget();
          },
        ),
      ),
    );
  }
}
