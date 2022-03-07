import 'package:flutter/material.dart';

import 'height_styles.dart';
import 'height_utils.dart';

class HeightSlider extends StatelessWidget {
  final int? height;

  const HeightSlider({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SliderLabel(height: height),
          Row(
            children: const <Widget>[
              SliderCircle(),
              Expanded(child: SliderLine()),
            ],
          ),
        ],
      ),
    );
  }
}

class SliderLabel extends StatelessWidget {
  final int? height;

  const SliderLabel({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenAwareSize(4.0, context),
        bottom: screenAwareSize(2.0, context),
      ),
      // child: Text(
      //   "$height",
      //   style: TextStyle(
      //     fontSize: selectedLabelFontSize,
      //     color: Theme.of(context).primaryColor,
      //     fontWeight: FontWeight.w600,
      //   ),
      // ),
    );
  }
}

class SliderLine extends StatelessWidget {
  const SliderLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: List.generate(
          34,
          (i) => Expanded(
                child: Container(
                  height: 2.0,
                  decoration: BoxDecoration(
                      color: i.isEven
                          ? Colors.blue //Theme.of(context).primaryColor
                          : Colors.transparent),
                ),
              )),
    );
  }
}

class SliderCircle extends StatelessWidget {
  const SliderCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: circleSizeAdapted(context),
      height: circleSizeAdapted(context),
      decoration: const BoxDecoration(
        color: Colors.transparent, //Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.unfold_more,
        color: Colors.white,
        size: 0.6 * circleSizeAdapted(context),
      ),
    );
  }
}
