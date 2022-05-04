import 'package:flutter/material.dart';
import 'package:mealapp/Screens/catagories_screen.dart';

class CategoreyItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;

  // ignore: use_key_in_widget_constructors
  const CategoreyItem(
      {this.id = "", this.color = Colors.green, this.title = ""});

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CatagoriesScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => selectCategory(context)),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title,
            style: const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 14, 13, 13),
              fontWeight: FontWeight.bold,
              fontFamily: 'Raleway',
            )),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              color.withOpacity(.9),
              Colors.deepPurple
              //list of colors
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
