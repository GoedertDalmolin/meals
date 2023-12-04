import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/data/colors.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: ColorsProject().primarySwatchPallet,
          accentColor: ColorsProject.xanthous,
          backgroundColor: ColorsProject.white,
          // cardColor: ColorsProject.darkCyan,
          errorColor: ColorsProject.crimson,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(backgroundColor: ColorsProject.white),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: TextStyle(
                fontSize: 20,
                fontFamily: GoogleFonts.getFont('Roboto Condensed').fontFamily,
              ),
            ),
      ),
      routes: {
        AppRoutes.home: (context) => const TabsScreen(),
        AppRoutes.categoriesMeals: (context) => const CategoriesMealsScreen(),
        AppRoutes.mealDetail: (context) => const MealDetailScreen(),
      },
    ),
  );
}
