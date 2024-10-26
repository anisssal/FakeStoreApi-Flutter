import 'package:flutter/material.dart';
import 'package:flutter_fakestoreapi/core/styles/styles.dart';
import 'package:flutter_fakestoreapi/core/theme/input_decoration_theme.dart';

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: ResColor.primary,
  foregroundColor: Colors.white,
  minimumSize:  Size(88, 36.h),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
  ),
);

final appTheme = ThemeData(
    fontFamily: 'Roboto',
    primaryColor: ResColor.primary,
    primarySwatch: primaryMaterialColor,
    colorScheme: ColorScheme.fromSeed(seedColor: ResColor.primary, background: Colors.white),
    elevatedButtonTheme:  ElevatedButtonThemeData(style: raisedButtonStyle),
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
