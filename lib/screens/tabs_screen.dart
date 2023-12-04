
import 'package:flutter/material.dart';
import 'package:meals/screens/category_screen.dart';
import 'package:meals/screens/favorite_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Vamos cozinhar'),
        bottom: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.category_outlined), text: 'Categorias',),
            Tab(icon: Icon(Icons.star_border), text: 'Favoritos',),
          ],

        ),
      ),
      body: const TabBarView(
        children: [
          CategoriesScreen(),
          FavoriteScreen(),
        ],
      ),
    ));
  }
}
