import 'package:flutter/material.dart';
import 'package:meals/screens/category_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ),
      ),
      home: const CategoriesScreen(),
    ),
  );
}
