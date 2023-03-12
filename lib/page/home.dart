import 'package:flutter/material.dart';

import '../widget/add_todo_dialog_widget.dart';
import '../widget/todo_list_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      const TodoListWidget(),
      Container(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) => const AddTodoDialogWidget());
        },
      ),
    );
  }
}
