import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/todo_form.dart';
import 'package:todo_app/state/todo_model.dart';

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo list"),
      ),
      body: TodoList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {Navigator.pushNamed(context, "/entry")},
      ),
    );
  }
}

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoModel>(
        builder: (context, todoModel, child) => ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: todoModel.todos.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(
                        value: todoModel.todos[index].isDone,
                        onChanged: (bool newValue) =>
                        {todoModel.toggleDone(todoModel.todos[index].id)},
                      ),
                      Text(todoModel.todos[index].title),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => {
                          Navigator.pushNamed(context, "/entry",
                              arguments:
                                  ScreenArguments(todoModel.todos[index].id))
                        },
                      )
                    ]),
              );
            }));
  }
}
