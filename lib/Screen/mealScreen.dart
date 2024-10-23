import 'package:flutter/material.dart';
import 'package:udemy_08/Widget/mealItem.dart';
import 'package:udemy_08/model/Model.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({required this.appTitle, required this.meals, super.key});
  final String appTitle;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appTitle)),
      body: meals.isEmpty
          ? Center(
              child: Text(
                "Un oh, can\"t find any meal...",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
            )
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: meals.length,
              itemBuilder: (ctx, index) {
                return MealItem(
                  mealItem: meals[index],
                );
              },
            ),
    );
  }
}
