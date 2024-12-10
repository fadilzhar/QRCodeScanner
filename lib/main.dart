import 'package:flutter/material.dart';
import 'package:qr_code_generator/ui/home.dart';
import 'package:qr_code_generator/ui/qr_generator_screen.dart';
import 'package:qr_code_generator/ui/qr_scanner_screen.dart';
import 'package:qr_code_generator/ui/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Manrope',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
     initialRoute: '/',
     routes: {
      '/': (context) => const SplashScreen(),
      '/home': (context) => const Home(),
      '/create': (context) => const QrGeneratorScreen(),
      '/scan': (context) => const QrScannerScreen(),
     },
    );
  }
}
