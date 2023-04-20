import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:pry_mascotas/provider/user_provider.dart';
import 'package:pry_mascotas/services/local/sp_global.dart';
import 'package:pry_mascotas/ui/pages/home_page.dart';
import 'package:pry_mascotas/ui/pages/start_page.dart';
import 'package:pry_mascotas/ui/general/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SPGlobal prefs = SPGlobal();
  await prefs.initSharedPreferences();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        title: "Misión Patitas",
        theme: ThemeData(
          scaffoldBackgroundColor: BrandColor.cBlueColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: BrandColor.cBlueColor,
            elevation: 0,
          ),
        ),
        home: PreInit(),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
        ],
      ),
    );
  }
}

class PreInit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SPGlobal().isLogin ? HomePage() : StartPage();
  }
}
