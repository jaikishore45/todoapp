import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                todo.session,
                style: const TextStyle(fontSize: 30),
              ),
              if (todo.time.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  child: Text(todo.time, style: const TextStyle(fontSize: 15)),
                ),
              if (todo.summary.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  child:
                      Text(todo.summary, style: const TextStyle(fontSize: 22)),
                ),
            ],
          ))
        ],
      ),
    );
  }
}
