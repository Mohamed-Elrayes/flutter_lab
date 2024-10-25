import 'package:flutter_lab/core/data/experiment.dart';
import 'package:flutter_lab/experiments/animations/pages/implicit_animation_screen.dart';
import 'package:flutter_lab/experiments/animations/main_animations_screen.dart';
import 'package:flutter_lab/experiments/forms/main_forms_screen.dart';
import 'package:flutter_lab/experiments/forms/pages/long_forms_screen.dart';
import 'package:flutter_lab/experiments/navigation/main_navigation_screen.dart';
import 'package:flutter_lab/experiments/navigation/pages/navigator_multiple_page_screen.dart';
import 'package:flutter_lab/experiments/scroll-physics/pages/always_scrollable_scroll_physics_ex.dart';
import 'package:flutter_lab/experiments/scroll-physics/main_scroll_physics_screen.dart';
import 'package:flutter_lab/experiments/state/main_state_screen.dart';
import 'package:flutter_lab/experiments/state/pages/state_restoration_screen.dart';

class AppLab {
  static List<Experiment> appExperiments = [
    scrollPhysicsExperiment,
    formExperiment,
    navigationExperiment,
    animationTypesWithExperiment,
    stateRestorationExperiment,
  ];

  static Experiment get stateRestorationExperiment {
    return Experiment(
      title: 'State Experiment',
      route: {
        'MainStateScreen': (context) => const MainStateScreen(),
      },
      subScreen: [
        Experiment(
          title: 'State Restoration Types',
          route: {
            'StateRestorationScreen': (context) => const StateRestorationScreen(),
          },
          description: 'See all types of State Restoration with example usages and code',
        ),
      ],
    );
  }

  static Experiment get animationTypesWithExperiment {
    return Experiment(
      title: 'Animation Experiment',
      route: {
        'MainAnimationScreen': (context) => const MainAnimationScreen(),
      },
      subScreen: [
        Experiment(
          title: 'Implicit Animations',
          route: {
            'ImplicitAnimationScreen': (context) => const ImplicitAnimationScreen(),
          },
          description: 'See all types of Implicit Animations with example usages and code',
        ),
      ],
    );
  }

  static Experiment get navigationExperiment {
    return Experiment(
      title: 'Navigation Experiment',
      route: {
        'MainNavigationScreen': (context) => const MainNavigationScreen(),
      },
      subScreen: [
        Experiment(
          title: 'Multiple Page Form using Navigator',
          description: 'Split your forms in multiple page for a better user experience',
          route: {
            'NavigatorMultiplePageScreen': (context) => const NavigatorMultiplePageScreen(),
          },
        )
      ],
    );
  }

  static Experiment get scrollPhysicsExperiment {
    return Experiment(
      title: 'ScrollPhysics Experiment',
      route: {
        'MainScrollPhysicsScreen': (context) => const MainScrollPhysicsScreen(),
      },
      subScreen: [
        Experiment(
          title: 'AlwaysScrollableScrollPhysics',
          route: {
            'AlwaysScrollableScrollPhysicsEx': (context) => const AlwaysScrollableScrollPhysicsEx(),
          },
          description: 'See all types of ScrollPhysics with example usages and code',
        ),
      ],
    );
  }

  static Experiment get formExperiment {
    return Experiment(
      title: 'Forms Experiment',
      route: {
        'forms': (context) => const MainFormsScreen(),
      },
      subScreen: [
        Experiment(
          title: 'Long Form',
          description: 'Long forms use [focusNode & Forms & Custom Form] for user experience',
          route: {
            'multiplePageForm': (context) => const LongFormsScreen(),
          },
        )
      ],
    );
  }
}
