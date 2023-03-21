import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/utils/constants.dart';
import 'package:pry_mascotas/widgets/common_button_widget.dart';
import 'package:pry_mascotas/widgets/common_circular_button_widget.dart';
import 'package:pry_mascotas/widgets/common_information_pet_widget.dart';

class SpecificPet extends StatelessWidget {
  String origin;
  SpecificPet({required this.origin});

  @override
  Widget build(BuildContext context) {
    double cHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: cWhiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: cWhiteColor.withOpacity(0.25),
            child: const BackButton(
              color: cWhiteColor,
            ),
          ),
        ), //
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: cHeight * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(lCircularBorder),
                bottomRight: Radius.circular(lCircularBorder),
              ),
              image: const DecorationImage(
                image: NetworkImage(
                  "https://images.pexels.com/photos/13688472/pexels-photo-13688472.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Tobby",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.location_pin,
                                size: 18.0,
                              ),
                              Text(
                                "Trujillo - Perú",
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Text(
                        "20/12/2022",
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CommonInformationPetWidget(
                        title: "Genero",
                        data: "Macho",
                        color: cBlueColor,
                      ),
                      CommonInformationPetWidget(
                        title: "Edad",
                        data: "2 años",
                        color: cGreenColor,
                      ),
                      CommonInformationPetWidget(
                        title: "Tiempo",
                        data: "4 dias",
                        color: cRedColor,
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: cHeight * 0.03,
                            backgroundImage: const NetworkImage(
                              "https://images.pexels.com/photos/13688472/pexels-photo-13688472.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Nombre de persona",
                              ),
                              Text(
                                "Dueño",
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CommonCircularButtonWidget(
                            color: cGreenColor,
                            icon: Icons.message_outlined,
                            fHeight: 0.03,
                            onTap: () {},
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          CommonCircularButtonWidget(
                            color: cBlueColor,
                            icon: Icons.location_on_outlined,
                            fHeight: 0.03,
                            onTap: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: origin == "L"
                        ? [
                            Expanded(
                              child: CommonButtonWiget(
                                label: "Encontrado",
                                backColor: cBlueColor,
                                textColor: cWhiteColor,
                                onPressed: () {},
                              ),
                            ),
                            Expanded(
                              child: CommonButtonWiget(
                                label: "Visto",
                                backColor: cGreenColor,
                                textColor: cBlackColor,
                                onPressed: () {},
                              ),
                            ),
                          ]
                        : [
                            Expanded(
                              child: CommonButtonWiget(
                                label: origin == "A" ? "Adoptame" : "Ayudame",
                                backColor: cBlueColor,
                                textColor: cWhiteColor,
                                onPressed: () {},
                                origin: origin,
                              ),
                            ),
                          ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
