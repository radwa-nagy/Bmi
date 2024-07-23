import 'package:bmi_/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI APP",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        canvasColor: Colors.black,
        primarySwatch: Colors.lightGreen,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      home: const Home(),
    );
  }
}
