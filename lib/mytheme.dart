import 'package:flutter/material.dart';

class MyTheme {
  static Color primarylight = Color(0xffB7935F);

  static Color borderlight = Color(0xffB7935F);

  static Color blackcolor = Color(0xff242424);

  static Color whitecolor = Colors.white;

  static Color primarydark = Color(0xff101627);

  static Color borderdark = Color(0xffFACC1D);

  static ThemeData darkmode = ThemeData(
      primaryColor: primarydark,
      dividerColor: borderdark,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: whitecolor)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: borderdark,
          unselectedItemColor: whitecolor,
          showUnselectedLabels: true,
          selectedIconTheme: IconThemeData(
            size: 30,
          )),
      textTheme: TextTheme(
          labelLarge: TextStyle(
              color: whitecolor, fontSize: 30, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: whitecolor,
          ),
          labelMedium: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: whitecolor)));

  static ThemeData lightmode = ThemeData(
      primaryColor: primarylight,
      dividerColor: borderlight,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: blackcolor)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          showUnselectedLabels: true,
          selectedIconTheme: IconThemeData(
            size: 30,
          )),
      textTheme: TextTheme(
          labelLarge: TextStyle(
              color: blackcolor, fontSize: 30, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: blackcolor,
          ),
          labelMedium: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: blackcolor)));
}
