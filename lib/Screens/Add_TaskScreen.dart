import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String taskDescription;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 40.0,
          left: 40.0,
          right: 40.0,
          bottom: 40.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newValue) {
                taskDescription = newValue;
              },
            ),
            FlatButton(
              color: Colors.lightBlueAccent,
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(taskDescription);
                Navigator.pop(context);
              },
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
