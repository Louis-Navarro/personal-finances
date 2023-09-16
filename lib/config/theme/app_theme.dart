import 'package:flutter/material.dart';
import 'package:personal_finance/core/util/constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme(),
    cardTheme: cardTheme(),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0.0,
    iconTheme: IconThemeData(color: Color(0xFF8B8B8B)),
    titleTextStyle: TextStyle(color: Color(0xFF8B8B8B), fontSize: 24),
  );
}

CardTheme cardTheme() {
  return const CardTheme(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(borderRadius),
      side: BorderSide(color: borderColor),
    ),
  );
}

const chartAxisTitleTheme = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);
