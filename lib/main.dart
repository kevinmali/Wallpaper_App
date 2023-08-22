import 'package:flutter/material.dart';
import 'Views /Home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    routes: {
      '/': (context) => Home_page(),
    },
  ));
}