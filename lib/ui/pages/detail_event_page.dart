import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/ui/widgets/common_text.dart';
import 'package:pry_mascotas/utils/constants.dart';
import 'package:pry_mascotas/utils/responsive.dart';

class DetailEventPage extends StatelessWidget {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: ResponsiveUI.pHeight(context, 0.4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(lCircularBorder),
                  bottomRight: Radius.circular(lCircularBorder),
                ),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://peru21.pe/resizer/0INjZlyXxgkcggIv4kn4CfCaZkE=/980x0/smart/filters:format(jpeg):quality(75)/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/A7OFXK4Y25E5VEUKEYEYVGF2N4.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          H3(
                            text: "Mascoting - Barcelona",
                            color: BrandColor.cBlackColor,
                            fontWeight: FontWeight.bold,
                          ),
                          H5(
                            text: "Organizado por Prueba 1",
                          ),
                        ],
                      ),
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(lCircularBorder - 15),
                        child: Container(
                          padding: EdgeInsets.all(12.0),
                          color: BrandColor.cBlueColor,
                          child: Column(
                            children: [
                              H5(
                                text: "Mes",
                                color: BrandColor.cWhiteColor,
                              ),
                              H3(
                                text: "25",
                                color: BrandColor.cWhiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.calendar_month,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              H5(
                                text: "Desde: 05/04/2023 - 03:00 pm",
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              H5(
                                text: "Hasta: 05/04/2023 - 03:00 pm",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  ListTile(
                    minLeadingWidth: 0,
                    horizontalTitleGap: 0,
                    contentPadding: EdgeInsets.all(0),
                    leading: const Icon(
                      Icons.location_on,
                    ),
                    title: H5(
                      text: "Trujillo - Trujillo - La Libertad",
                    ),
                    subtitle: H5(
                      text: "Av. España 2015",
                    ),
                  ),
                  H4(
                    text: "Descripcion",
                    color: BrandColor.cBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                  H5(
                    text:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    maxLines: 5,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  H4(
                    text: "Ubicación",
                    color: BrandColor.cBlackColor,
                    fontWeight: FontWeight.bold,
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
