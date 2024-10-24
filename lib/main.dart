import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udemy_08/Screen/TabsScreen.dart';
import 'package:udemy_08/Widget/filterScreen.dart';


void main() {
  runApp(ProviderScope(child: App()));
}

class App extends StatelessWidget {
  App({super.key});

  final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 131, 57, 0),
    ),
    textTheme: GoogleFonts.latoTextTheme(),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: {'sss':((context){return CategoriesScreen(pushFilterScreen: pushFilterScreen, mealList: mealList)})},
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const Scaffold(
        // body: MyWidget(),
        body: Tabs(),
      ),
    routes:{ 'filterScreen':((context){return const FilterScreen();})});
  }
}
