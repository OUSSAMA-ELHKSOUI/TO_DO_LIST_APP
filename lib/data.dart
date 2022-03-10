import 'package:Todoey/database/sql.dart';
import 'package:flutter/cupertino.dart';
import 'task.dart';

class Data extends ChangeNotifier {
  List<Task> tasks = [];
  Sql sql = Sql();

  void addTask(String taskName) {
    tasks.add(Task(name: taskName));
    sql.save(Task(name: taskName));
    notifyListeners();
  }

  void getTasks() async {
    tasks = await sql.getTasks();
    notifyListeners();
  }

  void changeInTask(Task task) {
    task.changeBool();
    notifyListeners();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    sql.delete(tasks[index].name);
    notifyListeners();
  }
}
