import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:myapp/boxes.dart';
import 'package:myapp/db/functions/db_functions.dart';


import 'db/model/person.dart';

Future<void> main() async{
 await Hive.initFlutter();
Hive.registerAdapter(PersonAdapter());
   boxPersons = await Hive.openBox<Person>('personBox');
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

  TextEditingController _num1Controller = TextEditingController();
  TextEditingController _num2Controller = TextEditingController();

  @override
  void dispose() {
    _num1Controller.dispose();
    _num2Controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var _num1Controller;
    var _num2Controller;
    
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
                //setState((){
                
                  //boxPersons.put('Key_${nameController.text}',Person(num1:nameController.text,num2:int.parse(ageController.text)),);
                //});
                // Retrieve the entered numbers from the controllers
                double number1 = double.tryParse(_num1Controller.text) ?? 0.0;
                double number2 = double.tryParse(_num2Controller.text) ?? 0.0;

                // You can perform any operation you want with these numbers here
                // For example, you can add them, subtract them, etc.

                // For now, let's just print the sum
               // Add a new person to the boxPersons
                boxPersons.add(Person(num1: number1, num2: number2));
                
                setState(() {
                  // Clear the text fields after adding a person
                  _num1Controller.clear();
                  _num2Controller.clear();
                });
              },
              
              child: Text('Calculate Sum'),
            ),
          
      Expanded(
  child: Padding(
    padding: const EdgeInsets.all(5.0),
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: boxPersons.length, // Change this to the actual number of items
          itemBuilder: (context, index) {
            var person = boxPersons.getAt(index)as Person;

            return ListTile(
              leading: IconButton(
                onPressed: () {
                  // Add functionality to the IconButton
                  // For example, you can remove the item from the list
                  setState(() {
                    boxPersons.deleteAt(index);
                    // Assuming you have a List of items named 'itemsList'
                    
                  });
                },
                icon: const Icon(
                  Icons.remove,
              ),
              ),
              title: Text('Num1: ${person.num1}'),
              subtitle: Text('Num2: ${person.num2.toString()}'),
              trailing: Text('Sum: ${person.num1 + person.num2}')
            );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}