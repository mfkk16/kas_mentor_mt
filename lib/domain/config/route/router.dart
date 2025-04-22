import 'package:get/get.dart';
import '../../../presentation/pages/landing_page.dart';
import '../../../presentation/pages/splash_page.dart';
import '../../../presentation/pages/welcome_page.dart';
import '../../../presentation/widgets/undefined_view.dart';
import 'route_const.dart';

class Routes {
  static final generateRoute = [
    GetPage(name: splashViewRoute, page: () =>  SplashPage()),
    GetPage(name: welcomeViewRoute, page: () =>  WelcomePage()),
    GetPage(name: landingViewRoute, page: () => LandingPage()),
  ];

  static final errorViewRoute = GetPage(name: notFoundViewRoute, page: () => const UndefinedView());
}
