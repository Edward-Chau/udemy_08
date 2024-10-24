import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_08/model/Model.dart';
import 'package:udemy_08/providers/meals_provider.dart';

enum Fliter { glutenFree, lactoseFree, vegan, vgetarian }

class FilterNotifier extends StateNotifier<Map<Fliter, bool>> {
  FilterNotifier()
      : super({
          Fliter.glutenFree: false,
          Fliter.lactoseFree: false,
          Fliter.vegan: false,
          Fliter.vgetarian: false
        });
  saveFilter(Fliter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filterProvider =
    StateNotifierProvider<FilterNotifier, Map<Fliter, bool>>((ref) {
  return FilterNotifier();
});



final getFilterMealProvider = Provider<List<Meal>>((ref) {
final activeFiter=ref.watch(filterProvider);
final meal=ref.watch(mealsProvider);

  return  meal.where((item) {
      if (activeFiter[Fliter.glutenFree]! && !item.isGlutenFree) {
        return false;
      }
      if (activeFiter[Fliter.lactoseFree]! && !item.isLactoseFree) {
        return false;
      }
      if (activeFiter[Fliter.vegan]! && !item.isVegan) {
        return false;
      }
      if (activeFiter[Fliter.vgetarian]! && !item.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
});