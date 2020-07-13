import 'package:flutter/foundation.dart';

class Task extends ChangeNotifier {
  String name;
  bool isDone;
  Task({this.isDone = false, this.name});

  void toggleDone() {
    isDone = !isDone;
    notifyListeners();
  }
}
