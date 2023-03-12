import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/provider/todos.dart';
import 'package:todo_app/widget/todo_widget.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;
    return todos.isEmpty
        ? const Center(
            child: Text(
            'No Todos',
            style: TextStyle(fontSize: 30),
          ))
        : ListView.separated(
            padding: const EdgeInsets.all(20),
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => Container(
                  height: 10,
                ),
            itemBuilder: (context, index) {
              final todo = todos[index];
              return TodoWidget(todo: todo);
            },
            itemCount: todos.length);
  }
}
