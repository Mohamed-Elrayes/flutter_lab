import 'package:flutter/material.dart';
import 'package:flutter_lab/core/home/presentation/home_page.dart';
import 'package:flutter_lab/experiments/animations/implicit_animation_screen.dart';
import 'package:flutter_lab/experiments/animations/main_animations_screen.dart';
import 'package:flutter_lab/experiments/multiple-page-form/multiple_page_form_screen.dart';
import 'package:flutter_lab/experiments/scroll-physics/pages/always_scrollable_scroll_physics_ex.dart';
import 'package:flutter_lab/experiments/scroll-physics/scroll_physics_screen.dart';
import 'package:flutter_lab/experiments/state_restoration/state_restoration_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'root',
      title: 'Flutter Experiments',
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark(),
      routes: <String, WidgetBuilder>{
        ScrollPhysicsScreen.routeName: (context) => const ScrollPhysicsScreen(),
        AlwaysScrollableScrollPhysicsEx.routeName: (context) =>
            const AlwaysScrollableScrollPhysicsEx(),
        MultiplePageFormScreen.routeName: (context) => const MultiplePageFormScreen(),
        MainAnimationScreen.routeName: (context) => const MainAnimationScreen(),
        ImplicitAnimationScreen.routeName: (context) => const ImplicitAnimationScreen(),
        StateRestorationScreen.routeName: (context) => const StateRestorationScreen(),
      },
      home: const HomePage(),
    );
  }
}
