import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pry_mascotas/ui/general/colors.dart';
import 'package:pry_mascotas/ui/widgets/common_text.dart';
import 'package:pry_mascotas/ui/widgets/common_widget.dart';
import 'package:pry_mascotas/ui/widgets/textfield_common_widget.dart';
import 'package:pry_mascotas/utils/responsive.dart';
import 'package:pry_mascotas/utils/types.dart';

class AddMyPetPage extends StatefulWidget {
  @override
  State<AddMyPetPage> createState() => _AddMyPetPageState();
}

class _AddMyPetPageState extends State<AddMyPetPage> {
  TextEditingController nombreController = TextEditingController();

  TextEditingController fechaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.cWhiteColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
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
            onPressed: () {},
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: ResponsiveUI.pWidth(context, 0.22),
                      height: ResponsiveUI.pWidth(context, 0.22),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: BrandColor.cWhiteColor,
                        border: Border.all(
                          width: 0.5,
                          color: BrandColor.cGreyColor.withOpacity(0.5),
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Center(
                        child: H5(
                          text: "Agrega foto.",
                          color: BrandColor.cGreyColor.withOpacity(0.5),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -5,
                      right: -10,
                      child: IconButton(
                        onPressed: () {},
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

            // spacing10,
            // TextFieldCommonWidget(
            //   hintText: "Edad",
            //   icon: const Icon(
            //     Icons.pets,
            //   ),
            //   type: InputType.dni,
            // ),
            // spacing10,
          ],
        ),
      ),
    );
  }
}
