import 'package:flutter/material.dart';

class MainDrawerBar extends StatelessWidget {
  const MainDrawerBar({super.key, required this.pushFilterScreen});
  final Function(String) pushFilterScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8),
                ],
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.fastfood,
                    size: 48, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 15),
                Text(
                  "Cooking up!",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: Text(
              "Meals",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 24,
                  ),
            ),
            onTap: () {
              pushFilterScreen('meals');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              "Filter",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 24,
                  ),
            ),
            onTap: () {
              pushFilterScreen('filter');
            },
          ),
        ],
      ),
    );
  }
}
