import 'package:flutter/material.dart';

enum Fliter { glutenFree, lactoseFree, vegan, vgetarian }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilter});
  final Map<Fliter, bool> currentFilter;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool glutenFree = false;
  bool lactoseFree = false;
  bool veganFree = false;
  bool vegetarian = false;

  @override
  void initState() {
    glutenFree = widget.currentFilter[Fliter.glutenFree]!;
    lactoseFree = widget.currentFilter[Fliter.lactoseFree]!;
    veganFree = widget.currentFilter[Fliter.vegan]!;
    vegetarian = widget.currentFilter[Fliter.vgetarian]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MainDrawerBar(
      //   pushFilterScreen: (p0) {
      //     Navigator.pop(context);
      //     if (p0 == 'meals') {
      //       Navigator.push(context, MaterialPageRoute(
      //         builder: (context) {
      //           return const Tabs();
      //         },
      //       ));
      //     }
      //   },
      // ),
      appBar: AppBar(
        title: const Text('Your Filter'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) return;
          Navigator.of(context).pop(
            {
              Fliter.glutenFree: glutenFree,
              Fliter.lactoseFree: lactoseFree,
              Fliter.vegan: veganFree,
              Fliter.vgetarian: vegetarian
            },
          );
        },
        child: Column(
          children: [
            SwitchListTile(
              value: glutenFree,
              onChanged: (value) {
                setState(() {
                  glutenFree = value;
                });
              },
              title: const Text('Gluten-Free'),
              subtitle: const Text('Only include Gluten-Free meals'),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            SwitchListTile(
              value: lactoseFree,
              onChanged: (value) {
                setState(() {
                  lactoseFree = value;
                });
              },
              title: const Text('Lactose-Free'),
              subtitle: const Text('Only include Lactose-Free meals'),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            SwitchListTile(
              value: veganFree,
              onChanged: (value) {
                setState(() {
                  veganFree = value;
                });
              },
              title: const Text('Vegan'),
              subtitle: const Text('Only include Vegan meals'),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            SwitchListTile(
              value: vegetarian,
              onChanged: (value) {
                setState(() {
                  vegetarian = value;
                });
              },
              title: const Text('Vegetarian'),
              subtitle: const Text('Only include Vegetarian meals'),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            ),
          ],
        ),
      ),
    );
  }
}
