// import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:track_app/BMI%20SCreen/bmi_screen.dart';
import 'package:track_app/heightScreen/height_picker.dart';

// ignore: must_be_immutable
class GetHeight extends StatefulWidget {
  int? height;

  GetHeight({Key? key, this.height}) : super(key: key);

  @override
  State<GetHeight> createState() => _GetHeightState();
}

class _GetHeightState extends State<GetHeight> {
  int? height = 90;

  @override
  void initState() {
    super.initState();
    height = widget.height ?? 90;
  }

  // @override
  // void setState(VoidCallback fn) {
  // ignore: todo
  //   // TODO: implement setState
  //   super.setState(fn);
  //   height = height ?? 0 + 1;
  // }

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    var widthOfScreen = screen.size.width / 100;
    var heighOfScreen = screen.size.height / 100;

    const Map<int, Widget> myTabs = <int, Widget>{
      0: Text("Centimeter"),
      1: Text("Feet"),
      2: Text('Inches')
    };

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        centerTitle: true,
        title: const Text('Add Height'),
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
        elevation: 0,
      ),
      body: Column(children: [
        Container(
          color: Colors.white,
          height: heighOfScreen * 5,
          width: widthOfScreen * 75,
          child: CupertinoSlidingSegmentedControl(
              onValueChanged: (value) {
                if (value == 0) {
                } else {}
              },
              groupValue: 0,
              thumbColor: Colors.orange,
              children: myTabs),
        ),
        Container(
          child: //LayoutBuilder(
              //builder: (context, constraints){
              //return
              HeightPicker(
            height: height,
            maxHeight: 220,
            widGetHeight: heighOfScreen * 75,
            onChange: (val) => setState(() => height = val),
          ),
          //}
          // child: HeightPicker(height: height,
          // maxHeight: (heighOfScreen * 25).toInt(),
          //         widGetHeight: 250,
          //         onChange: (val) => setState( () => height = val ),),
          //height: heighOfScreen * 100,
          //width: widthOfScreen * 85,
          //color: Colors.black45,
          //),
          color: Colors.white,
          height: heighOfScreen * 75,
          width: widthOfScreen * 100,
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BmiScreen()));
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
                child: Text('Next', style: TextStyle(color: Colors.white))),
          ),
        )
      ]),
      backgroundColor: Colors.white,
    );
  }
}
