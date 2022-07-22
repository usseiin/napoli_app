import 'package:flutter/material.dart';

class Birthday extends StatelessWidget {
  const Birthday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.cake,
          size: 200,
          color: Colors.orangeAccent,
        ),
      ),
    );
  }
}

class Gratitude extends StatelessWidget {
  const Gratitude({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.sentiment_satisfied,
          size: 200,
          color: Colors.lightGreen,
        ),
      ),
    );
  }
}

class Reminder extends StatelessWidget {
  const Reminder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.access_alarm,
          size: 200,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
