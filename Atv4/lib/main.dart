import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'pages/login.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => MyApp(), 
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(161, 41, 17, 221),
          secondary: const Color.fromARGB(255, 7, 135, 255)
        ),
      ),
      home: LoginPage() 
    );
  }
}
