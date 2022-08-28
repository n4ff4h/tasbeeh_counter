import 'package:flutter/material.dart';

// Colors
const primaryLightColor = Color(0xFF89ABAA);
const primaryColor = Color(0xFF6A8584);
const primaryDarker = Color(0xFF566B6A);
const secondaryColor = Color(0xFFFFCB42);
const scaffoldBackgroundColor = primaryColor;
const tasbeehCounterColor = Color(0xFF4B5E5E);
const iconColor = tasbeehCounterColor;

// Sizes
const double iconSize = 32;
const double iconButtonSize = 10;
const double counterButtonSize = 65;
const double outerTasbeehCounterSvgSize = 410;
const double innerTasbeehCounterSvgSize = 380;

Icon icon(IconData icon) {
  return Icon(
    icon,
    color: iconColor,
    size: iconSize,
  );
}

const inputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(
      style: BorderStyle.solid,
      color: Colors.white,
    ),
  ),
);

const dialogButtonTextStyle = TextStyle(
  fontSize: 16,
);
