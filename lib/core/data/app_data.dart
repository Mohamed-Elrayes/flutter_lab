import 'package:flutter_lab/core/data/experiment.dart';
import 'package:flutter_lab/core/data/models/sub_screen_data.dart';
import 'package:flutter_lab/experiments/animations/implicit_animation_screen.dart';
import 'package:flutter_lab/experiments/animations/main_animations_screen.dart';
import 'package:flutter_lab/experiments/multiple-page-form/multiple_page_form_screen.dart';
import 'package:flutter_lab/experiments/scroll-physics/pages/always_scrollable_scroll_physics_ex.dart';
import 'package:flutter_lab/experiments/scroll-physics/scroll_physics_screen.dart';

class AppData {
  static List<Experiment> appExperiments = [
    const Experiment(
      title: 'ScrollPhysics Types With Examples',
      description: 'See all types of ScrollPhysics with example usages and code',
      tutorialPageRoute: ScrollPhysicsScreen.routeName,
    ),
    const Experiment(
      title: 'Multiple Page Form',
      description: 'Split your forms in multiple page for a better user experience',
      tutorialPageRoute: MultiplePageFormScreen.routeName,
    ),
    const Experiment(
      title: 'Animation Types With Examples',
      description: 'See all types of Animation with example usages and code',
      tutorialPageRoute: MainAnimationScreen.routeName,
    ),
  ];

  static List<SubScreenData> scrollPhysicsTypes = [
    const SubScreenData(
      title: 'AlwaysScrollableScrollPhysics',
      pageRoute: AlwaysScrollableScrollPhysicsEx.routeName,
    ),
  ];
  static List<SubScreenData> animationsList = [
    const SubScreenData(
      title: 'Implicit Animations',
      pageRoute: ImplicitAnimationScreen.routeName,
    ),
  ];
}
