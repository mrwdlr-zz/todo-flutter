import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class TodoEntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create todo"),
        ),
        body: TodoForm());
  }
}

class TodoForm extends StatefulWidget {
  @override
  TodoFormState createState() {
    return TodoFormState();
  }
}

class TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void createTodo() {
    var todo = new Todo(
        id: 3,
        title: titleController.text,
        description: descriptionController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          TextFormField(
            controller: titleController,
          ),
          TextFormField(
            controller: descriptionController,
          ),
          RaisedButton(
            child: Text("Save"),
            onPressed: () => {},
          )
        ]));
  }
}
