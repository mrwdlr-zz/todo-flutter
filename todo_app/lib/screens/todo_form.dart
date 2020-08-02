import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create todo"),
      ),
      body: Center(
        child: Text("This will be the add form"),
      ),
    );
  }
}
