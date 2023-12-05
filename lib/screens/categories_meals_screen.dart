import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> meals;


  const CategoriesMealsScreen({
    super.key,
    required this.meals,
  });

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeals = meals.where((element) {
      return element.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (context, index) {
            return MealItem(
              meal: categoryMeals[index],
            );
          }),
    );
  }
}
