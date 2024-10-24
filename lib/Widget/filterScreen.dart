import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_08/providers/filter_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  // bool glutenFree = false;
  // bool lactoseFree = false;
  // bool veganFree = false;
  // bool vegetarian = false;

  // @override
  // void initState() {
  //   Map<Fliter, bool> initFilter = ref.watch(filterProvider);
  //   glutenFree = initFilter[Fliter.glutenFree]!;
  //   lactoseFree = initFilter[Fliter.lactoseFree]!;
  //   veganFree = initFilter[Fliter.vegan]!;
  //   vegetarian = initFilter[Fliter.vgetarian]!;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<Fliter, bool> initFilter = ref.watch(filterProvider);
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
      body: Column(
        children: [
          SwitchListTile(
            value: initFilter[Fliter.glutenFree]!,
            onChanged: (value) {
              ref
                  .read(filterProvider.notifier)
                  .saveFilter(Fliter.glutenFree, value);
            },
            title: const Text('Gluten-Free'),
            subtitle: const Text('Only include Gluten-Free meals'),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          ),
          SwitchListTile(
            value: initFilter[Fliter.lactoseFree]!,
            onChanged: (value) {
              ref
                  .read(filterProvider.notifier)
                  .saveFilter(Fliter.lactoseFree, value);
            },
            title: const Text('Lactose-Free'),
            subtitle: const Text('Only include Lactose-Free meals'),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          ),
          SwitchListTile(
            value: initFilter[Fliter.vegan]!,
            onChanged: (value) {
              ref.read(filterProvider.notifier).saveFilter(Fliter.vegan, value);
            },
            title: const Text('Vegan'),
            subtitle: const Text('Only include Vegan meals'),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          ),
          SwitchListTile(
            value: initFilter[Fliter.vgetarian]!,
            onChanged: (value) {
              ref
                  .read(filterProvider.notifier)
                  .saveFilter(Fliter.vgetarian, value);
            },
            title: const Text('Vegetarian'),
            subtitle: const Text('Only include Vegetarian meals'),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          ),
        ],
      ),
    );
  }
}
