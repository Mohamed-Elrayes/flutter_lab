import 'package:flutter_lab/challenge/main_challenge_screen.dart';
import 'package:flutter_lab/challenge/pages/ticket_booking_screen.dart';
import 'package:flutter_lab/core/data/experiment.dart';
import 'package:flutter_lab/experiments/animations/pages/implicit_animation_screen.dart';
import 'package:flutter_lab/experiments/animations/main_animations_screen.dart';
import 'package:flutter_lab/experiments/custom_paint/main_custom_paint_screen.dart';
import 'package:flutter_lab/experiments/custom_paint/pages/custom_paint_screen.dart';
import 'package:flutter_lab/experiments/forms/main_forms_screen.dart';
import 'package:flutter_lab/experiments/forms/pages/focus_forms_screen.dart';
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
    customPainterExperiment,
    challengeExperiment,
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
          title: 'Focus Form',
          description: 'Focus forms use [Focus , FocusScope , FocusNode ] for user experience',
          route: {
            'focus_forms': (context) => const FocusFormsScreen(),
          },
        )
      ],
    );
  }

  static Experiment get customPainterExperiment {
    return Experiment(
      title: 'Custom Painter Experiment',
      route: {
        'main_custom_painter_screen': (context) => const MainCustomPainterScreen(),
      },
      description: 'A collection of Custom Painter examples to test your skills',
      subScreen: [
        Experiment(
          title: 'Custom Paint',
          route: {
            'custom_paint_screen': (context) => const CustomPaintScreen(),
          },
        ),
      ],
    );
  }

  static Experiment get challengeExperiment {
    return Experiment(
      title: 'Challenge Experiment UI Design',
      route: {
        'main_challenge_screen': (context) => const MainChallengeScreen(),
      },
      description: 'A collection of UI design challenges to test your skills',
      subScreen: [
        Experiment(
          title: 'Ticket Booking',
          route: {
            'ticket_booking_screen': (context) => const TicketBookingScreen(),
          },
          description: 'A ticket booking UI design challenge',
        ),
      ],
    );
  }
}
