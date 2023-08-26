import 'package:hive/hive.dart';

part 'person.g.dart';

@HiveType(typeId: 1)
class Person {
  Person({
     this.num1,
     this.num2,
  });
  @HiveField(0)
  double num1;

  @HiveField(1)
  double num2;

 
}

