import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedOption1 = '01';
  String selectedOption2 = '00';
  String selectedOption3 = 'AM';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('KOLAM'),
            SizedBox(width: 16),
            DropdownButton<String>(
              value: selectedOption1,
              onChanged: (newValue) {
                setState(() {
                  selectedOption1 = newValue;
                });
              },
              items: List<String>.generate(10, (index) => (index + 1).toString().padLeft(2, '0'))
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(width: 16),
            DropdownButton<String>(
              value: selectedOption2,
              onChanged: (newValue) {
                setState(() {
                  selectedOption2 = newValue;
                });
              },
              items: List<String>.generate(60, (index) => index.toString().padLeft(2, '0'))
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(width: 16),
            DropdownButton<String>(
              value: selectedOption3,
              onChanged: (newValue) {
                setState(() {
                  selectedOption3 = newValue;
                });
              },
              items: <String>['AM', 'PM']
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Content goes here'),
      ),
    );
  }
}
