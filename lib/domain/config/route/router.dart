import 'package:get/get.dart';
import 'package:kas_mentor_mt/presentation/pages/home_page.dart';
import 'package:kas_mentor_mt/presentation/pages/learning_page.dart';
import 'package:kas_mentor_mt/presentation/pages/materials_page.dart';
import 'package:kas_mentor_mt/presentation/pages/more_page.dart';

import '../../../presentation/pages/discover_page.dart';
import '../../../presentation/pages/landing_page.dart';
import '../../../presentation/pages/splash_page.dart';
import '../../../presentation/pages/welcome_page.dart';
import '../../../presentation/widgets/undefined_view.dart';
import 'route_const.dart';

class Routes {
  static final generateRoute = [
    GetPage(name: splashViewRoute, page: () => SplashPage()),
    GetPage(name: welcomeViewRoute, page: () => WelcomePage()),
    GetPage(name: landingViewRoute, page: () => LandingPage()),

    GetPage(name: homeViewRoute, page: () =>  HomePage()),
    GetPage(name: learningsViewRoute, page: () => const LearningPage()),
    GetPage(name: moreViewRoute, page: () => const MorePage()),
    GetPage(name: materialsViewRoute, page: () => const MaterialsPage()),

    GetPage(name: discoverViewRoute, page: () => const DiscoverPage()),
  ];

  static final errorViewRoute = GetPage(name: notFoundViewRoute, page: () => const UndefinedView());
}
