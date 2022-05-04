// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:mealapp/Models/dummy_data.dart';
import 'package:mealapp/Models/meal.dart';
import 'package:mealapp/Widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  List<Meal> _availableMeals;
  CategoryMealScreen(this._availableMeals);
  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  var categorytitle;
  late final List<Meal> categoryMeals;


  @override
  void initState() {
    //..
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    categorytitle = routeArgs['title'];
    // ignore: unused_local_variable
    final categoryId = routeArgs['id'];
    categoryMeals = widget._availableMeals.where((meal) {
      return meal.categories!.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String Id) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == Id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(categorytitle!)),
        body: ListView.builder(
          itemBuilder: (context, index) {
            var c = categoryMeals[index];
            return MealItem(
              id: c.id,
              title: c.title,
              ImageUrl: c.imageUrl,
              complexity: c.complexity!,
              duration: c.duration,
              affordability: c.affordability!,
              removeItem: _removeMeal,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
