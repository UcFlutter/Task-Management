import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

import '../model/task.dart';
import 'task_content.dart';

class TaskSection extends StatelessWidget {
  final List<Task> tasks;
  const TaskSection({super.key, required this.tasks});

  String get getTitleBuild {
    var totalOfAmount = 0;
    for (var task in tasks) {
      if (task.title.contains('Build')) {
        totalOfAmount++;
      }
    }
    return totalOfAmount.toString();
  }

  String get getTitleWrite {
    var totalOfAmount = 0;
    for (var task in tasks) {
      if (task.title.contains('Write')) {
        totalOfAmount++;
      }
    }
    return totalOfAmount.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'My Task',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(
              child: Card(
                color:  Color.fromARGB(255, 238, 127, 127),
                elevation: 5,
                child: Container(
                  width: 100,
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 20.0,
                    ),
                    child: TaskContent(
                      contentTitle: 'Code',
                      icon: Icons.computer_rounded,
                      task: getTitleBuild,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Card(
                elevation: 5,
                color: Color.fromARGB(255, 192, 132, 241),
                child: Container(
                  width: 100,
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    child: TaskContent(
                      contentTitle: 'Article',
                      icon: Icons.menu_book_rounded,
                      task: getTitleWrite,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
