import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_08/providers/count_provider.dart';

class MyWidget extends ConsumerWidget {
  //why stateless is okay?
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numbercount = ref.watch(countNotifier);

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            numbercount.toString(),
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          ElevatedButton(
              onPressed: () {
                ref.read(countNotifier.notifier).add();
              },
              child: const Text('add')),ElevatedButton(
              onPressed: () {
                ref.read(countNotifier.notifier).sub();
              },
              child: const Text('sub')),
        ],
      ),
    );
  }
}