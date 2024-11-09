import 'package:flutter/material.dart';
import 'package:flutter_lab/core/common/main_screen_structure.dart';
import 'package:flutter_lab/app_lab.dart';

class MainCustomPainterScreen extends StatelessWidget {
  const MainCustomPainterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScreenStructure(experiment: AppLab.customPainterExperiment);
  }
}
