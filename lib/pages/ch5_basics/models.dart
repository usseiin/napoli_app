import 'package:flutter/material.dart';

class TodoMenuItem {
  final String title;
  final Icon icon;

  TodoMenuItem({required this.title, required this.icon});
}

List foodMenuItem = <TodoMenuItem>[
  TodoMenuItem(
    title: "Fast Food",
    icon: const Icon(Icons.fastfood),
  ),
  TodoMenuItem(
    title: "Remind me",
    icon: const Icon(Icons.add_alarm),
  ),
  TodoMenuItem(
    title: "Flight 1",
    icon: const Icon(Icons.flight),
  ),
  TodoMenuItem(
    title: "Music",
    icon: const Icon(Icons.music_note),
  ),
];
