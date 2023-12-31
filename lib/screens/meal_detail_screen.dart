import 'package:flutter/material.dart';
import 'package:meals/data/colors.dart';
import 'package:meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final Function(Meal) onToggleFavorite;
  final bool Function(Meal) isFavorite;

  const MealDetailScreen({
    super.key,
    required this.onToggleFavorite,
    required this.isFavorite,
  });

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget _createSectionContainer(BuildContext context, Widget child) {
    return Container(
      width: 300,
      height: 300,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        // color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _createSectionTitle(context, 'Ingredientes'),
            _createSectionContainer(
              context,
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    color: ColorsProject.cerulean,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                      child: Text(
                        meal.ingredients[index],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            _createSectionTitle(
              context,
              'Passos',
            ),
            _createSectionContainer(
              context,
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    color: ColorsProject.cerulean,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: ColorsProject.white,
                        child: Text((index + 1).toString()),
                      ),
                      title: Text(
                        meal.steps[index],
                        style: const TextStyle(color: ColorsProject.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsProject.cerulean,
        child: Icon(isFavorite(meal) ? Icons.star : Icons.star_border, color: Colors.white,),
        onPressed: () {
          onToggleFavorite(meal);
        },
      ),
    );
  }
}
