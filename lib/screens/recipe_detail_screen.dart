import 'package:flutter/material.dart';
import '../dummy_data.dart';

class RecipeDetailScreen extends StatelessWidget {
  static const routeName = '/recipe';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          // ignore: deprecated_member_use
          style: Theme.of(context).textTheme.title,
        ));
  }

  Widget buildcontainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  Widget build(BuildContext context) {
    final recipeId = ModalRoute.of(context)!.settings.arguments as String?;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == recipeId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          buildSectionTitle(context, 'Ingredients'),
          buildcontainer(
            ListView.builder(
              itemCount: selectedMeal.ingredients.length,
              itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(selectedMeal.ingredients[index]),
                  )),
            ),
          ),
          buildSectionTitle(context, 'Steps'),
          buildcontainer(
            ListView.builder(
              itemCount: selectedMeal.steps.length,
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${(index + 1)}'),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  Divider(),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
