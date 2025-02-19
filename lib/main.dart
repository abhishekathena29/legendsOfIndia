import 'package:flutter/material.dart';
import 'package:legends_of_india/firstpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Legends of India",
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      home: IndiaMapPage(),
    );
  }
}
