import 'package:flutter/material.dart';
import 'package:pry_mascotas/pages/start_page.dart';
import 'package:pry_mascotas/ui/general/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Misión Patitas",
      theme: ThemeData(
        scaffoldBackgroundColor: cBlueColor,
      ),
      home: StartPage(),
    );
  }
}
