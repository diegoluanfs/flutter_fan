import 'package:flutter/material.dart';
import 'package:flutter_fan/presentation/pages/2-fan/fan2_page.dart';
import 'package:flutter_fan/presentation/pages/3-fan/fan3_page.dart';
import 'package:flutter_fan/presentation/pages/4-fan/fan4_page.dart';
import 'package:flutter_fan/presentation/pages/5-fan/fan5_page.dart';
import 'package:flutter_fan/presentation/pages/6-fan/fan6_page.dart';
import 'package:flutter_fan/presentation/pages/8-fan/fan8_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_fan/presentation/pages/splash/splash_page.dart';
import 'package:flutter_fan/presentation/pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Modelo Base Flutter',
          theme: ThemeData(useMaterial3: true),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),
          themeMode: ThemeMode.system,
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashPage(),
            '/splash': (context) => const SplashPage(),
            '/home': (_) => const HomePage(),
            '/fan2': (_) => const Fan2Page(),
            '/fan3': (_) => const Fan3Page(),
            '/fan4': (_) => const Fan4Page(),
            '/fan5': (_) => const Fan5Page(),
            '/fan6': (_) => const Fan6Page(),
            '/fan8': (_) => const Fan8Page(),
          },
        );
      },
    );
  }
}
