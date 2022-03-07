import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:track_app/routes/app_pages.dart';

import '../workout/workout_lists.dart';

// ignore: camel_case_types
class bmiCompleter extends StatelessWidget {
  const bmiCompleter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    var widthOfScreen = screen.size.width / 100;
    var heighOfScreen = screen.size.height / 100;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        centerTitle: true,
        title: const Text('Add Weight'),
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
              child: Center(
                child: CircularStepProgressIndicator(
                  unselectedStepSize: 20,
                  totalSteps: 20,
                  currentStep: 14,
                  stepSize: 10,
                  selectedColor: Colors.orange[800],
                  unselectedColor: Colors.grey[200],
                  padding: 0,
                  circularDirection: CircularDirection.counterclockwise,
                  width: 250,
                  height: 250,
                  selectedStepSize: 20,
                  child: const Center(
                    child: Text(
                      '24.2',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  roundedCap: (_, __) => true,
                ),
              ),
              color: Colors.white,
              height: heighOfScreen * 50,
              width: widthOfScreen * 83,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(
                  width: 1,
                  color: Colors.grey.shade400,
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(15),
            ),
            height: heighOfScreen * 10,
            width: widthOfScreen * 90,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    // clipBehavior: Clip.hardEdge,
                    // fit: StackFit.expand,
                    //overflow: Overflow.clip,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: const [
                      Text('24',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                        "Man age",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  Container(
                    color: Colors.grey.shade500,
                    height: heighOfScreen * 5,
                    width: widthOfScreen * 0.3,
                  ),
                  Column(
                    // clipBehavior: Clip.hardEdge,
                    // fit: StackFit.expand,
                    // overflow: Overflow.clip,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text('167',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            //color: Colors.grey
                          )),
                      Text(
                        "Height",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  Container(
                    color: Colors.grey.shade500,
                    height: heighOfScreen * 5,
                    width: widthOfScreen * 0.3,
                  ),
                  Column(
                    // clipBehavior: Clip.hardEdge,
                    // fit: StackFit.expand,
                    // overflow: Overflow.clip,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text('54',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            //color: Colors.grey
                          )),
                      Text(
                        "Weight",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            child: const Center(
              child: Text('You have normal body weight',
                  style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.normal)),
            ),
            height: heighOfScreen * 10,
            width: widthOfScreen * 95,
          ),
          InkWell(
            onTap: () {
              Get.to(Routes.WORKOUT_LIST);
            },
            child: Container(
              height: heighOfScreen * 5,
              width: widthOfScreen * 75,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 10, 37, 156),
                border: Border.all(color: const Color.fromARGB(255, 5, 19, 82)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                  child: Text('Go to Video Lists',
                      style: TextStyle(color: Colors.white))),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
