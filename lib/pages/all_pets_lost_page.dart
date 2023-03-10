import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/utils/constants.dart';

class AllPetsLostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width;
    double cHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: cWhiteColor,
      appBar: AppBar(
        title: Text(
          "Mascotas Perdidas",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12.0,
            crossAxisSpacing: 12.0,
            childAspectRatio: 0.6,
          ),
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                color: cWhiteColor,
                borderRadius: BorderRadius.circular(lCircularBorder),
                boxShadow: [
                  BoxShadow(
                    color: cGreyColor.withOpacity(0.2),
                    offset: const Offset(3, 3),
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Container(
                        height: cHeight * 0.22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(lCircularBorder),
                            topLeft: Radius.circular(lCircularBorder),
                          ),
                          image: const DecorationImage(
                            image: NetworkImage(
                              "https://images.pexels.com/photos/13688472/pexels-photo-13688472.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        color: cGreenColor.withOpacity(0.7),
                        child: Text(
                          "3 años",
                          style: TextStyle(
                            color: cGreyColor,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Bobby",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.male,
                              size: 30.0,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Esto es una prueba de descripcion que podria tener errores. Por eso estamos trabajando.",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "4 días",
                          style: const TextStyle(
                            color: cRedColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
