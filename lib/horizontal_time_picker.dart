library horizontal_time_picker;

import 'package:flutter/material.dart';
import 'package:horizontal_time_picker/time_picker_util.dart';
import 'package:horizontal_time_picker/time_widget.dart';

typedef DateSelectionCallBack = void Function(DateTime dateTime);

class HorizontalTimePicker extends StatefulWidget {
  final int startTimeInHour;
  final int endTimeInHour;
  final DateTime dateForTime;
  final int timeIntervalInMinutes;
  final double height;
  final TextStyle timeTextStyle;
  final TextStyle selectedTimeTextStyle;
  final DateSelectionCallBack onTimeSelected;
  final DateSelectionCallBack onTimeUnSelected;
  final Decoration defaultDecoration;
  final Decoration selectedDecoration;
  final Decoration disabledDecoration;
  final List<DateTime> initialSelectedDates;
  final ScrollController scrollController;
  final double spacingBetweenDates;
  final EdgeInsetsGeometry padding;
  final int maxSelectedDateCount;

  HorizontalTimePicker({
    Key key,
    this.height = 100,
    this.timeIntervalInMinutes = 15,
    @required this.startTimeInHour,
    @required this.endTimeInHour,
    @required this.dateForTime,
    this.scrollController,
    this.onTimeSelected,
    this.onTimeUnSelected,
    this.maxSelectedDateCount = 1,
    this.timeTextStyle,
    this.selectedTimeTextStyle,
    this.defaultDecoration,
    this.selectedDecoration,
    this.disabledDecoration,
    this.initialSelectedDates,
    this.spacingBetweenDates = 8.0,
    this.padding = const EdgeInsets.all(12.0),
  })  : assert(startTimeInHour != null),
        assert(endTimeInHour != null),
        assert(
          endTimeInHour == startTimeInHour || startTimeInHour < endTimeInHour,
        ),
        super(key: key);

  @override
  _HorizontalTimePickerState createState() => _HorizontalTimePickerState();
}

class TimeUnit {
  int _hour;
  int _minute;
  String _time;

  TimeUnit(this._hour, this._minute);

  int get hour => _hour;

  set hour(int value) {
    _hour = value;
  }

  String get time =>
      (_hour < 10 ? '0' : '') +
      _hour.toString() +
      ':' +
      (_minute < 10 ? '0' : '') +
      _minute.toString();

  int get minute => _minute;

  set minute(int value) {
    _minute = value;
  }
}

class _HorizontalTimePickerState extends State<HorizontalTimePicker> {
  final List<TimeUnit> allDateTimeSlots = [];
  List<TimeUnit> selectedDateTimeSlots = [];

  @override
  void initState() {
    super.initState();
    allDateTimeSlots.addAll(getDateTimeSlotList(
        widget.startTimeInHour,
        widget.endTimeInHour,
        widget.timeIntervalInMinutes,
        widget.dateForTime));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: Center(
        child: ListView.builder(
          controller: widget.scrollController ?? ScrollController(),
          scrollDirection: Axis.horizontal,
          itemCount: allDateTimeSlots.length,
          itemBuilder: (context, index) {
            final timeSlotIterated = allDateTimeSlots[index];
            return Row(
              children: <Widget>[
                TimeWidget(
                  key: Key(timeSlotIterated._time),
                  padding: widget.padding,
                  isSelected: isTimeSlotSelected(
                      selectedDateTimeSlots, timeSlotIterated),
                  isDisabled:
                      isTimeSlotDisabled(widget.dateForTime, timeSlotIterated),
                  date: widget.dateForTime,
                  timeUnit: timeSlotIterated,
                  timeTextStyle: widget.timeTextStyle,
                  selectedTimeTextStyle: widget.selectedTimeTextStyle,
                  defaultDecoration: widget.defaultDecoration,
                  selectedDecoration: widget.selectedDecoration,
                  disabledDecoration: widget.disabledDecoration,
                  onTap: () {
                    if (!selectedDateTimeSlots.contains(timeSlotIterated)) {
                      if (widget.maxSelectedDateCount == 1 &&
                          selectedDateTimeSlots.length == 1) {
                        selectedDateTimeSlots.clear();
                      }

                      selectedDateTimeSlots.add(timeSlotIterated);
                      if (widget.onTimeSelected != null) {
                        widget.onTimeSelected(DateTime(
                            widget.dateForTime.year,
                            widget.dateForTime.month,
                            widget.dateForTime.day,
                            timeSlotIterated.hour,
                            timeSlotIterated.minute,
                            0,
                            0,
                            0));
                      }
                    } else {
                      final isRemoved =
                          selectedDateTimeSlots.remove(timeSlotIterated);
                      if (isRemoved && widget.onTimeUnSelected != null) {
                        widget.onTimeUnSelected(DateTime(
                            widget.dateForTime.year,
                            widget.dateForTime.month,
                            widget.dateForTime.day,
                            timeSlotIterated.hour,
                            timeSlotIterated.minute,
                            0,
                            0,
                            0));
                      }
                    }
                    setState(() {
                      selectedDateTimeSlots = selectedDateTimeSlots;
                    });
                  },
                ),
                SizedBox(width: widget.spacingBetweenDates),
              ],
            );
          },
        ),
      ),
    );
  }
}
