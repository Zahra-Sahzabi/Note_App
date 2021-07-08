import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

Map<int, Color> color = {
  50: Color.fromRGBO(132, 154, 227, .1),
  100: Color.fromRGBO(132, 154, 227, .2),
  200: Color.fromRGBO(132, 154, 227, .3),
  300: Color.fromRGBO(132, 154, 227, .4),
  400: Color.fromRGBO(132, 154, 227, .5),
  500: Color.fromRGBO(132, 154, 227, .6),
  600: Color.fromRGBO(132, 154, 227, .7),
  700: Color.fromRGBO(132, 154, 227, .8),
  800: Color.fromRGBO(132, 154, 227, .9),
  900: Color.fromRGBO(132, 154, 227, 1),
};
MaterialColor colorCustom = MaterialColor(0xFF849ae3, color);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: colorCustom,
      ),
      home: HomePage(),
    );
  }
}
