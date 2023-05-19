import 'package:hive/hive.dart';
part 'add_pre.g.dart';

@HiveType(typeId: 3)
class Add_pre extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String explain;
  @HiveField(2)
  String amount;
  @HiveField(3)
  String in_;
  @HiveField(4)
  String horas;
  Add_pre(this.horas, this.in_, this.amount, this.explain, this.name);
}
