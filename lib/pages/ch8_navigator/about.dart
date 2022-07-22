import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  final int radioGroupValue;
  const AboutPage({Key? key, required this.radioGroupValue}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Page"),
      ),
    );
  }
}
