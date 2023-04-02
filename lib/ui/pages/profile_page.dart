import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/ui/widgets/common_text.dart';
import 'package:pry_mascotas/ui/widgets/common_widget.dart';
import 'package:pry_mascotas/ui/widgets/row_options_home_widget.dart';
import 'package:pry_mascotas/utils/constants.dart';
import 'package:pry_mascotas/utils/responsive.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedMenu = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.cWhiteColor,
      appBar: AppBar(
        title: H4(
          text: "Mi Perfil",
          color: BrandColor.cWhiteColor,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: BrandColor.cBlueColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(lCircularBorder),
                  bottomRight: Radius.circular(lCircularBorder),
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: const NetworkImage(
                      "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    ),
                    radius: ResponsiveUI.pHeight(context, 0.07),
                  ),
                  spacing10,
                  H3(
                    text: "Nombre Apellido",
                    color: BrandColor.cWhiteColor,
                  ),
                  spacing30,
                  H3(
                    text: "# Mascotas",
                    color: BrandColor.cWhiteColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.email,
                    ),
                    title: H5(
                      text: "Email",
                    ),
                    subtitle: H5(
                      text: "jvillavicencio@nisira.com.pe",
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.phone_android,
                    ),
                    title: H5(
                      text: "Telefono",
                    ),
                    subtitle: H5(
                      text: "948315754",
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.person_rounded,
                    ),
                    title: H5(
                      text: "Usuario",
                    ),
                    subtitle: H5(
                      text: "jvillavicencio",
                    ),
                  ),
                  spacing10,
                  RowOptionsHomeWidget(
                      section: "Mis Mascotas", onTap: () {}, option: "Agregar"),
                  spacing10,
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: const CircleAvatar(),
                        title: H5(
                          text: "Perro",
                        ),
                        subtitle: H5(
                          text: "3 años",
                        ),
                        trailing: PopupMenuButton(
                          initialValue: selectedMenu,
                          icon: const Icon(
                            Icons.more_vert,
                          ),
                          onSelected: (value) {
                            setState(() {
                              selectedMenu = value;
                            });
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 0,
                              child: Row(
                                children: [
                                  const Icon(Icons.edit),
                                  spacing2Width,
                                  H5(
                                    text: 'Editar',
                                  ),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 1,
                              child: Row(
                                children: [
                                  const Icon(Icons.delete),
                                  spacing2Width,
                                  H5(
                                    text: 'Borrar',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
