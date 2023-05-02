import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pry_mascotas/bloc/home/home_bloc.dart';
import 'package:pry_mascotas/bloc/home/home_event.dart';
import 'package:pry_mascotas/bloc/home/home_state.dart';
import 'package:pry_mascotas/bloc/login/login_bloc.dart';
import 'package:pry_mascotas/bloc/login/login_event.dart';
import 'package:pry_mascotas/services/local/sp_global.dart';
import 'package:pry_mascotas/ui/pages/events_page.dart';
import 'package:pry_mascotas/ui/pages/map_page.dart';
import 'package:pry_mascotas/ui/pages/pets_page.dart';
import 'package:pry_mascotas/ui/pages/profile_page.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pry_mascotas/ui/widgets/common_text.dart';
import 'package:pry_mascotas/ui/widgets/common_widget.dart';
import 'package:pry_mascotas/utils/asset_data.dart';
import 'package:pry_mascotas/utils/responsive.dart';

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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<HomeBloc>(context)
          .add(HomeGetProfileEvent(id: SPGlobal().id));
    });
  }

  @override
  Widget build(BuildContext context) {
    double cHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: BrandColor.cWhiteColor,
      floatingActionButton: SpeedDial(
        spacing: 12,
        backgroundColor: BrandColor.cBlueColor,
        icon: Icons.add,
        activeIcon: Icons.close,
        activeBackgroundColor: BrandColor.cGreenColor,
        activeForegroundColor: Colors.black,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        elevation: 8.0,
        children: _selectedPage == 0
            ? [
                SpeedDialChild(
                  child: const Icon(Icons.pets),
                  label: "Mascota Rescatada",
                  labelStyle: const TextStyle(fontSize: 16.0),
                  onTap: () {},
                ),
                SpeedDialChild(
                  child: const Icon(Icons.pets),
                  label: "Mascota en Adopcion",
                  labelStyle: const TextStyle(fontSize: 16.0),
                  onTap: () {},
                ),
                SpeedDialChild(
                  child: const Icon(Icons.pets),
                  label: "Mascota Perdida",
                  labelStyle: const TextStyle(fontSize: 16.0),
                  onTap: () {},
                ),
              ]
            : [
                SpeedDialChild(
                  child: const Icon(Icons.event_available_rounded),
                  label: "Evento",
                  labelStyle: const TextStyle(fontSize: 16.0),
                  onTap: () {},
                ),
              ],
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          BottomNavigationBar(
            backgroundColor: BrandColor.cBlueColor,
            selectedItemColor: BrandColor.cWhiteColor,
            unselectedItemColor: BrandColor.cWhiteColor.withOpacity(0.7),
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
                  ),
                );
              },
              child: Container(
                height: ResponsiveUI.pHeight(context, 0.08), //cHeight * 0.08,
                width: ResponsiveUI.pHeight(context, 0.08), //cHeight * 0.08,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      AssetData.imageIcMaps,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: BrandColor.cBlueColor,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: BrandColor.cWhiteColor.withOpacity(0.4),
                child: IconButton(
                  icon: const Icon(Icons.person),
                  color: BrandColor.cWhiteColor,
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
            );
          },
        ),
        centerTitle: true,
        // title: Padding(
        //   padding: const EdgeInsets.all(16.0),
        //   child: TextFieldCommonWidget(
        //     hintText: "Buscar",
        //     icon: const Icon(
        //       Icons.search,
        //       color: BrandColor.cGreyColor,
        //     ),
        //     type: InputType.text,
        //   ),
        // ),
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
      drawer: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          print(state);
          if (state is HomeInitState || state is HomeLoadingState) {
            return loadingWidget;
          } else if (state is HomeGetProfileState) {
            return Drawer(
              child: Column(
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: BrandColor.cBlueColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          child: state.userModel!.imagen.isEmpty
                              ? SvgPicture.asset(
                                  AssetData.iconUser,
                                  color: BrandColor.cBlueColor,
                                  width: ResponsiveUI.pWidth(context, 0.2),
                                )
                              : Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: state.userModel!.imagen,
                                    fit: BoxFit.fill,
                                    errorWidget: (context, url, error) {
                                      return SvgPicture.asset(
                                        AssetData.iconUser,
                                        color: BrandColor.cBlueColor,
                                        width:
                                            ResponsiveUI.pWidth(context, 0.2),
                                      );
                                    },
                                    progressIndicatorBuilder:
                                        (context, url, progress) {
                                      return loadingWidget;
                                    },
                                  ),
                                ),
                        ),
                        spacing16,
                        H3(
                          text: state.userModel!.nombre ?? "Nombre Apellido",
                          color: BrandColor.cWhiteColor,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            H5(
                              text:
                                  state.userModel!.email ?? "correo@correo.com",
                              color: BrandColor.cWhiteColor,
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              color: BrandColor.cWhiteColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        ListTile(
                          dense: true,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(),
                              ),
                            );
                          },
                          leading: const Icon(
                            Icons.person,
                            color: BrandColor.cGreyColor,
                            size: 30.0,
                          ),
                          title: H4(
                            text: "Mi Perfil",
                            color: BrandColor.cGreyColor,
                          ),
                        ),
                        const Divider(
                          indent: 20.0,
                          endIndent: 20.0,
                          color: BrandColor.cGreyColor,
                          thickness: 1.0,
                        ),
                        ListTile(
                          dense: true,
                          leading: const Icon(
                            Icons.pets,
                            color: BrandColor.cGreyColor,
                            size: 30.0,
                          ),
                          title: H4(
                            text: "Mascotas perdidas",
                            color: BrandColor.cGreyColor,
                          ),
                        ),
                        ListTile(
                          dense: true,
                          leading: const Icon(
                            Icons.pets,
                            color: BrandColor.cGreyColor,
                            size: 30.0,
                          ),
                          title: H4(
                            text: "Mascotas en adopción",
                            color: BrandColor.cGreyColor,
                          ),
                        ),
                        ListTile(
                          dense: true,
                          leading: const Icon(
                            Icons.pets,
                            color: BrandColor.cGreyColor,
                            size: 30.0,
                          ),
                          title: H4(
                            text: "Animales Rescatados",
                            color: BrandColor.cGreyColor,
                          ),
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        const Divider(
                          indent: 20.0,
                          endIndent: 20.0,
                          color: BrandColor.cGreyColor,
                          thickness: 1.0,
                        ),
                        ListTile(
                          onTap: () {
                            BlocProvider.of<LoginBloc>(context).add(
                              LogoutEvent(loginType: SPGlobal().loginType),
                            );
                          },
                          dense: true,
                          leading: const Icon(
                            Icons.logout_rounded,
                            color: BrandColor.cGreyColor,
                            size: 30.0,
                          ),
                          title: H4(
                            text: "Cerrar sesión",
                            color: BrandColor.cGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      endDrawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              spacing12,
              H4(
                text: "Notificaciones",
                fontWeight: FontWeight.bold,
              ),
              spacing12,
              Container(
                color: BrandColor.cBlueColor.withOpacity(0.2),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  ),
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    ),
                  ),
                  title: H4(
                    text: "Mascotas perdidas",
                    color: BrandColor.cGreyColor,
                  ),
                  subtitle: H5(
                    text: "Nuevo reporte de tu mascota.",
                    maxLines: 2,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: BrandColor.cGreyColor,
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
