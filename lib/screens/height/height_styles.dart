import 'package:track_app/screens/height/height_utils.dart';
import 'package:flutter/material.dart';

export 'package:track_app/screens/height/styles.dart';

double marginBottomAdapted(BuildContext context) =>
    screenAwareSize(marginBottom, context);

double marginTopAdapted(BuildContext context) =>
    screenAwareSize(marginTop, context);

double circleSizeAdapted(BuildContext context) =>
    screenAwareSize(circleSize, context);

TextStyle labelsTextStyle = TextStyle(
  color: Colors.black,
  fontSize: (isChanging == true) ? selectedLabelFontSize : labelsFontSize,
);

const double circleSize = 32.0;
const double marginBottom = circleSize / 2;
const double marginTop = 26.0;
const double selectedLabelFontSize = 20.0;
const double labelsFontSize = 13.0;
bool isChanging = true;
const Color labelsGrey =
    Colors.black; //const Color.fromRGBO(216, 217, 223, 1.0);
