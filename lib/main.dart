import 'package:facebook/screens/home.dart';
import 'package:facebook/utils/palettes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Facebook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: PalettesColors.scaffold,
      ),
      home: const Home(),
    ),
  );
}
