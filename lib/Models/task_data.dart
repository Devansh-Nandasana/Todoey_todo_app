import 'package:todoey/Models/task.dart';
import 'package:flutter/foundation.dart';
import 'package:todoey/Utils/database.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];
  List<int> colIDValue;

  Future<void> initiate() async {
    print('YOYOYOYOY');
    print(tasks);
    tasks = await DatabaseHelper.instance.getInitialValue();
    notifyListeners();
  }

  void initiatecolIDValue() {
    colIDValue = DatabaseHelper.instance.givecolIDValue();
  }

  void addTask(String desc) async {
    Task task = Task(name: desc);
    tasks.add(task);
    notifyListeners();
    int newID = await DatabaseHelper.instance.insert(desc);
    colIDValue.add(newID);
  }

  void toggleTask(Task task, int index) async {
    task.toggleDone();
    notifyListeners();
    await DatabaseHelper.instance.update(task, colIDValue[index]);
  }

  void deleteTask(Task task, int index) async {
    tasks.remove(task);
    notifyListeners();
    await DatabaseHelper.instance.delete(colIDValue[index]);
    colIDValue.removeAt(index);
  }
}
