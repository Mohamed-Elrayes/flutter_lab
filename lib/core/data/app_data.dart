import 'package:flutter_lab/core/data/experiment.dart';
import 'package:flutter_lab/core/data/models/scroll_physics_data.dart';
import 'package:flutter_lab/experiments/scroll-physics/pages/always_scrollable_scroll_physics_ex.dart';
import 'package:flutter_lab/experiments/scroll-physics/scroll_physics_screen.dart';

class AppData {
  static List<Experiment> appExperiments = [
    const Experiment(
      title: 'ScrollPhysics Types With Examples',
      description: 'See all types of ScrollPhysics with example usages and code',
      tutorialPageRoute: ScrollPhysicsScreen.routeName,
    ),
  ];

  static List<ScrollPhysicsData> scrollPhysicsTypes = [
    const ScrollPhysicsData(
      title: 'AlwaysScrollableScrollPhysics',
      pageRoute: AlwaysScrollableScrollPhysicsEx.routeName,
    ),
  ];
}
