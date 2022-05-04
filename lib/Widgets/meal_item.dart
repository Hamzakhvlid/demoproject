import 'package:flutter/material.dart';
import 'package:mealapp/Models/meal.dart';
import 'package:mealapp/Screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String ImageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  var removeItem;
  String? get complexityText {
    if (complexity == Complexity.Hard)
      return 'Hard';
    else if (complexity == Complexity.Simple)
      return 'Simple';
    else
      return 'challenging';
  }

  String? get affordabilityText {
    if (affordability == Affordability.Affordable)
      return 'Affordable';
    else if (affordability == Affordability.Luxurious)
      return 'luxurious';
    else
      return 'Pricey';
  }

  void detailScreen(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(MealDetailScreen.routeName, arguments: id)
        .then((value) {
    
     if( value!=null)
      removeItem(value);
    });
  }

  MealItem(
      {this.id = '',
      this.title = '',
      this.ImageUrl = '',
      this.complexity = Complexity.Simple,
      this.duration = 0,
      this.affordability = Affordability.Affordable,
      this.removeItem});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => detailScreen(context)),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  this.ImageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    color: Colors.black54,
                    child: Text(this.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'RobotoCondensed',
                            fontSize: 26),
                        softWrap: true,
                        overflow: TextOverflow.fade),
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Row(children: [
                  Icon(Icons.schedule),
                  SizedBox(
                    width: 6,
                  ),
                  Text('$duration min'),
                ]),
                Row(children: [
                  Icon(Icons.attach_money),
                  SizedBox(
                    width: 6,
                  ),
                  Text(affordabilityText!),
                ]),
                Row(children: [
                  Icon(Icons.work),
                  SizedBox(
                    width: 6,
                  ),
                  Text(complexityText!),
                ])
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
          )
        ]),
      ),
    );
  }
}
