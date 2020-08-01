import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/state/todo_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoModel(),
      child: TodoListApp(),
    ),
  );
}

class TodoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo list',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Todo list"),
        ),
      ),
    );
  }
}
