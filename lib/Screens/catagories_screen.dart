import 'package:flutter/material.dart';
import 'package:mealapp/Models/dummy_data.dart';
import '../../Widgets/category_item.dart';

// ignore: use_key_in_widget_constructors
class CatagoriesScreen extends StatelessWidget {
  static String routeName = '/CategoryMeal';

  @override
  Widget build(BuildContext context) {
    return  GridView(
          padding: const EdgeInsets.all(25),
          children: DUMMY_CATEGORIES
              .map((e) => CategoreyItem(color: e.color, title: e.title,id: e.id))
              .toList(),

          // ignore: prefer_const_constructors
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
          ),
        );
  }
}
