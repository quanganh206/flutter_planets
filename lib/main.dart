import 'package:flutter/material.dart';
import 'package:planets/ui/home/HomePage.dart';
import 'package:planets/ui/detail/DetailPage.dart';

void main() {
  // Routes.initRoutes();
  runApp(
    MaterialApp(
      title: 'Planets',
      home: HomePage(),
      // routes: <String, WidgetBuilder> {
      //   '/detail': (_) => DetailPage(),
      // },
    ),
  );
}
