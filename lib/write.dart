import 'package:flutter/material.dart';

import 'data/todo.dart';

class TodoWritePage extends StatefulWidget {

  final Todo todo;

  const TodoWritePage({ Key key, this.todo }) : super(key: key);
  
  @override
  _TodoWritePageState createState() => _TodoWritePageState();
}

class _TodoWritePageState extends State<TodoWritePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('...'),
        actions: [

        ],
      ),


    );
  }
}