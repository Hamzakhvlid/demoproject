import 'package:flutter/material.dart';
import 'package:mealapp/Screens/fav_meal_screen.dart';
import 'package:mealapp/Widgets/main_drawer.dart';
import 'catagories_screen.dart';

var _pages = [CatagoriesScreen(),FavouritesScreen()];

class TabScreen extends StatefulWidget {
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _pageIndex = 0;

  void _bottomNavigation(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meal App'),
      ),
      drawer: MainDrawer(),
      body: _pages[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        type: BottomNavigationBarType.shifting,
        currentIndex: _pageIndex,
        onTap: _bottomNavigation,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'categroies',
            backgroundColor: Theme.of(context).primaryColor
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'favourites',
            backgroundColor: Theme.of(context).primaryColor
          )
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
