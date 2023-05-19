import 'package:hive/hive.dart';
part 'add_todo.g.dart';

@HiveType(typeId: 2)
class Add_todo extends HiveObject {
  @HiveField(0)
  String name;
  Add_todo(this.name);
}
