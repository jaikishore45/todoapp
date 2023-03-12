import 'package:flutter/material.dart';

import '../model/todo.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> _todos = [];
  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }
}
