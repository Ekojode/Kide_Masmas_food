import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masmas_food/provider/auth_provider.dart';
import 'package:masmas_food/screens/biodata_screen.dart';
import 'package:masmas_food/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import './global/app_color.dart';

import './screens/auth_screen.dart';
import "./screens/on_boarding_1.dart";
import './screens/on_boarding_2.dart';
import './screens/profile_photo_screen.dart';
import './screens/signup_success_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<Auth>(create: (context) => Auth())],
      builder: (context, child) {
        return ResponsiveSizer(
          builder: (context, orientation, screenType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Masmas Food Delivery',
              theme: lightTheme,
              darkTheme: darkTheme,
              home: const AuthScreen(),
              routes: {
                OnBoarding1.routeName: (context) => const OnBoarding1(),
                OnBoarding2.routeName: (context) => const OnBoarding2(),
                AuthScreen.routeName: (context) => const AuthScreen(),
                BioDataScreen.routeName: (context) => const BioDataScreen(),
                HomeScreen.routeName: (context) => const HomeScreen(),
                ProfilePhoto.routeName: (ctx) => const ProfilePhoto(),
                SignUpSuccess.routeName: ((context) => const SignUpSuccess()),
              },
            );
          },
        );
      },
    );
  }
}
