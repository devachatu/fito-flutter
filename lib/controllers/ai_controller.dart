import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as DIO;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class AiController extends GetxController {
  String description = "";
  Map displayData = {};
  void imageToString(String file) async {
    var response =
        await DIO.Dio(DIO.BaseOptions(baseUrl: "http://192.168.29.130:5000/"))
            .post('api/test', data: {"image": file});
    Map responseData = json.decode(response.data);
    if (!responseData.keys.contains("message") &&
        responseData["foods"] != null &&
        responseData["foods"].length != 0) {
      displayData["name"] = responseData["foods"][0]["food_name"].toString();
      displayData["qty"] = responseData["foods"][0]["serving_qty"].toString() +
          " " +
          responseData["foods"][0]["serving_unit"].toString();
      displayData["calories"] =
          responseData["foods"][0]["nf_calories"].toString() + " kcal";
    } else {
      displayData["error"] = "ERROR";
    }

    update();
  }

  uploadToFirebase(File _imageFile) async {
    displayData.clear();
    displayData["name"] = "Im thinking...";
    displayData["qty"] = "Im thinking...";
    displayData["calories"] = "Hmmm...";
    String fileName = basename(_imageFile.path);
    String downloadUrl = "";
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    var taskSnapshot = await uploadTask.then((taskSnapshot) {
      taskSnapshot.ref.getDownloadURL().then((value) {
        print("Done: $value");
        downloadUrl = value;
        imageToString(downloadUrl);
      });
    });
  }
}
