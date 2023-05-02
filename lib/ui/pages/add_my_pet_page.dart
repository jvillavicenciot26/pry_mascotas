import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mime_type/mime_type.dart';
import 'package:pry_mascotas/bloc/add_pet/add_pet_bloc.dart';
import 'package:pry_mascotas/bloc/add_pet/add_pet_event.dart';
import 'package:pry_mascotas/bloc/add_pet/add_pet_state.dart';
import 'package:pry_mascotas/bloc/home/home_bloc.dart';
import 'package:pry_mascotas/bloc/home/home_state.dart';
import 'package:pry_mascotas/models/pet_model.dart';
import 'package:pry_mascotas/models/species_model.dart';
import 'package:pry_mascotas/services/local/sp_global.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/ui/widgets/common_text.dart';
import 'package:pry_mascotas/ui/widgets/common_widget.dart';
import 'package:pry_mascotas/ui/widgets/textfield_common_widget.dart';
import 'package:pry_mascotas/utils/asset_data.dart';
import 'package:pry_mascotas/utils/constants.dart';
import 'package:pry_mascotas/utils/responsive.dart';
import 'package:pry_mascotas/utils/types.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddMyPetPage extends StatefulWidget {
  PetModel? petModel;
  AddMyPetPage({this.petModel});
  @override
  State<AddMyPetPage> createState() => _AddMyPetPageState();
}

class _AddMyPetPageState extends State<AddMyPetPage> {
  List<String> razas = [];
  String idespecie = "";
  String idgenero = "Hembra";
  String valueRaza = "";
  TextEditingController nombreController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController fechaController = TextEditingController();
  ImagePicker imagePicker = ImagePicker();
  XFile? image;

  Future<void> getImageGallery() async {
    image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {});
    }
  }

  Future<String> uploadImageStorage() async {
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;
    firebase_storage.Reference referenceStorage =
        storage.ref().child(SPGlobal().id).child("pets");

    String name = DateTime.now().toString();
    String temp = mime(image!.path) ?? "";
    String extension = temp.split("/")[1];

    firebase_storage.TaskSnapshot uploadTask = await referenceStorage
        .child("$name.$extension")
        .putFile(File(image!.path));

    return await uploadTask.ref.getDownloadURL();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<AddPetBloc>(context).add(AddPetGetDataEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.cWhiteColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: H4(
          text: "Nueva Mascota",
          color: BrandColor.cWhiteColor,
        ),
        actions: [
          IconButton(
            onPressed: () async {
              if (widget.petModel == null ||
                  widget.petModel!.imagen!.isEmpty) {}
              String urlImage = await uploadImageStorage();
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(lCircularBorder),
                          child: Image(
                            image: image != null
                                ? FileImage(File(image!.path))
                                : const AssetImage(
                                        AssetData.imageDefaultMascota)
                                    as ImageProvider,
                            fit: BoxFit.cover,
                            width: ResponsiveUI.pWidth(context, 0.22),
                            height: ResponsiveUI.pWidth(context, 0.22),
                          ),
                        ),
                        Positioned(
                          bottom: -5,
                          right: -10,
                          child: IconButton(
                            onPressed: () {
                              getImageGallery();
                            },
                            icon: Icon(
                              Icons.camera_alt,
                              size: 30.0,
                              color: BrandColor.cGreyColor.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                    spacing10Width,
                    Expanded(
                      child: Column(
                        children: [
                          TextFieldCommonWidget(
                            hintText: "Nombre",
                            controller: nombreController,
                            icon: Icon(
                              Icons.pets,
                              color: BrandColor.cBlueColor.withOpacity(0.5),
                            ),
                            type: InputType.text,
                          ),
                          spacing10,
                          TextFieldCommonWidget(
                            hintText: "Fecha de nacimiento",
                            readOnly: true,
                            controller: fechaController,
                            icon: Icon(
                              Icons.calendar_month,
                              color: BrandColor.cBlueColor.withOpacity(0.5),
                            ),
                            //type: InputType.text,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1980),
                                lastDate: DateTime.now(),
                                locale: const Locale('es'),
                              );

                              if (pickedDate != null) {
                                String formattedDate =
                                    DateFormat('dd-MM-yyyy').format(pickedDate);
                                fechaController.text = formattedDate;
                                setState(() {});
                              } else {
                                fechaController.text = "";
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                H5(text: "Especie"),
                BlocBuilder<AddPetBloc, AddPetState>(
                  builder: (context, state) {
                    if (state is AddPetInitState ||
                        state is AddPetLoadingState) {
                      return loadingWidget;
                    } else if (state is AddPetGetDataState) {
                      idespecie = state.especiesRazas.first.idespecie ?? "";
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: BrandColor.cWhiteColor,
                          borderRadius: BorderRadius.circular(lCircularBorder),
                          boxShadow: [
                            BoxShadow(
                              color: BrandColor.cBlackColor.withOpacity(0.05),
                              blurRadius: 12.0,
                              offset: const Offset(4, 4),
                            ),
                          ],
                        ),
                        child: DropdownButton(
                          underline: const SizedBox(),
                          value: idespecie,
                          items: state.especiesRazas
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e.idespecie,
                                  child: Text(e.nombre),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            idespecie = value!;
                            print(idespecie);
                            BlocProvider.of<AddPetBloc>(context).add(
                              AddPetChangeEspecieEvent(
                                especiesRazas: state.especiesRazas,
                                idespecie: idespecie,
                              ),
                            );
                          },
                        ),
                      );
                    } else if (state is AddPetChangeEspecieState) {
                      return const SizedBox();
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                H5(text: "Raza"),
                BlocBuilder<AddPetBloc, AddPetState>(
                  builder: (context, state) {
                    if (state is AddPetInitState ||
                        state is AddPetLoadingState) {
                      return loadingWidget;
                    } else if (state is AddPetChangeEspecieState) {
                      valueRaza = state.razas.first;
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: BrandColor.cWhiteColor,
                          borderRadius: BorderRadius.circular(lCircularBorder),
                          boxShadow: [
                            BoxShadow(
                              color: BrandColor.cBlackColor.withOpacity(0.05),
                              blurRadius: 12.0,
                              offset: const Offset(4, 4),
                            ),
                          ],
                        ),
                        child: DropdownButton(
                          underline: const SizedBox(),
                          value: valueRaza,
                          items: state.razas
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            valueRaza = value!;
                          },
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                H5(text: "Genero"),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: BrandColor.cWhiteColor,
                    borderRadius: BorderRadius.circular(lCircularBorder),
                    boxShadow: [
                      BoxShadow(
                        color: BrandColor.cBlackColor.withOpacity(0.05),
                        blurRadius: 12.0,
                        offset: const Offset(4, 4),
                      ),
                    ],
                  ),
                  child: DropdownButton(
                    underline: const SizedBox(),
                    value: idgenero,
                    items: const [
                      DropdownMenuItem(
                        value: "Hembra",
                        child: Text("Hembra"),
                      ),
                      DropdownMenuItem(
                        value: "Macho",
                        child: Text("Macho"),
                      ),
                    ],
                    onChanged: (value) {
                      idgenero = value!;
                      setState(() {});
                    },
                  ),
                ),
                spacing10,
                TextFieldCommonWidget(
                  hintText: "Color",
                  icon: Icon(
                    Icons.color_lens,
                    color: BrandColor.cBlueColor.withOpacity(0.5),
                  ),
                  controller: colorController,
                ),
              ],
            ),
          ),
          BlocListener(
            bloc: BlocProvider.of<AddPetBloc>(context),
            listener: (BuildContext context, AddPetState state) {
              if (state is AddPetErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  snackBarError(state.message),
                );
              } else if (state is AddPetSuccedState) {
                Navigator.pop(context);
              }
            },
            child: BlocBuilder<AddPetBloc, AddPetState>(
              builder: (BuildContext context, AddPetState state) {
                if (state is AddPetInitState) {
                  return const SizedBox();
                } else if (state is AddPetLoadingState) {
                  return Container(
                    color: BrandColor.cWhiteColor.withOpacity(0.70),
                    child: loadingWidget,
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
