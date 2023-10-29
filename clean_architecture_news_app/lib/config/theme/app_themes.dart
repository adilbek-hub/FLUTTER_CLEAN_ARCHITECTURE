import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.grey,
    fontFamily: 'Mulish',
    useMaterial3: true,
    appBarTheme: appBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.orange),
    titleTextStyle: TextStyle(color: Colors.red, fontSize: 18),
  );
}
