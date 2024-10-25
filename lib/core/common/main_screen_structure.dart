import 'package:flutter/material.dart';
import 'package:flutter_lab/core/common/main_item_structure.dart';
import 'package:flutter_lab/core/data/experiment.dart';

class MainScreenStructure extends StatelessWidget {
  const MainScreenStructure({super.key, required this.experiment});

  final Experiment experiment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          experiment.title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: experiment.subScreen.length,
        itemBuilder: (c, i) => MainItemStructure(
          title: experiment.subScreen[i].title,
          routeName: experiment.subScreen[i].route.entries.first.key,
          description: experiment.subScreen[i].description,
        ),
      ),
    );
  }
}
