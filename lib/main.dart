import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/outils/user_simple_preference.dart';
import 'package:e_commerce_app/routes.dart';
import 'package:e_commerce_app/screens/splash/splash_screen.dart';
import 'package:e_commerce_app/theme.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserSimplePreference.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nwacudo',
      color: KPrimaryColor,
      theme: theme(),
      // home: SplashScreen(),

      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
