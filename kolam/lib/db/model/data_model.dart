import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class StudentModel{
  @HiveField(0)
  final int num1;
  @HiveField(1)
  final int num2;
  
  StudentModel({ this.num1 , this.num2});
}

