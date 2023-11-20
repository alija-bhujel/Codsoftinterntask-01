import 'package:hive/hive.dart';
part 'datahome.g.dart';

@HiveType(typeId: 1)
class Add_data extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String describe;
  @HiveField(2)
  String budget;
  @HiveField(3)
  String option;
  @HiveField(4)
  DateTime datetime;
  Add_data(this.option, this.budget, this.datetime, this.describe, this.name);
}
