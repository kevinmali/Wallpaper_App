import 'package:flutter/material.dart';
import 'app/Screen/Home_screen/views/Home_page.dart';
import 'app/Screen/Wall_Paper_Screen/Wall_paper.dart';

void main() {
  runApp(MaterialApp(
    title: "Wallpaper",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
    ),
    routes: {
      '/': (context) => Home_page(),
      'detils': (context) => detils(),
    },
  ));
}
