import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

import '../models/category_model.dart';
import '../models/meal_model.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });


  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, CategoryModel category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children:
          // for(final category in availableCategories)
          //   CategoryGridItem(category: category)
          availableCategories
              .map((category) => CategoryGridItem(
                    category: category,
                    onSelectCategory: () {
                      _selectCategory(context, category);
                    },
                  ))
              .toList(),
    );
  }
}
