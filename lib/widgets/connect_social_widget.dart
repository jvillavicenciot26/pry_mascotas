import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';

class ConnectSocialWidet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: const [
            Expanded(
              child: Divider(
                color: cGreyColor,
                thickness: 2,
                indent: 10,
                endIndent: 10,
              ),
            ),
            Text(
              "o puedes conectar con",
              style: TextStyle(
                color: cGreyColor,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Expanded(
              child: Divider(
                color: cGreyColor,
                thickness: 2,
                indent: 10,
                endIndent: 10,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: cWidth * 0.15,
              height: cWidth * 0.15,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/facebook.png",
                  ),
                ),
              ),
            ),
            Container(
              width: cWidth * 0.15,
              height: cWidth * 0.15,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/google.png",
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
