import 'package:flutter/material.dart';
import 'package:flutter_lab/core/home/presentation/home_page.dart';
import 'package:flutter_lab/experiments/scroll-physics/pages/always_scrollable_scroll_physics_ex.dart';
import 'package:flutter_lab/experiments/scroll-physics/scroll_physics_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Experiments',
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark(),
      routes: <String, WidgetBuilder>{
        ScrollPhysicsScreen.routeName: (context) => const ScrollPhysicsScreen(),
        AlwaysScrollableScrollPhysicsEx.routeName: (context) =>
            const AlwaysScrollableScrollPhysicsEx(),
      },
      home: const HomePage(),
    );
  }
}
