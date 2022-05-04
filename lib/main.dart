import 'package:flutter/material.dart';
import 'package:mealapp/Models/dummy_data.dart';
import 'package:mealapp/Models/meal.dart';
import 'package:mealapp/Screens/filters_screen.dart';
import 'package:mealapp/Screens/meal_detail_screen.dart';
import 'package:mealapp/Screens/tabs_screen.dart';
import 'Screens/catagories_screen.dart';
import 'Screens/category_meal_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
   
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  void _setFilterData(Map<String, bool> setFilterData) {
    
    setState(() {
      _filters = setFilterData;
      _availableMeals = DUMMY_MEALS.where((c) {
        if ((_filters['gluten'])! && (c.isGlutenFree)!) {
          return false;
        }
        if ((_filters['lactose'])! && (c.isLactoseFree)!) {
          return false;
        }
        if ((_filters['vegan'])! && (c.isVegan)!) {
          return false;
        }
        if ((_filters['vegetarian'])! && (c.isVegetarian)!) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  List<Meal> _availableMeals = DUMMY_MEALS;
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clean Code',
      home: AnimatedSplashScreen(
          duration: 3000,
          splash: Icons.dining,
          nextScreen: TabScreen(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          backgroundColor: Colors.pinkAccent),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.pink,
        // ignore: deprecated_member_use
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),

        fontFamily: 'Raleway',
      ),
      routes: {
        CatagoriesScreen.routeName: (context) =>
            CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilterData),
      },
    );
  }
}
