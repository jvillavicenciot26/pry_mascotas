import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pry_mascotas/pages/events_page.dart';
import 'package:pry_mascotas/pages/map_page.dart';
import 'package:pry_mascotas/pages/pets_page.dart';
import 'package:pry_mascotas/ui/general/colors.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;
  List<Widget> _pageOption = [
    PetsPage(),
    EventsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width;
    double cHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: cWhiteColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: cBlueColor,
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: cWhiteColor,
          size: cHeight * 0.05,
        ),
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          BottomNavigationBar(
            backgroundColor: cBlueColor,
            selectedItemColor: cWhiteColor,
            unselectedItemColor: cWhiteColor.withOpacity(0.7),
            showUnselectedLabels: false,
            currentIndex: _selectedPage,
            onTap: (int value) {
              _selectedPage = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.pets,
                ),
                label: "Mascotas",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.event_available,
                ),
                label: "Eventos",
              ),
            ],
          ),
          Positioned(
            bottom: cHeight * 0.025,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapPage(),
                    ));
              },
              child: Container(
                height: cHeight * 0.08,
                width: cHeight * 0.08,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/ic_maps.png",
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: cBlueColor,
        elevation: 0,
        leading: Icon(
          Icons.person,
        ),
        centerTitle: true,
        title: TextField(
          cursorColor: cBlueColor,
          decoration: InputDecoration(
            filled: true,
            fillColor: cWhiteColor.withOpacity(0.5),
            hintText: "Buscar",
            prefixIcon: Icon(
              Icons.search,
              color: cGreyColor,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10.0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(26.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(26.0),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: Colors.amberAccent,
            ),
          ),
        ],
      ),
      body: _pageOption.elementAt(_selectedPage),
    );
  }
}
