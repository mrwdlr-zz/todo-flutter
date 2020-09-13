import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/state/todo_model.dart';

class ScreenArguments {
  final int todoId;

  ScreenArguments(this.todoId);
}

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
  bool isEditForm = false;
  var editableTodo;

  final TodoModel todoModel;

  TodoFormState({this.todoModel});

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void createTodo(Function addTodo) {
    var todo = new Todo(
        title: titleController.text, description: descriptionController.text);
    addTodo(todo);
    Navigator.pop(context);
  }

  void editTodo(Function editTodo) {
    editTodo(editableTodo.id, titleController.text, descriptionController.text);
    Navigator.pop(context);
  }

  void deleteTodo(Function deleteTodo) {
    deleteTodo(editableTodo.id);
    Navigator.pop(context);
  }

  void loadTodoForEdit(BuildContext context) {
    final ScreenArguments arguments = ModalRoute.of(context).settings.arguments;
    if (arguments != null && arguments.todoId != null) {
      isEditForm = true;

      editableTodo = new TodoModel().read(arguments.todoId);
      titleController.text = editableTodo.title;
      descriptionController.text = editableTodo.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    loadTodoForEdit(context);
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
                    child: Text(isEditForm ? "Update" : "Save"),
                    onPressed: () => {
                      isEditForm
                          ? editTodo(todoModel.update)
                          : createTodo(todoModel.add)
                    },
                  ),
                  isEditForm
                      ? RaisedButton(
                          child: Text("Delete"),
                          onPressed: () => deleteTodo(todoModel.delete),
                        )
                      : new Container()
                ])));
  }
}
