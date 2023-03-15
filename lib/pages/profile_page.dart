import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/utils/constants.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double cHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: cWhiteColor,
      appBar: AppBar(
        title: Text(
          "Mi Perfil",
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: cBlueColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(lCircularBorder),
                bottomRight: Radius.circular(lCircularBorder),
              ),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                  ),
                  radius: cHeight * 0.07,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Nombre Apellido",
                  style: TextStyle(
                    color: cWhiteColor,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  "# Mascotas",
                  style: TextStyle(
                    color: cWhiteColor,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.email,
                  ),
                  title: Text(
                    "Email",
                  ),
                  subtitle: Text(
                    "jvillavicencio@nisira.com.pe",
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.phone_android,
                  ),
                  title: Text(
                    "Telefono",
                  ),
                  subtitle: Text(
                    "948315754",
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.person_rounded,
                  ),
                  title: Text(
                    "Usuario",
                  ),
                  subtitle: Text(
                    "jvillavicencio",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
