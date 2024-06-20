import 'package:flutter/material.dart';
import 'package:flutter_lab/core/data/app_data.dart';
import 'package:flutter_lab/core/home/componnents/tutorial_list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Experiments')),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            AppData.appExperiments.length,
            (i) => ExperimentListItem(AppData.appExperiments[i]),
          ),
        ),
      ),
    );
  }
}
