import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/data/colors.dart';
import 'package:meals/screens/category_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: ColorsProject().primarySwatchPallet,
          accentColor: ColorsProject.xanthous,
          backgroundColor: ColorsProject.white,
          cardColor: ColorsProject.darkCyan,
          errorColor: ColorsProject.crimson,
          brightness: Brightness.light,
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: TextStyle(
            fontSize: 20,
            fontFamily: GoogleFonts.getFont('Roboto Condensed').fontFamily,
          )
        ),
      ),
      home: const CategoriesScreen(),
    ),
  );
}
