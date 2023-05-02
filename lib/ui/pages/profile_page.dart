import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pry_mascotas/bloc/home/home_bloc.dart';
import 'package:pry_mascotas/bloc/home/home_state.dart';
import 'package:pry_mascotas/models/pet_model.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/ui/pages/add_my_pet_page.dart';
import 'package:pry_mascotas/ui/widgets/common_text.dart';
import 'package:pry_mascotas/ui/widgets/common_widget.dart';
import 'package:pry_mascotas/ui/widgets/row_options_home_widget.dart';
import 'package:pry_mascotas/utils/asset_data.dart';
import 'package:pry_mascotas/utils/constants.dart';
import 'package:pry_mascotas/utils/responsive.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedMenu = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeInitState || state is HomeLoadingState) {
              return loadingWidget;
            } else if (state is HomeGetProfileState) {
              return SingleChildScrollView(
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
                            radius: ResponsiveUI.pHeight(context, 0.07),
                            backgroundColor: BrandColor.cWhiteColor,
                            child: state.userModel!.imagen
                                    .isNotEmpty //userModel!.imagen.isNotEmpty
                                ? Container(
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
                                  )
                                : SvgPicture.asset(
                                    AssetData.iconUser,
                                    color: BrandColor.cBlueColor,
                                    width: ResponsiveUI.pWidth(context, 0.2),
                                  ),
                          ),
                          spacing10,
                          H3(
                            text: state.userModel!.nombre, //userModel!.nombre,
                            color: BrandColor.cWhiteColor,
                          ),
                          spacing4,
                          H3(
                            text:
                                "${state.userModel!.apellidoPaterno} ${state.userModel!.apellidoMaterno}",
                            //"${userModel!.apellidoPaterno} ${userModel!.apellidoMaterno}",
                            color: BrandColor.cWhiteColor,
                          ),
                          spacing30,
                          H3(
                            text: state.petsModel == null //petsModels == null
                                ? "0 Mascotas"
                                : "${state.petsModel!.length} Mascotas",
                            color: BrandColor.cWhiteColor,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(
                              Icons.email,
                            ),
                            title: H5(
                              text: "Email",
                            ),
                            subtitle: H5(
                              text: state.userModel!.email,
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
                              text: state.userModel!.telefono,
                            ),
                          ),
                          spacing10,
                          RowOptionsHomeWidget(
                            section: "Mis Mascotas",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddMyPetPage(),
                                ),
                              );
                            },
                            option: "Agregar",
                          ),
                          spacing10,
                          state.petsModel!.isNotEmpty
                              ? ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: state.petsModel!.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: const CircleAvatar(
                                        child: Icon(
                                          Icons.pets,
                                        ),
                                      ),
                                      title: H5(
                                        text: state.petsModel![index].nombre,
                                      ),
                                      subtitle: H5(
                                        text:
                                            "", //"${state.petsModel![index].edad} años",
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
                                )
                              : H5(text: "No tiene mascotas registradas."),
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
        ));
  }
}
