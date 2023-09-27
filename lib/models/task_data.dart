import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy Pens.'),
    Task(name: 'Talk to mom.'),
    Task(name: 'Go for walk.'),
  ];

  UnmodifiableListView get tasks => UnmodifiableListView(_tasks);

  int get taskCount => _tasks.length;

  void addItem(Task task) {
    _tasks.add(task);
    notifyAll();
  }

  void removeItem(Task task) {
    _tasks.remove(task);
    notifyAll();
  }

  void notifyAll() {
    notifyListeners();
  }
}
