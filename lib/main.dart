import 'package:flutter/material.dart';
import 'package:task_app/model/task.dart';

import 'widget/new_task.dart';
import 'widget/task_list.dart';
import 'widget/task_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Task> _task = [];

  void _addNewTask(String taskTitle, DateTime taskDate, IconData taskIcon) {
    var newTask = Task(
      id: DateTime.now().toString(),
      icon: taskIcon,
      title: taskTitle,
      date: taskDate,
    );
    setState(() {
      _task.add(newTask);
    });
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return NewTask(
          addNewTask: _addNewTask,
        );
      },
    );
  }

  void _deleteTask(String id) {
    setState(() {
      _task.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TaskSection(
                  tasks: _task,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Pending',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: TaskList(
                    task: _task,
                    deleteTask: _deleteTask,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 197, 196, 196),
        child: const Icon(Icons.add),
        onPressed: () {
          _showBottomSheet(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
