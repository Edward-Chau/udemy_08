import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:udemy_08/Widget/MealDetails.dart';
import 'package:udemy_08/Widget/meal_item_trait.dart';
import 'package:udemy_08/model/Model.dart';

class MealItem extends StatelessWidget {
  const MealItem({required this.favouriteListKeep,required this.mealItem, super.key});
  final Meal mealItem;
final void Function(Meal) favouriteListKeep;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return MealDetails(mealItem: mealItem,favouriteListKeep: favouriteListKeep,);
              },
            ),
          );
        },
        child: Stack(
          children: [
            FadeInImage.memoryNetwork(
              fadeInDuration: const Duration(seconds: 1),
              placeholder: kTransparentImage,
              image: mealItem.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      mealItem.title,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: '${mealItem.duration} mins',
                        ),
                        const SizedBox(width: 12),
                        MealItemTrait(
                          icon: Icons.work,
                          label: mealItem.complexity.name[0].toUpperCase() +
                              mealItem.complexity.name.substring(1),
                        ),
                        const SizedBox(width: 12),
                        MealItemTrait(
                          icon: Icons.attach_money,
                          label: mealItem.affordability.name[0].toUpperCase() +
                              mealItem.affordability.name.substring(1),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
