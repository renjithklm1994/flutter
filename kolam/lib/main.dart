import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:myapp/db/functions/db_functions.dart';


import 'db/model/data_model.dart';

Future<void> main() async{
  Hive.initFlutter();
if(!Hive.isAdapterRegistered(StudentModelAdapter().typeId))
{
  Hive.registerAdapter(StudentModelAdapter());
}
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
    var _num1Controller;
    var _num2Controller;
    getAllStudents();
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
              items: List<String>.generate(12, (index) => (index + 1).toString().padLeft(2, '0'))
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
        
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Number 1'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Number 2'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Retrieve the entered numbers from the controllers
                double number1 = double.tryParse(_num1Controller.text) ?? 0.0;
                double number2 = double.tryParse(_num2Controller.text) ?? 0.0;

                // You can perform any operation you want with these numbers here
                // For example, you can add them, subtract them, etc.

                // For now, let's just print the sum
                double sum = number1 + number2;
                print('Sum: $sum');
              },
              child: Text('Calculate Sum'),
            ),
          ],
        ),
      ),
    );
  }
}