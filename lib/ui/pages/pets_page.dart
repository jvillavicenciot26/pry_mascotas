import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/pages/all_pets_lost_page.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/ui/widgets/common_widget.dart';
import 'package:pry_mascotas/ui/widgets/item_adoption_home_widget.dart';
import 'package:pry_mascotas/ui/widgets/item_lost_home_widget.dart';
import 'package:pry_mascotas/ui/widgets/item_rescue_home_widget.dart';
import 'package:pry_mascotas/ui/widgets/row_options_home_widget.dart';

class PetsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.cWhiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RowOptionsHomeWidget(
                section: "Perdidas",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllPetsLostPage()),
                  );
                },
              ),
              spacing10,
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
              spacing10,
              RowOptionsHomeWidget(
                section: "En Adopción",
                onTap: () {},
              ),
              spacing10,
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
              spacing10,
              RowOptionsHomeWidget(
                section: "Rescatadas",
                onTap: () {},
              ),
              spacing10,
              ListView.builder(
                //scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return ItemRescueHomeWidget();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
