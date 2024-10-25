import 'package:flutter/material.dart';
import 'package:flutter_lab/app_lab.dart';
import 'package:flutter_lab/core/home/presentation/home_page.dart';

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
      routes: {
        for (final experiment in AppLab.appExperiments) ...{
          ...experiment.route,
          for (final subScreen in experiment.subScreen) ...{...subScreen.route}
        }
      },
      home: const HomePage(),
    );
  }
}
