import 'package:flutter/material.dart';
import 'package:flutter_fakestoreapi/core/styles/styles.dart';
import 'package:flutter_fakestoreapi/core/theme/button_theme.dart';
import 'package:flutter_fakestoreapi/core/theme/input_decoration_theme.dart';

final appTheme = ThemeData(
    fontFamily: 'Roboto',
    primaryColor: ResColor.primary,
    primarySwatch: primaryMaterialColor,
    colorScheme: ColorScheme.fromSeed(seedColor: ResColor.primary, background: Colors.white),
    elevatedButtonTheme:  elevatedButtonThemeData,
    cardTheme: const CardTheme(),
    inputDecorationTheme: lightInputDecorationTheme,
    bottomSheetTheme: const BottomSheetThemeData(
      clipBehavior: Clip.antiAlias,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
    )
);
