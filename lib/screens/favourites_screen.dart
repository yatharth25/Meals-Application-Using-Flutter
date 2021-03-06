import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favoritesMeals;
  FavouritesScreen(this.favoritesMeals);

  @override
  Widget build(BuildContext context) {
    if (favoritesMeals.isEmpty) {
      return Center(
          child: Text('You have no favorites yet - start adding some!'));
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoritesMeals[index].id,
            title: favoritesMeals[index].title,
            imageUrl: favoritesMeals[index].imageUrl,
            duration: favoritesMeals[index].duration,
            affordability: favoritesMeals[index].affordability,
            complexity: favoritesMeals[index].complexity,
          );
        },
        itemCount: favoritesMeals.length,
      );
    }
  }
}
