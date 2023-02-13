import 'package:flutter/material.dart';

class TaskContent extends StatelessWidget {
  final String? task;
  final String contentTitle;
  final IconData icon;
  const TaskContent({
    super.key,
    required this.contentTitle,
    required this.icon,
    this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 50,
          color: Colors.white,
        ),
        Text(
          contentTitle,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: FittedBox(
                child: Text(
                  '${task!} tasks',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Expanded(
              child: Icon(
                Icons.arrow_circle_right,
                color: Colors.white,
                size: 35,
              ),
            ),
          ],
        )
      ],
    );
  }
}
