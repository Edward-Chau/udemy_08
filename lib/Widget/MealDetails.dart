import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:udemy_08/Screen/TabsScreen.dart';
import 'package:udemy_08/model/Model.dart';

class MealDetails extends StatefulWidget {
  const MealDetails(
      {required this.favouriteListKeep, required this.mealItem, super.key});
  final Meal mealItem;
  final void Function(Meal) favouriteListKeep;
  @override
  State<MealDetails> createState() => _MealDetailsState();
}




class _MealDetailsState extends State<MealDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {setState(() {
               widget.favouriteListKeep(widget.mealItem);
            });
             
            },
            icon: Icon(
              Icons.favorite,
              color: favouriteList.contains(widget.mealItem)
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
