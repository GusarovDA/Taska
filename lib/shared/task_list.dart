import 'package:flutter/material.dart';
import 'package:flutter_dev_test/constans/colors.dart';
import 'package:flutter_dev_test/constans/dimensions.dart';
import 'package:flutter_dev_test/models/task.dart';
import 'package:flutter_dev_test/shared/task_line.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  Color _dragColor = colorActiveCheckbox;
  final Box<Task> taskBox = Hive.box<Task>('tasks_box');

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.sizeOf(context).height;
    var screenWidth = MediaQuery.sizeOf(context).width;
    return ValueListenableBuilder(
      valueListenable: taskBox.listenable(),
      builder: (context, Box<Task> box, _) {
        final tasks = box.values.toList();

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: taskBox.length,
          itemBuilder: (context, index) {
            final task = tasks[index];

            return Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Dismissible(
                  key: ValueKey(task.id),
                  background: Container(
                    decoration: BoxDecoration(color: colorActiveCheckbox),

                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                      left: screenWidth * (26 / designWidth),
                    ),
                    child: const Icon(Icons.check, color: Colors.white),
                  ),
                  secondaryBackground: Container(
                    decoration: BoxDecoration(color: colorDeleteSvipe),

                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(
                      right: screenWidth * (26 / designWidth),
                    ),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),

                  confirmDismiss: (direction) async {
                    if (direction == DismissDirection.startToEnd) {
                      task.isDone = !task.isDone;
                      task.save();
                      return false;
                    }
                    return true;
                  },
                  onDismissed: (direction) {
                    if (direction == DismissDirection.endToStart) {
                      task.delete();
                    }
                  },
                  onUpdate: (details) {
                    setState(() {
                      if (details.direction == DismissDirection.startToEnd) {
                        _dragColor = colorActiveCheckbox;
                      } else if (details.direction ==
                          DismissDirection.endToStart) {
                        _dragColor = colorDeleteSvipe;
                      }
                    });
                  },
                  child: Stack(
                    children: [
                      Container(
                        color: _dragColor,
                        height: screenHeight * (68 / designHeight),
                        width: screenWidth * (327 / designWidth),
                      ),
                      Positioned(
                        child: ClipRRect(child: TaskLine(task: task)),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
