import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/data/colors.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/category_screen.dart';
import 'package:meals/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen({super.key, required this.favoriteMeals});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  var _screens = <Map<String, Object>>[];

  @override
  initState() {
    super.initState();

    _screens = [
      {
        'title': 'Lista de Categorias',
        'screen': const CategoriesScreen(),
      },
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(
          favoriteMeals: widget.favoriteMeals,
        ),
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // elevation: 0,
        title: Text(_screens[_selectedScreenIndex]['title'] as String, style: GoogleFonts.robotoCondensed(
          // fontWeight: FontWeight.w900
          // color:
        ),),
      ),
      drawer: const MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        currentIndex: _selectedScreenIndex,
        fixedColor: ColorsProject.cerulean,
        items:  const [
          BottomNavigationBarItem(icon: Icon(Icons.category_outlined), label: 'Categorias'),
          BottomNavigationBarItem(icon: Icon(Icons.star_border), label: 'Favoritos'),
        ],
      ),
    );
  }
}
