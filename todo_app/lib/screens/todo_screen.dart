import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/state/todo_model.dart';

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo list"),
      ),
      body: TodoList(),
    );
  }
}

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoModel>(
        builder: (context, todoList, child) =>
            ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: todoList.todos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    child: Center(child: Text(todoList.todos[index].title)),
                  );
                }));
  }
}
