import './screens/recipe_detail_screen.dart';

import './screens/categories_screen.dart';
import './screens/meals_screen.dart';
import 'package:flutter/material.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              // ignore: deprecated_member_use
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              // ignore: deprecated_member_use
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              // ignore: deprecated_member_use
              title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      routes: {
        '/': (ctx) => TabScreen(),
        MealsScreen.routeName: (ctx) => MealsScreen(),
        RecipeDetailScreen.routeName: (ctx) => RecipeDetailScreen(),
        FlitersScreen.routeName: (ctx) => FlitersScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
