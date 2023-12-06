import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/data/colors.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/data/settings.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/app_routes.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF4559A9),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFDDE1FF),
  onPrimaryContainer: Color(0xFF001454),
  secondary: Color(0xFF5A5D72),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFDFE1F9),
  onSecondaryContainer: Color(0xFF171B2C),
  tertiary: Color(0xFF75546E),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFD7F4),
  onTertiaryContainer: Color(0xFF2C1229),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFEFBFF),
  onBackground: Color(0xFF1B1B1F),
  surface: Color(0xFFFEFBFF),
  onSurface: Color(0xFF1B1B1F),
  surfaceVariant: Color(0xFFE2E1EC),
  onSurfaceVariant: Color(0xFF45464F),
  outline: Color(0xFF767680),
  onInverseSurface: Color(0xFFF2F0F4),
  inverseSurface: Color(0xFF303034),
  inversePrimary: Color(0xFFB8C4FF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF4559A9),
  outlineVariant: Color(0xFFC6C5D0),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFB8C4FF),
  onPrimary: Color(0xFF0F2878),
  primaryContainer: Color(0xFF2C4090),
  onPrimaryContainer: Color(0xFFDDE1FF),
  secondary: Color(0xFFC2C5DD),
  onSecondary: Color(0xFF2C2F42),
  secondaryContainer: Color(0xFF424659),
  onSecondaryContainer: Color(0xFFDFE1F9),
  tertiary: Color(0xFFE4BAD9),
  onTertiary: Color(0xFF43273F),
  tertiaryContainer: Color(0xFF5C3D56),
  onTertiaryContainer: Color(0xFFFFD7F4),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF1B1B1F),
  onBackground: Color(0xFFE4E1E6),
  surface: Color(0xFF1B1B1F),
  onSurface: Color(0xFFE4E1E6),
  surfaceVariant: Color(0xFF45464F),
  onSurfaceVariant: Color(0xFFC6C5D0),
  outline: Color(0xFF90909A),
  onInverseSurface: Color(0xFF1B1B1F),
  inverseSurface: Color(0xFFE4E1E6),
  inversePrimary: Color(0xFF4559A9),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFB8C4FF),
  outlineVariant: Color(0xFF45464F),
  scrim: Color(0xFF000000),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var settings = Settings();
  var _availableMeals = dummyMeals;
  final _favoriteMeals = <Meal>[];

  _filterMeals(Settings settings) {
    this.settings = settings;
    setState(() {
      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;
      }).toList();
    });
  }

  _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal) ? _favoriteMeals.remove(meal) : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        AppRoutes.home: (context) => TabsScreen(favoriteMeals: _favoriteMeals),
        AppRoutes.categoriesMeals: (context) => CategoriesMealsScreen(meals: _availableMeals),
        AppRoutes.mealDetail: (context) => MealDetailScreen(onToggleFavorite: _toggleFavorite, isFavorite: _isFavorite),
        AppRoutes.settings: (context) => SettingsScreen(onSettingsChange: _filterMeals, settings: settings),
      },
    );
  }
}
