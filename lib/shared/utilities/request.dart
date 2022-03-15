import 'dart:async';
import 'package:dio/dio.dart' as DIO;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

const BASE_URL = 'http://localhost:4000/';

Map<String, dynamic> timeoutResponse() {
  return {
    "issuccess": false,
    "message": "Please check your network connection and try again."
  };
}

Map<String, dynamic> errorResponse() {
  return {
    "issuccess": false,
    "message": "Something went wrong, please try again."
  };
}

Map<String, dynamic> getHeaders() {
  AuthController authController = Get.find();
  if (authController.token != null) {
    return {
      'authorization': 'Bearer ' + authController.token!,
    };
  } else {
    return {};
  }
}

Future<Map<String, dynamic>> postRequest(String url,
    {Map<String, dynamic>? body, bool showMessage = true}) async {
  var options = DIO.BaseOptions(
      baseUrl: BASE_URL,
      responseType: DIO.ResponseType.json,
      connectTimeout: 1000000,
      headers: getHeaders(),
      receiveTimeout: 1000000);

  DIO.Dio dio = DIO.Dio(options);
  DIO.Response response;
  try {
    print(url);
    print(body);
    response = await dio.post(url, data: body);
    while (Get.isOverlaysOpen) {
      Get.back();
    }
    Map<String, dynamic> responseData = response.data;
    print(responseData);
    responseData["isSuccess"] = true;
    if (responseData['message'] != null && showMessage) {
      Get.defaultDialog(
        title: "Message",
        content: Center(child: Text(responseData['message'])),
      );
    }

    return responseData;
  } catch (e) {
    print(e);
    while (Get.isOverlaysOpen) {
      Get.back();
    }

    if (e is DIO.DioError) {
      try {
        print(e.toString());

        if ((e.response?.statusCode ?? 0) >= 400 &&
            (e.response?.statusCode ?? 0) < 500) {
          if (e.response?.data?.containsKey('error') ?? false) {
            Get.defaultDialog(
              title: "Error",
              middleText: e.response?.data['error'] ?? "",
            );
            // Get.showSnackbar(GetBar(
            //     duration: Duration(seconds: 5),
            //     title: "Error",
            //     message: e.response.data['error']));
          }
          if ((e.response?.statusCode ?? 0) >= 500 &&
              (e.response?.statusCode ?? 0) < 600) {
            if ((e.response?.statusMessage ?? "") != "") {
              Get.defaultDialog(
                title: "Error",
                middleText: e.response?.statusMessage ?? "",
              );
              // Get.showSnackbar(GetBar(
              //     duration: Duration(seconds: 5),
              //     title: "Error",
              //     message: e.response.data['error']));
            }
          }
          if (e.response?.data?.containsKey('errors') ?? false) {
            Get.defaultDialog(
              title: "Error",
              middleText: e.response?.data['errors'][0]['msg'] ?? "",
            );
            // Get.showSnackbar(GetBar(
            //     duration: Duration(seconds: 5),
            //     title: "Error",
            //     message: e.response.data['errors'][0]['msg']));
          }
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }
  return {"isSuccess": false};
}

Future<Map<String, dynamic>> getRequest(String url,
    {bool showMessage = true,
    Map<String, dynamic>? query,
    bool close = true}) async {
  var options = DIO.BaseOptions(
      baseUrl: BASE_URL,
      responseType: DIO.ResponseType.json,
      connectTimeout: 1000000,
      queryParameters: query,
      headers: getHeaders(),
      receiveTimeout: 300000);
  // print (options);

  DIO.Dio dio = DIO.Dio(options);
  DIO.Response response;
  try {
    print(url);
    if (query != null) {
      print(query);
      response = await dio.get(url, queryParameters: query);
    } else {
      response = await dio.get(url);
    }
    Map<String, dynamic> responseData = response.data;
    responseData["isSuccess"] = true;
    if (close) {
      while (Get.isOverlaysOpen) {
        Get.back();
      }
    }
    if (responseData['message'] != null && showMessage) {
      Get.defaultDialog(
        title: "Message",
        content: Center(child: Text(responseData['message'])),
      );
    }
    debugPrint(responseData.toString());
    print(responseData.length);
    return responseData;
  } on DIO.DioError catch (e) {
    while (Get.isOverlaysOpen) {
      Get.back();
    }
    if ((e.response != null)) if ((e.response?.statusCode ?? 0) >= 400 &&
        (e.response?.statusCode ?? 0) < 600) {
      if ((e.response?.data?.containsKey('error') ?? false) & showMessage) {
        Get.showSnackbar(GetBar(
            title: "Error",
            message: e.response?.data['error'].toString() ?? ""));
      }
    }
  } catch (e) {
    Get.showSnackbar(GetBar(title: "Error", message: e.toString()));
  }
  return {"isSuccess": false};
}
