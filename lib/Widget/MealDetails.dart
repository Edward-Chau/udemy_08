import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:udemy_08/model/Model.dart';
import 'package:udemy_08/providers/favourite_provider.dart';

class MealDetails extends ConsumerStatefulWidget {
  const MealDetails({required this.mealItem, super.key});
  final Meal mealItem;

  @override
  ConsumerState<MealDetails> createState() => _MealDetailsState();
}

void remove(BuildContext context) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.grey[800],
      duration: const Duration(seconds: 3),
      content: const Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(
              Icons.delete_rounded,
              color: Colors.white,
            ),
          ),
          Text(
            "Keep remove",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    ),
  );
}

void keep(BuildContext context) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.grey[800],
      duration: const Duration(seconds: 3),
      content: const Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(
              Icons.save_alt,
              color: Colors.white,
            ),
          ),
          Text(
            "Keep Added",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    ),
  );
}

class _MealDetailsState extends ConsumerState<MealDetails> {
  @override
  Widget build(BuildContext context) {
    final List<Meal> favoritelist = ref.watch(favouriteMeal);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              final message =
                  ref.read(favouriteMeal.notifier).keepMeals(widget.mealItem);

              if (message) {
                remove(context);
              } else {
                keep(context);
              }
            },
            icon: Icon(
              Icons.favorite,
              color: favoritelist.contains(widget.mealItem)
                  ? Colors.red
                  : Colors.grey,
            ),
          )
        ],
        title: Text(
          widget.mealItem.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                  maxWidth: double.infinity, maxHeight: 500),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: widget.mealItem.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.mealItem.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.orange, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...widget.mealItem.ingredients.map(
              (toElement) {
                return Text(
                  toElement,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.normal),
                );
              },
            ),
            const SizedBox(height: 30),
            Text(
              'Steps',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.orange, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...widget.mealItem.steps.map(
              (toElement) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  child: Text(
                    toElement,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
    ;
  }
}






// class MealDetails extends StatelessWidget {
//   const MealDetails(
//       {required this.favouriteListKeep, required this.mealItem, super.key});

//   final Meal mealItem;
//   final void Function(Meal) favouriteListKeep;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             onPressed: () {


//               favouriteListKeep(mealItem);
//             },
//             icon: Icon(
//               Icons.star,
//               // color: Colors.red,
//             ),
//           )
//         ],
//         title: Text(
//           mealItem.title,
//           maxLines: 1,
//           overflow: TextOverflow.ellipsis,
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             ConstrainedBox(
//               constraints: const BoxConstraints(
//                   maxWidth: double.infinity, maxHeight: 500),
//               child: FadeInImage.memoryNetwork(
//                 placeholder: kTransparentImage,
//                 image: mealItem.imageUrl,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               mealItem.title,
//               style: Theme.of(context)
//                   .textTheme
//                   .titleLarge!
//                   .copyWith(color: Colors.orange, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             ...mealItem.ingredients.map(
//               (toElement) {
//                 return Text(
//                   toElement,
//                   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                       color: Colors.white, fontWeight: FontWeight.normal),
//                 );
//               },
//             ),
//             const SizedBox(height: 30),
//             Text(
//               'Steps',
//               style: Theme.of(context)
//                   .textTheme
//                   .titleLarge!
//                   .copyWith(color: Colors.orange, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             ...mealItem.steps.map(
//               (toElement) {
//                 return Padding(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
//                   child: Text(
//                     toElement,
//                     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                         color: Colors.white, fontWeight: FontWeight.normal),
//                     textAlign: TextAlign.center,
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
