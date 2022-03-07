import 'package:get/get.dart';
import 'package:track_app/main.dart';
import 'package:track_app/modules/bmi/bmi_completion.dart';
import 'package:track_app/modules/bmi/bmi_screen.dart';
import 'package:track_app/modules/height/get_height.dart';
import 'package:track_app/modules/login/login_binding.dart';
import 'package:track_app/modules/login/login_screen.dart';
import 'package:track_app/modules/workout/workout_lists.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => MyHomePage(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
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
  ];
}
