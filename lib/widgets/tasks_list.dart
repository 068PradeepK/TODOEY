import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'task_tile.dart';
import 'package:todoey_flutter/models/task.dart';

//This is a very old Project
class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final Task task = taskData.tasks[index];
            return TaskTile(
              isChecked: task.isDone,
              taskTitle: task.name,
              checkBoxCallback: (bool checkBoxState) {
                task.toggleDone();
                taskData.notifyAll();
              },
              longPressAction: () {
                taskData.removeItem(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
