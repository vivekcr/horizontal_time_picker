import 'package:flutter/material.dart';
import 'package:horizontal_time_picker/horizontal_time_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horizontal Time Picker Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Horizontal Time Picker Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: HorizontalTimePicker(
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
            border: Border.fromBorderSide(BorderSide(
              color: Color.fromARGB(255, 151, 151, 151),
              width: 1,
              style: BorderStyle.solid,
            )),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          selectedDecoration: const BoxDecoration(
            color: Colors.black,
            border: Border.fromBorderSide(BorderSide(
              color: Color.fromARGB(255, 151, 151, 151),
              width: 1,
              style: BorderStyle.solid,
            )),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          disabledDecoration: const BoxDecoration(
            color: Colors.black26,
            border: Border.fromBorderSide(BorderSide(
              color: Color.fromARGB(255, 151, 151, 151),
              width: 1,
              style: BorderStyle.solid,
            )),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ));
  }
}
