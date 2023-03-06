import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/utils/constants.dart';
import 'package:pry_mascotas/widgets/item_adoption_home_widget.dart';
import 'package:pry_mascotas/widgets/item_lost_home_widget.dart';
import 'package:pry_mascotas/widgets/row_options_home_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width;
    double cHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: cWhiteColor,
      appBar: AppBar(
        backgroundColor: cBlueColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RowOptionsHomeWidget(
              section: "Perdidas",
              onTap: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  ItemLostHomeWidget(name: "Lucky", age: 2.0, days: 4),
                  ItemLostHomeWidget(name: "Tobby", age: 3.0, days: 20),
                  ItemLostHomeWidget(name: "Rocky", age: 5.0, days: 8),
                  ItemLostHomeWidget(name: "Gringo", age: 1.0, days: 15),
                  ItemLostHomeWidget(name: "Spike", age: 6.0, days: 12),
                  ItemLostHomeWidget(name: "Nacho", age: 8.0, days: 7),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RowOptionsHomeWidget(
              section: "En Adopción",
              onTap: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  ItemAdoptionHomeWidget(
                    name: "Oswaldo",
                    age: 3.0,
                    description:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                  ),
                  ItemAdoptionHomeWidget(
                    name: "Reynaldo",
                    age: 5.0,
                    description:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                  ),
                  ItemAdoptionHomeWidget(
                    name: "Roger",
                    age: 4.0,
                    description:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
