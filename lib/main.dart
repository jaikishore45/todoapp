import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/provider/todos.dart';
import 'page/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TodosProvider(),
        child: const MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          home: Home(),
        ));
  }
}
