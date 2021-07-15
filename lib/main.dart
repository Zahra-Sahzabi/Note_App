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
        iconTheme: IconThemeData(color: Color(0xff090952)),
        primarySwatch: colorCustom,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 26,
            color: Color(0xff090952),
            fontWeight: FontWeight.w600,
            fontFamily: 'OpenSans'
          ),
          headline6: TextStyle(
              fontSize: 21,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: 'OpenSans'),
          bodyText1: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
              fontFamily: 'OpenSans'),
          headline2: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xff090952)),
          headline3: TextStyle(
              fontSize: 20, color: Color(0xff090952), fontFamily: 'OpenSans'),
          bodyText2: TextStyle(
              color: Colors.white, fontSize: 18, fontFamily: 'OpenSans'),
          subtitle1: TextStyle(
              color: Colors.white70, fontSize: 13, fontFamily: 'OpenSans'),
          headline4: TextStyle(
              fontSize: 20, color: Colors.black, fontFamily: 'OpenSans'),
        ),
      ),
      home: HomePage(),
    );
  }
}
