import 'package:get/get.dart';
import 'package:track_app/main.dart';

import '../views/ai/takeImageScreen.dart';
import '../views/auth/authHome_screen.dart';
import '../views/auth/login_screen.dart';
import '../views/auth/register_screen.dart';
import '../views/bmi/bmi_completion.dart';
import '../views/bmi/bmi_screen.dart';
import '../views/height/get_height.dart';
import '../views/workout/workout_lists.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => MyHomePage(),
    ),
    GetPage(
      name: Routes.AUTHHOME,
      page: () => AuthHomeScreen(),
    ),
    GetPage(name: Routes.REGISTER, page: () => RegisterScreen()),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: Routes.BMI,
      page: () => BmiScreen(),
    ),
    GetPage(
      name: Routes.BMI_COMPLETION,
      page: () => bmiCompleter(),
    ),
    GetPage(
      name: Routes.WORKOUT_LIST,
      page: () => WorkoutListPage(),
    ),
    GetPage(
      name: Routes.GET_HEIGHT,
      page: () => GetHeight(),
    ),
    GetPage(name: Routes.AI, page: () => TakeImageScreen()),
  ];
}
