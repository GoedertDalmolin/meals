import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/data/colors.dart';
import 'package:meals/models/category.dart';
import 'package:meals/utils/app_routes.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({super.key, required this.category});

  void _selectCategory(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppRoutes.categoriesMeals,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      onTap: () {
        _selectCategory(context);
      },
      child: Card(
        elevation: 5,
        color: ColorsProject.cerulean,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 12),
                  child: Text(
                    category.title,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0, bottom: 12),
                        child: FaIcon(category.icon, color: Colors.white,),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
