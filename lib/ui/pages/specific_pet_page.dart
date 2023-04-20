import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/ui/widgets/common_text.dart';
import 'package:pry_mascotas/ui/widgets/common_widget.dart';
import 'package:pry_mascotas/utils/constants.dart';
import 'package:pry_mascotas/ui/widgets/common_button_widget.dart';
import 'package:pry_mascotas/ui/widgets/common_circular_button_widget.dart';
import 'package:pry_mascotas/ui/widgets/common_information_pet_widget.dart';
import 'package:pry_mascotas/utils/responsive.dart';

class SpecificPet extends StatelessWidget {
  String origin;
  SpecificPet({required this.origin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: BrandColor.cWhiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: BrandColor.cWhiteColor.withOpacity(0.25),
            child: const BackButton(
              color: BrandColor.cWhiteColor,
            ),
          ),
        ), //
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: ResponsiveUI.pHeight(context, 0.5),
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
                          H1(
                            text: "Tobby",
                            color: BrandColor.cBlackColor,
                          ),
                          spacing4,
                          Row(
                            children: [
                              const Icon(
                                Icons.location_pin,
                                size: 18.0,
                              ),
                              H5(
                                text: "Trujillo - Perú",
                              ),
                            ],
                          ),
                        ],
                      ),
                      H5(
                        text: "20/12/2022",
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
                        color: BrandColor.cBlueColor,
                      ),
                      CommonInformationPetWidget(
                        title: "Edad",
                        data: "2 años",
                        color: BrandColor.cGreenColor,
                      ),
                      CommonInformationPetWidget(
                        title: "Tiempo",
                        data: "4 dias",
                        color: BrandColor.cRedColor,
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  H4(
                    text:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                    maxLines: 5,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  const Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: ResponsiveUI.pHeight(context, 0.03),
                            backgroundImage: const NetworkImage(
                              "https://images.pexels.com/photos/13688472/pexels-photo-13688472.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                            ),
                          ),
                          spacing10Width,
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              H5(
                                text: "Nombre de persona",
                              ),
                              H5(
                                text: "Dueño",
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CommonCircularButtonWidget(
                            color: BrandColor.cGreenColor,
                            icon: Icons.message_outlined,
                            fHeight: 0.03,
                            onTap: () {},
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          CommonCircularButtonWidget(
                            color: BrandColor.cBlueColor,
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
                                backColor: BrandColor.cBlueColor,
                                textColor: BrandColor.cWhiteColor,
                                onPressed: () {},
                              ),
                            ),
                            Expanded(
                              child: CommonButtonWiget(
                                label: "Visto",
                                backColor: BrandColor.cGreenColor,
                                textColor: BrandColor.cBlackColor,
                                onPressed: () {},
                              ),
                            ),
                          ]
                        : [
                            Expanded(
                              child: CommonButtonWiget(
                                label: origin == "A" ? "Adoptame" : "Ayudame",
                                backColor: BrandColor.cBlueColor,
                                textColor: BrandColor.cWhiteColor,
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
