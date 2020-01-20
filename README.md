# horizontal_time_picker

Easy to use, beautiful and customizable time strip component for Flutter

## Getting Started


## Features

- [x] Custom time range (start & end Time)
- [x] `onTimeSelected`, `onTimeUnSelected`events.
- [x] Support custom ScrollController
- [x] Custom [TextStyles] for text
- [x] Custom [TextStyles] for text selected
- [x] Default time cell [Decoration](https://api.flutter.dev/flutter/painting/Decoration-class.html)
- [x] Selected time cell [Decoration](https://api.flutter.dev/flutter/painting/Decoration-class.html)
- [x] Disabled time cell [Decoration](https://api.flutter.dev/flutter/painting/Decoration-class.html)


## Properties

|  Property Name | Property Type | Description  | Default value  |
| ------------------------- | ---------------------------------- | ------------ | ---------------------- |
|  TODO


e.g.
```dart
                          HorizontalTimePicker(
                            key: UniqueKey(),
                            startTimeInHour: 9,
                            endTimeInHour: 24,
                            dateForTime: DateTime.now(),
                            selectedTimeTextStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: "Helvetica Neue",
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                              height: 1.0,
                            ),
                            timeTextStyle: TextStyle(
                              color: Colors.black,
                              fontFamily: "Helvetica Neue",
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                              height: 1.0,
                            ),
                            defaultDecoration: const BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.fromBorderSide(BorderSide(
                                                            color: Color.fromARGB(255, 151, 151, 151),
                                                            width: 1,
                                                            style: BorderStyle.solid,
                                                          )),
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            selectedDecoration: const BoxDecoration(
                              color: Colors.black,
                              border:
                                  Border.fromBorderSide(BorderSide(
                                                            color: Color.fromARGB(255, 151, 151, 151),
                                                            width: 1,
                                                            style: BorderStyle.solid,
                                                          )),
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            disabledDecoration: const BoxDecoration(
                              color: Colors.black26,
                              border:
                                  Border.fromBorderSide(BorderSide(
                                                            color: Color.fromARGB(255, 151, 151, 151),
                                                            width: 1,
                                                            style: BorderStyle.solid,
                                                          )),
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                          ));
``` 