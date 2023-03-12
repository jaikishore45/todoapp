import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String summary;
  final String time;
  final String session;
  final ValueChanged<String> onChangedSummary;
  final ValueChanged<String> onChangedTime;
  final ValueChanged<String> onChangedSession;
  final VoidCallback onSavedTodo;
  const TodoFormWidget(
      {Key? key,
      this.summary = '',
      this.time = '',
      this.session = '',
      required this.onChangedSummary,
      required this.onChangedTime,
      required this.onChangedSession,
      required this.onSavedTodo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        buildSummary(),
        const SizedBox(height: 10),
        buildTime(),
        const SizedBox(height: 10),
        buildSession(),
        const SizedBox(height: 10),
        buildButton(),
      ]),
    );
  }

  Widget buildSummary() {
    return TextFormField(
      initialValue: summary,
      onChanged: onChangedSummary,
      validator: (summary) {
        if (summary!.isEmpty) {
          return 'Enter summary';
        }
        return null;
      },
      decoration: const InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: 'Summary',
      ),
    );
  }

  Widget buildTime() {
    return TextFormField(
      maxLines: 1,
      initialValue: time,
      onChanged: onChangedTime,
      validator: (time) {
        if (time!.isEmpty) {
          return 'Enter time';
        }
        return null;
      },
      decoration: const InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: 'Time',
      ),
    );
  }

  Widget buildSession() {
    return TextFormField(
      maxLines: 1,
      initialValue: session,
      onChanged: onChangedSession,
      validator: (session) {
        if (session!.isEmpty) {
          return 'Enter session';
        }
        return null;
      },
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Session',
      ),
    );
  }

  Widget buildButton() {
    return ElevatedButton(
        onPressed: onSavedTodo, child: const Text('Submit Task'));
  }
}
