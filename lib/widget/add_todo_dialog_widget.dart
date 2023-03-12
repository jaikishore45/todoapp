import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/provider/todos.dart';
import 'package:todo_app/widget/todo_form_widget.dart';

class AddTodoDialogWidget extends StatefulWidget {
  const AddTodoDialogWidget({Key? key}) : super(key: key);

  @override
  State<AddTodoDialogWidget> createState() => _AddTodoDialgWidgetState();
}

class _AddTodoDialgWidgetState extends State<AddTodoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String summary = '';
  String time = '';
  String session = '';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add Todo',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              TodoFormWidget(
                onChangedSummary: (summary) =>
                    setState(() => this.summary = summary),
                onChangedTime: (time) => setState(() => this.time = time),
                onChangedSession: (session) =>
                    setState(() => this.session = session),
                onSavedTodo: addTodo,
              ),
            ]),
      ),
    );
  }

  void addTodo() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return null;
    } else {
      final todo = Todo(
          summary: summary,
          time: time,
          id: DateTime.now().toString(),
          session: session,
          createdTime: DateTime.now());
      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);
      Navigator.of(context).pop();
    }
  }
}
