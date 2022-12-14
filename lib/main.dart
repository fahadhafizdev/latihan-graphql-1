import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_graphql_1/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Belajar Graphql',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
