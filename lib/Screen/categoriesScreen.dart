import 'package:flutter/material.dart';
import 'package:udemy_08/Widget/DrawerBar.dart';
import 'package:udemy_08/Widget/categoriesItem.dart';
import 'package:udemy_08/model/Model.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.mealList});

  final List<Meal> mealList;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

// class _CategoriesScreenState extends State<CategoriesScreen>
//     with TickerProviderStateMixin {
//   // AnimationController animationController= AnimationController(vsync: );
//   late AnimationController animation01;
//   @override
//   void initState() {
//     animation01 = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 3),
//       lowerBound: 0,
//       upperBound: 1,
//     );
//     animation01.forward();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     animation01.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: const MainDrawerBar(),
//       appBar: AppBar(
//         title: const Text("Categories"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: AnimatedBuilder(
//               animation: animation01,
//               child: CategoriesItem(mealList: widget.mealList),
//               builder: (context, child) {
//                 return Padding(
//                   padding: EdgeInsets.only(top: 100 - animation01.value * 100),
//                   child: child,
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class _CategoriesScreenState extends State<CategoriesScreen> {
  // AnimationController animationController= AnimationController(vsync: );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawerBar(),
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: Column(
        children: [
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(seconds: 3),
              transitionBuilder: (child, animation) {
                return AnimatedSlide(
                    offset: Offset(0, 0), duration: Duration(seconds: 3),child: child,);
              },
              child: CategoriesItem(mealList: widget.mealList),
            ),
          ),
        ],
      ),
    );
  }
}
