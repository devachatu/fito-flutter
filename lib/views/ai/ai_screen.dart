import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:track_app/controllers/ai_controller.dart';

class AiScreen extends StatefulWidget {
  AiScreen({Key? key, required this.imagePath}) : super(key: key);
  final String imagePath;

  @override
  State<AiScreen> createState() => _AiScreenState();
}

class _AiScreenState extends State<AiScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Column(children: [
        Container(
          height: 400,
          child: Image.file(File(widget.imagePath)),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          child: GetBuilder<AiController>(
              builder: ((controller) => (controller.displayData["error"] ==
                      null)
                  ? Column(
                      children: [
                        Text(
                          "Name : " +
                                  controller.displayData["name"].toString() ??
                              "",
                          style: TextStyle(fontSize: 22),
                        ),
                        Text(
                          "qty : " + controller.displayData["qty"].toString() ??
                              "",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Calories : " +
                                  controller.displayData["calories"]
                                      .toString() ??
                              "",
                          style: TextStyle(fontSize: 22),
                        )
                      ],
                    )
                  : Container(
                      child: Text(
                        controller.displayData["error"].toString(),
                        style: TextStyle(fontSize: 22),
                      ),
                    ))),
        )
      ]),
    ));
  }
}
