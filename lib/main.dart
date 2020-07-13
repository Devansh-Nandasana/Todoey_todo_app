import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Models/task_data.dart';
import 'package:todoey/Screens/Tasks_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return TaskData();
      },
      builder: (context, child) => MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}
