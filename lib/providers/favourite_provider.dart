import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_08/model/Model.dart';

class FavouriteNotifire extends StateNotifier<List<Meal>> {
  FavouriteNotifire() : super([]); //?

  bool keepMeals(Meal meals) {
    //?state
    if (state.contains(meals)) {
      state = state.where(
        (element) {
          return element.id != meals.id;
        },
      ).toList();
      return true;
    } else {
      state = [...state, meals];
      return false;
    }
  }

  // bool listContains(Meal item) {
  //   if (state.contains(item)) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
  //
  //read& watch都會改變?
}

final favouriteMeal = StateNotifierProvider<FavouriteNotifire, List<Meal>>(
  //?
  (ref) {
    return FavouriteNotifire();
  },
);
