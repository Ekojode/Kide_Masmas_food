import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masmas_food/provider/auth_provider.dart';
import 'package:masmas_food/screens/dummy_screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import './global/app_color.dart';

import './screens/auth_screen.dart';
import "./screens/on_boarding_1.dart";
import './screens/on_boarding_2.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<Auth>(
            create: (context) => Auth(),
          )
        ],
        builder: (context, child) {
          return ResponsiveSizer(
            builder: (context, orientation, screenType) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: lightTheme,
                home: const OnBoarding1(),
                routes: {
                  OnBoarding2.routeName: (context) => const OnBoarding2(),
                  AuthScreen.routeName: ((context) => const AuthScreen()),
                  DummyScreen.routeName: ((context) => const DummyScreen())
                },
              );
            },
          );
        });
  }
}
