import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class TodoModel extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(id: 1, title: "First Todo", description: "My first todo"),
    Todo(id: 2, title: "Second todo", description: "My second todo")
  ];

  UnmodifiableListView<Todo> get todos => UnmodifiableListView(_todos);

  void add(Todo todo) {
    todo.id = todos.last.id + 1;
    _todos.add(todo);
    notifyListeners();
  }

  Todo read(int id){
    return _todos.firstWhere((element) => element.id == id);
  }

  void toggleDone(int id) {
    var index = _todos.indexWhere((element) => element.id == id);
    _todos[index].isDone = !_todos[index].isDone;
    notifyListeners();
  }

  void remove(int id) {
    _todos.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
