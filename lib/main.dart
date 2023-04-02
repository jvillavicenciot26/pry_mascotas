import 'package:flutter/material.dart';
import 'package:pry_mascotas/ui/pages/start_page.dart';
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
        scaffoldBackgroundColor: BrandColor.cBlueColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: BrandColor.cBlueColor,
          elevation: 0,
        ),
      ),
      home: StartPage(),
    );
  }
}
