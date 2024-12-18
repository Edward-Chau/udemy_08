import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_08/Screen/categoriesScreen.dart';
import 'package:udemy_08/Screen/mealScreen.dart';
import 'package:udemy_08/Widget/filterScreen.dart';
import 'package:udemy_08/data/Categories_data.dart';
import 'package:udemy_08/model/Model.dart';
import 'package:udemy_08/providers/favourite_provider.dart';
import 'package:udemy_08/providers/filter_provider.dart';
import 'package:udemy_08/providers/meals_provider.dart';
import 'package:udemy_08/providers/pageIndex_provider.dart';

class Tabs extends ConsumerStatefulWidget {
  const Tabs({super.key});

  @override
  ConsumerState<Tabs> createState() => _TabsState();
}

List<Meal> favouriteList = [];
// Map<Fliter, bool> selectedFliter = {
//   Fliter.glutenFree: false,
//   Fliter.lactoseFree: false,
//   Fliter.vegan: false,
//   Fliter.vgetarian: false
// };

// void favouriteListKeep(Meal mealItem) {
//   final isExisting = favouriteList.contains(mealItem);
//   if (isExisting == true) {
//     favouriteList.remove(mealItem);
//   } else {
//     favouriteList.add(mealItem);
//   }
// }

class _TabsState extends ConsumerState<Tabs> {
  // void pushFilterScreen(String identifier) async {
  //   if (identifier == 'filter') {
  //     Navigator.pop(context);

  //     final result = await Navigator.push<Map<Fliter, bool>>(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) {
  //           return FilterScreen(
  //             currentFilter: selectedFliter,
  //           );
  //         },
  //       ),
  //     );
  //     setState(() {
  //       selectedFliter = result ??
  //           {
  //             Fliter.glutenFree: false,
  //             Fliter.lactoseFree: false,
  //             Fliter.vegan: false,
  //             Fliter.vgetarian: false
  //           };
  //     });
  //   }
  // }

  // void favouriteListKeep(Meal mealItem) {
  //   final isExisting = favouriteList.contains(mealItem);
  //   if (isExisting == true) {
  //     setState(
  //       () {
  //         favouriteList.remove(mealItem);
  //       },
  //     );
  //     ScaffoldMessenger.of(context).clearSnackBars();
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         backgroundColor: Colors.grey[800],
  //         duration: const Duration(seconds: 3),
  //         content: const Row(
  //           children: [
  //             Padding(
  //               padding: EdgeInsets.only(right: 12),
  //               child: Icon(
  //                 Icons.delete_rounded,
  //                 color: Colors.white,
  //               ),
  //             ),
  //             Text(
  //               "Keep remove",
  //               style: TextStyle(color: Colors.white),
  //             )
  //           ],
  //         ),
  //       ),
  //     );
  //   } else {
  //     setState(() {
  //       favouriteList.add(mealItem);
  //     });
  //     ScaffoldMessenger.of(context).clearSnackBars();
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         backgroundColor: Colors.grey[800],
  //         duration: const Duration(seconds: 3),
  //         content: const Row(
  //           children: [
  //             Padding(
  //               padding: EdgeInsets.only(right: 12),
  //               child: Icon(
  //                 Icons.save_alt,
  //                 color: Colors.white,
  //               ),
  //             ),
  //             Text(
  //               "Keep Added",
  //               style: TextStyle(color: Colors.white),
  //             )
  //           ],
  //         ),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final List<Meal> filterMeals = ref.watch(getFilterMealProvider);
    // List<Meal> mealList =dummyMeals;
    List<Meal> mealList = filterMeals;

    final List<Meal> favouriteListFormProvider = ref.watch(favouriteMeal);
    List<Widget> showScreen = [
      CategoriesScreen(
        mealList: mealList,
      ),
      MealScreen(
        meals: favouriteListFormProvider,
        appTitle: "Favourite",
      ),
    ];
    final pageIndex = ref.watch(pageIndexProvider);
    return Scaffold(
      body: showScreen[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        selectedItemColor: Colors.blue,
        onTap: (indexValue) {
          ref.read(pageIndexProvider.notifier).pagechage(indexValue);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favourite",
          ),
        ],
      ),
    );
  }
}
