import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:syncfusion_flutter_core/legend_internal.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  int _annotationValue = 0;

  void handlePointerValueChanged(double? value) {
    setState(() {
      final int _value = value?.toInt() ?? 0;
      _annotationValue = _value;
    });
  }

  int segmentedControlValue = 0;

  Widget segmentedControl() {
    MediaQueryData screen = MediaQuery.of(context);
    var widthOfScreen = screen.size.width / 100;
    var heighOfScreen = screen.size.height / 100;
    // int groupValue = 0;

    const Map<int, Widget> myTabs = <int, Widget>{
      0: Text("Kilogram"),
      1: Text("Pound"),
      2: Text('Gram')
    };
    return Container(
      color: Colors.white,
      height: heighOfScreen * 7,
      width: widthOfScreen * 75,
      child: CupertinoSlidingSegmentedControl(
          onValueChanged: (index) {
            setState(() {
              if (index == 0) {
                segmentedControlValue = 0;
              } else if (index == 1) {
                segmentedControlValue = 1;
              } else {
                segmentedControlValue = 2;
              }
            });
          },
          groupValue: segmentedControlValue,
          thumbColor: Colors.orange,
          children: myTabs),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    var widthOfScreen = screen.size.width / 100;
    var heighOfScreen = screen.size.height / 100;
    int minimumGauge = 90;
    int maximumgauge = 10;
    String kiloPound = 'KG';

    if (segmentedControlValue == 2) {
      maximumgauge = 100;
      minimumGauge = 10;
      kiloPound = 'Grams';
    } else if (segmentedControlValue == 1) {
      maximumgauge = 92;
      minimumGauge = 12;
      kiloPound = 'Pounds';
    } else {
      maximumgauge = 90;
      minimumGauge = 10;
      kiloPound = 'KG';
    }

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
        title: const Text('Add Weight'),
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
        elevation: 0,
      ),
      body: Column(children: [
        segmentedControl(),
        Container(
          child: Stack(children: [
            SfRadialGauge(
              enableLoadingAnimation: true,
              axes: [
                RadialAxis(
                  axisLineStyle: const AxisLineStyle(
                      color: Colors.white, cornerStyle: CornerStyle.bothCurve),
                  showAxisLine: false,
                  startAngle: 180, endAngle: 360,
                  interval: 10,
                  minimum: minimumGauge.toDouble(),
                  maximum: maximumgauge.toDouble(),
                  axisLabelStyle: const GaugeTextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  onAxisTapped: handlePointerValueChanged,
                  // annotations: [
                  //   GaugeAnnotation(widget: Text('$_annotationValue'),
                  //   verticalAlignment: GaugeAlignment.far,)
                  // ],
                  pointers: <GaugePointer>[
                    // MarkerPointer(
                    //   //markerType: MarkerType.triangle,
                    //   value: 60,
                    //   enableDragging:true,
                    //   onValueChanged: handlePointerValueChanged,
                    // //  onValueChanged:handlePointerValueChanged,
                    // ),
                    NeedlePointer(
                      enableDragging: true,
                      //animationType: AnimationType.slowMiddle,
                      enableAnimation: true,
                      value: _annotationValue.toDouble(),
                      needleColor: Colors.blue,
                      needleStartWidth: 4,
                      needleEndWidth: 10,
                      needleLength: 0.3,
                      onValueChangeStart: handlePointerValueChanged,
                      onValueChangeEnd: handlePointerValueChanged,

                      onValueChanged: handlePointerValueChanged,
                      //needleLength: 1,
                      knobStyle: const KnobStyle(
                          knobRadius: 0.05,
                          borderColor: Colors.blue,
                          color: Colors.white,
                          borderWidth: 0.03),
                    )
                  ],
                  showTicks: true,
                  ticksPosition: ElementsPosition.inside,
                  labelsPosition: ElementsPosition.outside,
                  isInversed: true,
                ),
              ],

              // title: GaugeTitle(
              //   text: 'rathna',textStyle: TextStyle(color: Colors.red),
              // ),
            ),
            SizedBox(
              height: heighOfScreen * 30,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Text(
                  '$_annotationValue  $kiloPound',
                  style: const TextStyle(
                      fontSize: 27, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ], alignment: Alignment.bottomCenter),
          color: Colors.white,
          height: heighOfScreen * 70,
          width: widthOfScreen * 100,
        ),
        Container(
          height: heighOfScreen * 5,
          width: widthOfScreen * 75,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 10, 37, 156),
            border: Border.all(color: const Color.fromARGB(255, 5, 19, 82)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
              child: Text('Next', style: TextStyle(color: Colors.white))),
        )
      ]),
    );
  }
}
