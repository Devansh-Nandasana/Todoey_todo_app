import 'package:flutter/material.dart';
import 'package:todoey/Screens/Add_TaskScreen.dart';
import 'package:todoey/Models/task_data.dart';
import 'package:todoey/Components/task_view.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  Future<void> init2() async {
    await Provider.of<TaskData>(
      context,
      listen: false,
    ).initiate();
    Provider.of<TaskData>(
      context,
      listen: false,
    ).initiatecolIDValue();
  }

  int flag = 0;
  @override
  Widget build(BuildContext context) {
    if (flag == 0) {
      init2();
      flag = 1;
    }
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<Widget>(
              backgroundColor: Color(0xff757575),
              context: context,
              builder: (BuildContext context) {
                return AddTaskScreen();
              });
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          size: 30.0,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 40.0,
                left: 40.0,
                right: 40.0,
                bottom: 40.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: 50.0,
                      color: Colors.lightBlueAccent,
                    ),
                    backgroundColor: Colors.white,
                    radius: 40.0,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Todoey',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 70.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    // 'sads',
                    '${Provider.of<TaskData>(context).tasks.length} Tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
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
                  child: TaskView(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
