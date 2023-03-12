import 'package:flutter/material.dart';

class TodoField {
  static const createdTime = 'createdTime';
}

class Todo {
  late DateTime createdTime;
  late String summary;
  late String time;
  late String session;
  late String id;
  late bool isDone;

  Todo({
    required this.createdTime,
    required this.summary,
    required this.time,
    required this.id,
    required this.session,
    this.isDone = false,
  });
}
