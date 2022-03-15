import 'package:get/get.dart';

import 'controllers/ai_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(AiController());
  }
}
