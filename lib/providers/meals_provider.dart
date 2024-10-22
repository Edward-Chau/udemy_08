import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_08/data/Categories_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});


