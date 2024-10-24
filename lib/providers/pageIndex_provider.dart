import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageIndexNotifier extends StateNotifier<int> {
  PageIndexNotifier() : super(0);

  void pagechage(int newIndex) {
    state = newIndex;
    print(state);
  }
}

final pageIndexProvider = StateNotifierProvider<PageIndexNotifier, int>((ref) {
  return PageIndexNotifier();
});
