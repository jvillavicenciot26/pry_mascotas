import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width;
    double cHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      //backgroundColor: cWhiteColor,
      appBar: AppBar(
        backgroundColor: cBlueColor,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Perdidas",
                style: TextStyle(
                  color: cWhiteColor,
                ),
              ),
              Text(
                "Ver todo",
                style: TextStyle(
                  color: cWhiteColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            //height: cHeight * 0.2,
            width: cWidth * 0.3,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(26.0),
            ),
            child: Column(
              children: [
                Container(
                  height: cHeight * 0.13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(26.0),
                      topLeft: Radius.circular(26.0),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://images.pexels.com/photos/13688472/pexels-photo-13688472.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Lucky",
                        ),
                        Text(
                          "Edad: 2 años",
                        ),
                      ],
                    ),
                    Icon(
                      Icons.male,
                    ),
                  ],
                ),
                Text(
                  "4 días",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
