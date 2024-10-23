import 'package:flutter_riverpod/flutter_riverpod.dart';

int number = 0;

class Notifier extends StateNotifier<int> {
  Notifier() : super(number);

  void add() {
    state++; //state?
  }

  void sub() {
    if (state > 0) {
      state--;
    }
  }
}

final countNotifier = StateNotifierProvider<Notifier, int>((ref) {
  return Notifier();
});
