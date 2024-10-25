import 'package:flutter/material.dart';
import 'package:flutter_lab/core/common/main_item_structure.dart';
import 'package:flutter_lab/app_lab.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Experiments')),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            AppLab.appExperiments.length,
            (i) => MainItemStructure(
              title: AppLab.appExperiments[i].title,
              routeName: AppLab.appExperiments[i].route.entries.first.key,
              description: AppLab.appExperiments[i].description,
            ),
          ),
        ),
      ),
    );
  }
}
