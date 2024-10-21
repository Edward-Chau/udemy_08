import 'package:flutter/material.dart';
import 'package:udemy_08/Screen/mealScreen.dart';
import 'package:udemy_08/data/Categories_data.dart';
import 'package:udemy_08/model/Model.dart';

const double gridSpac = 20;

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({required this.favouriteListKeep, super.key, required this.mealList});
  final void Function(Meal) favouriteListKeep;
  final List<Meal> mealList;
  
  void _selectCategories(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return MealScreen(
            favouriteListKeep: favouriteListKeep,
            appTitle: availableCategories[index].title,
            meals: mealList.where(
              (eachMeal) {
                return eachMeal.categories
                    .contains(availableCategories[index].id);
              },
            ).toList(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: GridView.builder(
        itemCount: availableCategories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: gridSpac,
          mainAxisSpacing: gridSpac,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              _selectCategories(context, index);
            },
            splashColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    availableCategories[index].color.withOpacity(0.5),
                    availableCategories[index].color,
                  ],
                ),
              ),
              child: Text(
                availableCategories[index].title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ),
          );
        },
      ),
    );
  }
}
