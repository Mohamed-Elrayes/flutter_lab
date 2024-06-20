import 'package:flutter/foundation.dart';

@immutable
class Experiment {
  const Experiment({
    required this.title,
    required this.description,
    this.tutorialPageRoute,
  });

  final String description;
  final String title;
  final String? tutorialPageRoute;
}
