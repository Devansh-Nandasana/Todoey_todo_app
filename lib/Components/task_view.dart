import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Models/task_data.dart';

class TaskView extends StatelessWidget {
  const TaskView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<TaskData>(context).tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(
          index: index,
        );
      },
    );
  }
}
