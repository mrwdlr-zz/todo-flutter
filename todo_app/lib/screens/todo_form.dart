import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/state/todo_model.dart';

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

  final TodoModel todoModel;

  TodoFormState({this.todoModel});

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void createTodo(addTodo) {
    var todo = new Todo(
        title: titleController.text,
        description: descriptionController.text
    );
    addTodo(todo);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Consumer<TodoModel>(
            builder: (context, todoModel, child) => Column(children: <Widget>[
                  TextFormField(
                    controller: titleController,
                  ),
                  TextFormField(
                    controller: descriptionController,
                  ),
                  RaisedButton(
                    child: Text("Save"),
                    onPressed: () => {createTodo(todoModel.add)},
                  )
                ])));
  }
}
