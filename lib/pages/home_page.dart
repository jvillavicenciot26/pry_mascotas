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
  final List<Widget> _pageOption = [
    PetsPage(),
    EventsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    double cHeight = MediaQuery.of(context).size.height;
    double cWidth = MediaQuery.of(context).size.width;
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
            items: const [
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
                decoration: const BoxDecoration(
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
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: cWhiteColor.withOpacity(0.4),
                child: IconButton(
                  icon: Icon(Icons.person),
                  color: cWhiteColor,
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
            );
          },
        ),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            cursorColor: cBlueColor,
            decoration: InputDecoration(
              filled: true,
              fillColor: cWhiteColor.withOpacity(0.5),
              hintText: "Buscar",
              prefixIcon: const Icon(
                Icons.search,
                color: cGreyColor,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
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
        ),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.amberAccent,
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: cBlueColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    ),
                    radius: 35,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    "Nombre Apellido",
                    style: TextStyle(
                      color: cWhiteColor,
                      fontSize: 20.0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "correo@correo.com",
                        style: TextStyle(
                          color: cWhiteColor,
                          fontSize: 14.0,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: cWhiteColor,
                        //size: cHeight * 0.04,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              dense: true,
              leading: Icon(
                Icons.pets,
                color: cGreyColor,
                size: 30.0,
              ),
              title: Text(
                "Mascotas perdidas",
                style: TextStyle(
                  color: cGreyColor,
                  fontSize: 16.0,
                ),
              ),
            ),
            ListTile(
              dense: true,
              leading: Icon(
                Icons.pets,
                color: cGreyColor,
                size: 30.0,
              ),
              title: Text(
                "Mascotas en adopción.",
                style: TextStyle(
                  color: cGreyColor,
                  fontSize: 16.0,
                ),
              ),
            ),
            ListTile(
              dense: true,
              leading: Icon(
                Icons.pets,
                color: cGreyColor,
                size: 30.0,
              ),
              title: Text(
                "Animales Rescatados",
                style: TextStyle(
                  color: cGreyColor,
                  fontSize: 16.0,
                ),
              ),
            ),
            Divider(
              indent: 20.0,
              endIndent: 20.0,
              color: cGreyColor,
              thickness: 1.0,
            ),
            ListTile(
              dense: true,
              leading: Icon(
                Icons.logout_rounded,
                color: cGreyColor,
                size: 30.0,
              ),
              title: Text(
                "Cerrar sesión",
                style: TextStyle(
                  color: cGreyColor,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 12.0,
              ),
              Text(
                "Notificaciones",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Container(
                color: cBlueColor.withOpacity(0.2),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  ),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    ),
                    //radius: 28,
                  ),
                  title: Text(
                    "Mascotas perdidas",
                    style: TextStyle(
                      color: cGreyColor,
                      fontSize: 16.0,
                    ),
                  ),
                  subtitle: Text(
                    "Nuevo reporte de tu mascota.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: cGreyColor,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: _pageOption.elementAt(_selectedPage),
    );
  }
}
