import 'package:flutter/material.dart';

@immutable
class Experiment {
  const Experiment({
    required this.title,
     this.description,
    required this.route,
    this.subScreen = const [],
  }) : assert(
          route.length == 1,
          'Only one route is allowed per experiment',
        );

  final String? description;
  final String title;
  final Map<String, WidgetBuilder> route;
  final List<Experiment> subScreen;
}
