import 'package:flutter/material.dart';

class User {
  final String name;
  final String email;
  Icon profilePic = const Icon(Icons.person, color: Colors.white);
  String backgroundImg = "";

  User({
    required this.name,
    required this.email,
    required this.profilePic,
    required this.backgroundImg,
  });
}
