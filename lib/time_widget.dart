import 'package:flutter/material.dart';
import 'package:horizontal_time_picker/horizontal_time_picker.dart';

class AppColors {
  static const Color primaryElement = Color.fromARGB(255, 255, 255, 255);
}

class Borders {
  static const BorderSide primaryBorder = BorderSide(
    color: Color.fromARGB(255, 229, 229, 229),
    width: 1,
    style: BorderStyle.solid,
  );
}

class Radii {
  static const BorderRadiusGeometry k3pxRadius =
      BorderRadius.all(Radius.circular(5));
}

class TimeWidget extends StatelessWidget {
  final DateTime date;
  final TimeUnit timeUnit;
  final TextStyle timeTextStyle;
  final TextStyle selectedTimeTextStyle;
  VoidCallback onTap;
  final VoidCallback onLongTap;
  Decoration defaultDecoration;
  Decoration selectedDecoration;
  Decoration disabledDecoration;
  bool isSelected;
  bool isDisabled;
  final EdgeInsetsGeometry padding;

  TimeWidget({
    Key key,
    @required this.date,
    @required this.timeUnit,
    this.onTap,
    this.onLongTap,
    this.isSelected = false,
    this.isDisabled = false,
    this.timeTextStyle,
    this.selectedTimeTextStyle,
    this.defaultDecoration = const BoxDecoration(
      color: AppColors.primaryElement,
      border: Border.fromBorderSide(Borders.primaryBorder),
      borderRadius: Radii.k3pxRadius,
    ),
    this.selectedDecoration = const BoxDecoration(
      color: Colors.black87,
      border: Border.fromBorderSide(Borders.primaryBorder),
      borderRadius: Radii.k3pxRadius,
    ),
    this.disabledDecoration = const BoxDecoration(
      color: Colors.black26,
      border: Border.fromBorderSide(Borders.primaryBorder),
      borderRadius: Radii.k3pxRadius,
    ),
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Decoration decoration = defaultDecoration;
    TextStyle timeStyle = timeTextStyle;
    if (isSelected) {
      timeStyle = selectedTimeTextStyle;
      decoration = selectedDecoration;
    } else if (isDisabled) {
      decoration = disabledDecoration;
    }
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      onLongPress: isDisabled ? null : onLongTap,
      child: Container(
        decoration: decoration,
        child: Padding(
          padding: padding,
          child: Text(
            timeUnit.time,
            textAlign: TextAlign.left,
            style: timeStyle,
          ),
        ),
      ),
    );
  }
}
