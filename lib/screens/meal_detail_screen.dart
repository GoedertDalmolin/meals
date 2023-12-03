import 'package:flutter/material.dart';
import 'package:meals/data/colors.dart';
import 'package:meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Ingredientes',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Container(
            width: 300,
            height: 300,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                border: Border.all(
                    // color: Theme.of(context).colorScheme.secondary
                    ),
                borderRadius: BorderRadius.circular(15)),
            child: ListView.builder(
              itemCount: meal.ingredients.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  color: ColorsProject.darkCyan,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                    child: Text(
                      meal.ingredients[index],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
