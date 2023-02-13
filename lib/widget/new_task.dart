import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class NewTask extends StatefulWidget {
  final Function addNewTask;
  const NewTask({super.key, required this.addNewTask});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final _titleController = TextEditingController();


  DateTime? _selectedDate;

  IconData? _selectedIcon;

  pickIcon() async {
    await FlutterIconPicker.showIconPicker(context).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedIcon = value;
      });
    });
  }

  submitNewTask() {
    var taskTitle = _titleController.text;
    if (taskTitle == null) {
      return;
    }

    widget.addNewTask(
      taskTitle,
      _selectedDate,
      _selectedIcon,
    );
    Navigator.pop(context);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2024),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Title'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _selectedDate == null
                    ? 'No Date Chosen'
                    : DateFormat.yMMMd().format(_selectedDate!),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              TextButton(
                onPressed: () {
                  _showDatePicker();
                },
                child: const Text(
                  'Choose Date',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _selectedIcon == null
                  ? const Text(
                      'No Icon Chosen',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Icon(
                      _selectedIcon,
                      size: 50,
                    ),
              TextButton(
                onPressed: pickIcon,
                child: const Text('Choose Icon'),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
            onPressed: submitNewTask,
            child: const Text('Add Task'),
          ),
        )
      ],
    );
  }
}
