import 'package:get/get.dart';
import 'package:track_app/shared/utilities/request.dart';

import '../../models/User.dart';

class AuthController extends GetxController {
  String? token;
  User? user;

  register(User tUser) async {
    var response =
        await postRequest("api/users/register", body: tUser.toJson());
    User user = User.fromJson(response);
  }
}
