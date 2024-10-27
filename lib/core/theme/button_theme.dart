import 'package:flutter/material.dart';
import 'package:flutter_fakestoreapi/core/styles/styles.dart';

ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(defaultPadding),
    backgroundColor: ResColor.primary,
    foregroundColor: Colors.white,
    minimumSize:  Size(88, 36.h),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius*0.75)),
    ),
  ),
);