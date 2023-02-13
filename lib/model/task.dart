import 'package:flutter/material.dart';

class Task {
  String id;
  IconData icon;
  String title;
  DateTime date;

  Task({
    required this.id,
    required this.icon,
    required this.title,
    required this.date,
  });
}
