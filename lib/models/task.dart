import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String tag;

  @HiveField(3)
  bool isDone;
  //Добавить позже остальные данные о задаче

  Task({
    required this.id,
    required this.title,
    this.isDone = false,
    required this.tag,
  });
}
