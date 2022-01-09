import 'package:flutter/material.dart';

abstract class MyTheme {
  static final theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff121212),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white)),
  );
}
