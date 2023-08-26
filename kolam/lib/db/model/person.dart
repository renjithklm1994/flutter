import 'package:hive/hive.dart';

part 'person.g.dart';

@HiveType(typeId: 1)
class Person {
  Person({
     this.name,
     this.age,
  });
  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

 
}

