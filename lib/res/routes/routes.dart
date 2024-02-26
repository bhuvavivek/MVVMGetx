import 'package:get/get.dart';
import 'package:mvvmwithget/main.dart';
import 'package:mvvmwithget/res/routes/routesname.dart';
import 'package:mvvmwithget/view/login/login_view.dart';

import '../../view/splashScreen.dart';

class AppRoutes {
  static appRoute() => [
        GetPage(
          name: RoutesName.homeScreen,
          page: () => const MyHomePage(
            title: 'demo',
          ),
        ),
        GetPage(
            name: RoutesName.splashScreen,
            page: () => const SplashScreen(),
            transition: Transition.fadeIn,
            transitionDuration: const Duration(milliseconds: 300)),
        GetPage(
            name: RoutesName.loginScreen,
            page: () => const LoginView(),
            transition: Transition.fadeIn,
            transitionDuration: const Duration(milliseconds: 300)),
      ];
}
