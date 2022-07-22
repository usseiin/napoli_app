import 'package:flutter/material.dart';
import 'package:napoli_app/pages/ch8_navigator/about.dart';
import 'package:napoli_app/pages/ch8_navigator/gratitude.dart';

class Ch8Navigator extends StatefulWidget {
  const Ch8Navigator({Key? key}) : super(key: key);
  static const String nameRoute = "ch8_navigator";

  @override
  State<Ch8Navigator> createState() => _Ch8NavigatorState();
}

class _Ch8NavigatorState extends State<Ch8Navigator> {
  String _text = "...";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigator"),
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutPage(
                    radioGroupValue: -1,
                  ),
                  fullscreenDialog: true,
                ),
              ),
            },
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Greater for: $_text",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final gratitudeResponse = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const GratitudePage(radioGroupValue: -1),
            ),
          );
          setState(() {
            _text = gratitudeResponse ?? " ";
          });
        },
        child: const Icon(Icons.sentiment_satisfied),
      ),
    );
  }
}
