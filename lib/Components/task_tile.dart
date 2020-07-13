import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Models/task_data.dart';

class TaskTile extends StatelessWidget {
  final int index;
  TaskTile({this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskdata, child) {
        return ListTile(
          onLongPress: () {
            taskdata.deleteTask(taskdata.tasks[index], index);
          },
          title: Text(
            taskdata.tasks[index].name,
            style: TextStyle(
              fontSize: 18.0,
              decoration: taskdata.tasks[index].isDone
                  ? TextDecoration.lineThrough
                  : null,
            ),
          ),
          trailing: Checkbox(
            value: taskdata.tasks[index].isDone,
            onChanged: (newValue) {
              taskdata.toggleTask(taskdata.tasks[index], index);
            },
            checkColor: Colors.white,
            activeColor: Colors.lightBlueAccent,
          ),
          contentPadding: EdgeInsets.all(0),
        );
      },
    );
  }
}
