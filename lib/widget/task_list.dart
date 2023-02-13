import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/task.dart';

class TaskList extends StatelessWidget {
  final List<Task> task;
  final Function deleteTask;
  const TaskList({super.key, required this.task, required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return task.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "NO TASK FOUND",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset('images/waiting.png'),
                ),
              ],
            ),
          )
        : ListView.separated(
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.grey,
              );
            },
            itemBuilder: (context, index) {
              return ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      task[index].icon,
                    ),
                  ),
                  title: Text(
                    task[index].title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      const Icon(Icons.timer_sharp),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        DateFormat.yMMMd().format(task[index].date),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => deleteTask(task[index].id),
                  ));
            },
            itemCount: task.length,
          );
  }
}
