import 'package:flutter/material.dart';

class Style {
  static final baseTextStyle = TextStyle(
    fontFamily: 'Poppins',
  );

  static final smallTextStyle = baseTextStyle.copyWith(
    fontSize: 9.0,
  );

  static final commonTextStyle = baseTextStyle.copyWith(
    color: Color(0xFFB6B2DF),
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );

  static final titleTextStyle = baseTextStyle.copyWith(
    color: Colors.white,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );

  static final headerTextStyle = baseTextStyle.copyWith(
    color: Colors.white,
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
  );
}