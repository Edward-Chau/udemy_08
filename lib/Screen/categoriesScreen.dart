import 'package:flutter/material.dart';
import 'package:udemy_08/Widget/DrawerBar.dart';
import 'package:udemy_08/Widget/categoriesItem.dart';
import 'package:udemy_08/model/Model.dart';
import 'package:url_launcher/url_launcher.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({ super.key, required this.mealList});


    final List<Meal> mealList;
  @override
  Widget build(BuildContext context) {




    return Scaffold(
      drawer:  const MainDrawerBar(),
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: Column(
        children: [
          // InkWell(
          //   onTap: () async {
          //     await launchUrl(
          //         Uri.parse("https://www.instagram.com/niki._.cos/"));
          //   },
          //   child: const Text(
          //     "niki ig",
          //     style: TextStyle(color: Colors.white),
          //   ),
          // ),
          Expanded(
            child: CategoriesItem(mealList: mealList,
        
            ),
          ),
        ],
      ),
    );
  }
}
