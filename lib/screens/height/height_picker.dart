import 'dart:math' as math;

import 'package:track_app/screens/height/height_slider.dart';
import 'package:track_app/screens/height/height_styles.dart';
import 'package:track_app/screens/height/height_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class HeightPicker extends StatefulWidget {
  final int? maxHeight;
  final int? minHeight;
  final int? height;
  final double? widGetHeight;
  final ValueChanged<int> onChange;

  const HeightPicker(
      {Key? key,
      this.height = 0,
      this.widGetHeight = 0,
      required this.onChange,
      this.maxHeight = 220,
      this.minHeight = 90})
      : super(key: key);

  int get totalUnits => 220; //maxHeight ?? 0 - (minHeight ?? 0);

  @override
  _HeightPickerState createState() => _HeightPickerState();
}

class _HeightPickerState extends State<HeightPicker> {
  double? startDragYOffset;
  int? startDragHeight;

  double get _pixelsPerUnit {
    return _drawingHeight / widget.totalUnits;
  }

  double get _sliderPosition {
    double halfOfBottomLabel = labelsFontSize / 2;
    int unitsFromBottom = widget.height ?? 0 - (widget.minHeight ?? 0);
    return halfOfBottomLabel + unitsFromBottom * _pixelsPerUnit;
  }

  ///returns actual height of slider to be able to slide
  double get _drawingHeight {
    double totalHeight = widget.widGetHeight ?? 0;
    double marginBottom = marginBottomAdapted(context);
    double marginTop = marginTopAdapted(context);
    return totalHeight - (marginBottom + marginTop + labelsFontSize);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapDown: _onTapDown,
      onVerticalDragStart: _onDragStart,
      onVerticalDragUpdate: _onDragUpdate,
      child: Stack(
        //alignment: Alignment.center,
        children: <Widget>[
          drawLines(),
          _drawLabels(),
          _drawPersonImage(),
          _drawSlider(),
        ],
      ),
    );
  }

  _onTapDown(TapDownDetails tapDownDetails) {
    int height = _globalOffsetToHeight(tapDownDetails.globalPosition);
    //widget.onChange.call(0);
    widget.onChange(_normalizeHeight(height));
  }

  int _normalizeHeight(int height) {
    return math.max(
        widget.minHeight ?? 0, math.min(widget.maxHeight ?? 0, height));
  }

  int _globalOffsetToHeight(Offset globalOffset) {
    RenderBox getBox = context.findRenderObject() as RenderBox;
    Offset localPosition = getBox.globalToLocal(globalOffset);
    double dy = localPosition.dy;
    dy = dy - marginTopAdapted(context) - labelsFontSize / 2;
    int height = (widget.maxHeight ?? 0) - (dy ~/ _pixelsPerUnit);
    return height;
  }

  _onDragStart(DragStartDetails dragStartDetails) {
    int newHeight = _globalOffsetToHeight(dragStartDetails.globalPosition);
    //widget.onChange != null ?  (newHeight) : 0;
    // widget.onChange(newHeight);
    setState(() {
      startDragYOffset = dragStartDetails.globalPosition.dy;
      startDragHeight = newHeight;
    });
  }

  _onDragUpdate(DragUpdateDetails dragUpdateDetails) {
    double currentYOffset = dragUpdateDetails.globalPosition.dy;
    double verticalDifference = (startDragYOffset ?? 0) - currentYOffset;
    int diffHeight = verticalDifference ~/ _pixelsPerUnit;
    int height = _normalizeHeight((startDragHeight ?? 0) + diffHeight);

    setState(() => widget.onChange(height));
  }

  Widget _drawSlider() {
    return Positioned(
      child: HeightSlider(height: widget.height),
      left: 0.0,
      right: 0.0,
      bottom: _sliderPosition,
    );
  }

  Widget _drawLabels() {
    int labelsToDisplay = widget.totalUnits ~/ 20 + 1;
    // int labelsToDisplayLines = widget.totalUnits ~/ 10 + 1;
    List<Widget> labels = List.generate(
      labelsToDisplay,
      (idx) {
        int count = (widget.maxHeight ?? 0) - 20 * idx;
        return Row(children: [
          //Text('${idx}', style: labelsTextStyle,),
          DefaultTextStyle(
            style: labelsTextStyle,
            child: (count == 0)
                ? const Text(' ')
                : Text(
                    "${(widget.maxHeight ?? 0) - 20 * idx}",
                  ),
          ),
        ]);
      },
    );

    return Align(
      alignment: Alignment.centerLeft,
      child: IgnorePointer(
        child: Padding(
          padding: EdgeInsets.only(
            left: screenAwareSize(45.0, context),
            bottom: marginBottomAdapted(context),
            top: marginTopAdapted(context),
          ),
          child: Column(
            children: labels,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
      ),
    );
  }

  Widget drawLines() {
    // int labelsToDisplay = widget.totalUnits ~/ 20 + 1;
    int labelsToDisplayLines = widget.totalUnits ~/ 5 + 1;
    // int lablesToDisplayLines3 = widget.totalUnits ~/ 3 + 1;
    List<Widget> labels = List.generate(
      labelsToDisplayLines,
      (idx) {
        return Row(
          children: const [
            DefaultTextStyle(
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  decoration: TextDecoration.lineThrough),
              child: Text('     '),
            ),
            //Text('${idx}', style: labelsTextStyle,),
            // Text(
            //'' "${(widget.maxHeight ?? 0) - 5 * idx}",
            // style: labelsTextStyle,
            //),
          ],
        );
      },
    );

    return Align(
      alignment: Alignment.centerLeft,
      child: IgnorePointer(
        child: Padding(
          padding: EdgeInsets.only(
            left: screenAwareSize(5.0, context),
            bottom: screenAwareSize(5.0, context),
            top: marginTopAdapted(context),
          ),
          child: Column(
            children: labels,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }

  Widget _drawPersonImage() {
    double personImageHeight = _sliderPosition + marginBottomAdapted(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: SvgPicture.asset(
        "images/person.svg",
        height: personImageHeight,
        width: personImageHeight / 3,
        color: Colors.green.shade200,
      ),
    );
  }
}
