import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pry_mascotas/bloc/add_pet/add_pet_bloc.dart';
import 'package:pry_mascotas/bloc/add_pet/add_pet_event.dart';
import 'package:pry_mascotas/bloc/add_pet/add_pet_state.dart';
import 'package:pry_mascotas/models/pet_model.dart';
import 'package:pry_mascotas/services/local/sp_global.dart';
import 'package:pry_mascotas/services/remote/firestorage_service.dart';
import 'package:pry_mascotas/services/remote/firestore_service.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/ui/widgets/common_text.dart';
import 'package:pry_mascotas/ui/widgets/common_widget.dart';
import 'package:pry_mascotas/ui/widgets/textfield_common_widget.dart';
import 'package:pry_mascotas/utils/asset_data.dart';
import 'package:pry_mascotas/utils/constants.dart';
import 'package:pry_mascotas/utils/responsive.dart';
import 'package:pry_mascotas/utils/types.dart';
import 'package:image_picker/image_picker.dart';

class AddMyPetPage extends StatefulWidget {
  PetModel? petModel;
  AddMyPetPage({this.petModel});
  @override
  State<AddMyPetPage> createState() => _AddMyPetPageState();
}

class _AddMyPetPageState extends State<AddMyPetPage> {
  String idespecie = "";
  String raza = "";
  String idgenero = "Hembra";
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _fechaController = TextEditingController();
  FirestorageService firestorageService = FirestorageService();
  FirestoreService firestoreService = FirestoreService();
  ImagePicker imagePicker = ImagePicker();
  XFile? image;

  Future<void> getImageGallery() async {
    image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {});
    }
  }

  void bigImage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: ClipRRect(
            borderRadius: BorderRadius.circular(lCircularBorder),
            child: widget.petModel == null
                ? Image(
                    image: image != null
                        ? FileImage(File(image!.path))
                        : const AssetImage(AssetData.imageDefaultMascota)
                            as ImageProvider,
                    fit: BoxFit.fill,
                    width: ResponsiveUI.pWidth(context, 0.25),
                    height: ResponsiveUI.pHeight(context, 0.5),
                  )
                : Image(
                    image: widget.petModel!.imagen!.isEmpty
                        ? const AssetImage(AssetData.imageDefaultMascota)
                        : image == null
                            ? NetworkImage(widget.petModel!.imagen!)
                            : FileImage(File(image!.path)) as ImageProvider,
                    fit: BoxFit.fill,
                    width: ResponsiveUI.pWidth(context, 0.25),
                    height: ResponsiveUI.pHeight(context, 0.5),
                  ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    if (widget.petModel != null) {
      _nombreController.text = widget.petModel!.nombre;
      _colorController.text = widget.petModel!.color;
      _fechaController.text =
          DateFormat('dd-MM-yyyy').format(widget.petModel!.fecnac.toDate());

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        BlocProvider.of<AddPetBloc>(context).add(AddPetGetDataEvent(
          idespecie: widget.petModel!.especie,
          idraza: widget.petModel!.raza,
          idgenero: widget.petModel!.genero,
        ));
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        BlocProvider.of<AddPetBloc>(context).add(AddPetGetDataEvent());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.petModel != null) {
      idgenero = widget.petModel!.genero;
    }
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
              PetModel pet = PetModel(
                color: _colorController.text,
                especie: idespecie,
                nombre: _nombreController.text,
                raza: raza,
                genero: idgenero,
                fecnac: Timestamp.fromDate(
                    DateFormat('dd-MM-yyyy').parse(_fechaController.text)),
                usuario: SPGlobal().id,
              );
              if (widget.petModel == null) {
                BlocProvider.of<AddPetBloc>(context)
                    .add(AddPetCreateEvent(pet: pet, image: image));
              } else {
                pet.id = widget.petModel!.id;
                pet.imagen = widget.petModel!.imagen;
                BlocProvider.of<AddPetBloc>(context).add(AddPetUpdateEvent(
                  pet: pet,
                  image: image,
                  urlImage: widget.petModel!.imagen,
                ));
              }
              BlocListener(
                bloc: BlocProvider.of<AddPetBloc>(context),
                listener: (BuildContext context, AddPetState state) {
                  if (state is AddPetLoadingState) {
                    loadingWidget;
                  } else if (state is AddPetSuccedState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      snackBarSucced(state.message),
                    );
                    Navigator.pop(context);
                  }
                },
                child: BlocBuilder<AddPetBloc, AddPetState>(
                  builder: (BuildContext context, AddPetState state) {
                    if (state is AddPetLoadingState) {
                      return loadingWidget;
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              );
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
                        InkWell(
                          onTap: () {
                            bigImage(context);
                          },
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(lCircularBorder),
                            child: widget.petModel == null
                                ? Image(
                                    image: image != null
                                        ? FileImage(File(image!.path))
                                        : const AssetImage(
                                                AssetData.imageDefaultMascota)
                                            as ImageProvider,
                                    fit: BoxFit.cover,
                                    width: ResponsiveUI.pWidth(context, 0.22),
                                    height: ResponsiveUI.pWidth(context, 0.22),
                                  )
                                : Image(
                                    image: widget.petModel!.imagen!.isEmpty
                                        ? const AssetImage(
                                            AssetData.imageDefaultMascota)
                                        : image == null
                                            ? NetworkImage(
                                                widget.petModel!.imagen!)
                                            : FileImage(File(image!.path))
                                                as ImageProvider,
                                    fit: BoxFit.cover,
                                    width: ResponsiveUI.pWidth(context, 0.22),
                                    height: ResponsiveUI.pWidth(context, 0.22),
                                  ),
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
                            controller: _nombreController,
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
                            controller: _fechaController,
                            icon: Icon(
                              Icons.calendar_month,
                              color: BrandColor.cBlueColor.withOpacity(0.5),
                            ),
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
                                _fechaController.text = formattedDate;
                                setState(() {});
                              } else {
                                _fechaController.text = "";
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                H5(
                  text: "Especie",
                  fontWeight: FontWeight.w500,
                ),
                BlocBuilder<AddPetBloc, AddPetState>(
                  builder: (context, state) {
                    if (state is AddPetInitState ||
                        state is AddPetLoadingState) {
                      return loadingWidget;
                    } else if (state is AddPetGetDataState) {
                      idespecie = state.idespecie!;
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
                          value: state.idespecie!,
                          items: state.especiesRazas
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e.idespecie,
                                  child: Text(e.nombre),
                                ),
                              )
                              .toList(),
                          onChanged: (String? value) {
                            idespecie = value!;
                            context.read<AddPetBloc>().add(
                                  AddPetChangeEspecieEvent(
                                    especiesRazas: state.especiesRazas,
                                    idespecie: idespecie,
                                    idgenero: state.idgenero,
                                  ),
                                );
                          },
                        ),
                      );
                    } else if (state is AddPetChangeEspecieState) {
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
                          value: state.idespecie,
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
                            context.read<AddPetBloc>().add(
                                  AddPetChangeEspecieEvent(
                                    especiesRazas: state.especiesRazas,
                                    idespecie: idespecie,
                                    idgenero: state.idgenero,
                                  ),
                                );
                          },
                        ),
                      );
                    } else if (state is AddPetChangeRazaState) {
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
                          value: state.idespecie,
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
                            context.read<AddPetBloc>().add(
                                  AddPetChangeEspecieEvent(
                                    especiesRazas: state.especiesRazas,
                                    idespecie: idespecie,
                                    idgenero: state.idgenero,
                                  ),
                                );
                          },
                        ),
                      );
                    } else if (state is AddPetChangeGenreState) {
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
                          value: state.idespecie,
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
                            context.read<AddPetBloc>().add(
                                  AddPetChangeEspecieEvent(
                                    especiesRazas: state.especiesRazas,
                                    idespecie: idespecie,
                                    idgenero: state.idgenero,
                                  ),
                                );
                          },
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                H5(
                  text: "Raza",
                  fontWeight: FontWeight.w500,
                ),
                BlocBuilder<AddPetBloc, AddPetState>(
                  builder: (context, state) {
                    if (state is AddPetInitState ||
                        state is AddPetLoadingState) {
                      return loadingWidget;
                    } else if (state is AddPetGetDataState) {
                      raza = state.idraza;
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
                          value: state.idraza,
                          items: state.razas
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            raza = value!;
                            context.read<AddPetBloc>().add(
                                  AddPetChangeRazaEvent(
                                    especiesRazas: state.especiesRazas,
                                    idespecie: idespecie,
                                    razas: state.razas,
                                    idraza: value,
                                    idgenero: state.idgenero,
                                  ),
                                );
                          },
                        ),
                      );
                    } else if (state is AddPetChangeEspecieState) {
                      //return const SizedBox();
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
                          value: state.idraza,
                          items: state.razas
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            raza = value!;
                            context.read<AddPetBloc>().add(
                                  AddPetChangeRazaEvent(
                                    especiesRazas: state.especiesRazas,
                                    idespecie: idespecie,
                                    razas: state.razas,
                                    idraza: value,
                                    idgenero: state.idgenero,
                                  ),
                                );
                          },
                        ),
                      );
                    } else if (state is AddPetChangeRazaState) {
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
                          value: state.idraza,
                          items: state.razas
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            raza = value!;
                            context.read<AddPetBloc>().add(
                                  AddPetChangeRazaEvent(
                                    especiesRazas: state.especiesRazas,
                                    idespecie: idespecie,
                                    razas: state.razas,
                                    idraza: value,
                                    idgenero: state.idgenero,
                                  ),
                                );
                          },
                        ),
                      );
                    } else if (state is AddPetChangeGenreState) {
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
                          value: state.idraza,
                          items: state.razas
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            raza = value!;
                            context.read<AddPetBloc>().add(
                                  AddPetChangeRazaEvent(
                                    especiesRazas: state.especiesRazas,
                                    idespecie: idespecie,
                                    razas: state.razas,
                                    idraza: value,
                                    idgenero: state.idgenero,
                                  ),
                                );
                          },
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                H5(
                  text: "Genero",
                  fontWeight: FontWeight.w500,
                ),
                BlocBuilder<AddPetBloc, AddPetState>(
                  builder: (context, state) {
                    if (state is AddPetInitState ||
                        state is AddPetLoadingState) {
                      return loadingWidget;
                    } else if (state is AddPetGetDataState) {
                      idgenero = state.idgenero;
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
                            context.read<AddPetBloc>().add(
                                  AddPetChangeGenreEvent(
                                    especiesRazas: state.especiesRazas,
                                    idespecie: idespecie,
                                    razas: state.razas,
                                    idraza: state.idraza,
                                    idgenero: value,
                                  ),
                                );
                          },
                        ),
                      );
                    } else if (state is AddPetChangeEspecieState) {
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
                            context.read<AddPetBloc>().add(
                                  AddPetChangeGenreEvent(
                                    especiesRazas: state.especiesRazas,
                                    idespecie: idespecie,
                                    razas: state.razas,
                                    idraza: state.idraza,
                                    idgenero: value,
                                  ),
                                );
                          },
                        ),
                      );
                    } else if (state is AddPetChangeRazaState) {
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
                            context.read<AddPetBloc>().add(
                                  AddPetChangeGenreEvent(
                                    especiesRazas: state.especiesRazas,
                                    idespecie: idespecie,
                                    razas: state.razas,
                                    idraza: state.idraza,
                                    idgenero: value,
                                  ),
                                );
                          },
                        ),
                      );
                    } else if (state is AddPetChangeGenreState) {
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
                          value: state.idgenero,
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
                            context.read<AddPetBloc>().add(
                                  AddPetChangeGenreEvent(
                                    especiesRazas: state.especiesRazas,
                                    idespecie: idespecie,
                                    razas: state.razas,
                                    idraza: state.idraza,
                                    idgenero: value,
                                  ),
                                );
                          },
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                spacing10,
                TextFieldCommonWidget(
                  label: "Color",
                  hintText: "Color",
                  icon: Icon(
                    Icons.color_lens,
                    color: BrandColor.cBlueColor.withOpacity(0.5),
                  ),
                  controller: _colorController,
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
