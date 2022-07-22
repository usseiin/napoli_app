import 'dart:developer' show log;

import 'package:flutter/material.dart';

class Ch11Interactive extends StatefulWidget {
  const Ch11Interactive({Key? key}) : super(key: key);
  static const String nameRoute = "/c11_interactive";

  @override
  State<Ch11Interactive> createState() => _Ch11InteractiveState();
}

class _Ch11InteractiveState extends State<Ch11Interactive> {
  late String _gesture = "";
  _displayGesture(String val) {
    log(val);
    setState(() {
      _gesture = val;
    });
  }

  Color _parseColor = Colors.black45;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gesture Drag Drop"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onDoubleTap: () {
                  _displayGesture("onDoubleTap");
                },
                onTap: () {
                  _displayGesture("onTap");
                },
                onLongPress: () {
                  _displayGesture("onLongPress");
                },
                onPanUpdate: (details) {
                  log(details.toString());
                  _displayGesture("onPanUpadate: \n$details");
                },
                // onVerticalDragUpdate: (details) {
                //   log(details.toString());
                //   _displayGesture("onVerticalDragUpadate: \n$details");
                // },
                // onHorizontalDragUpdate: (details) {
                //   log(details.toString());
                //   _displayGesture("onHorizontalDragUpadate: \n$details");
                // },
                child: Container(
                  width: double.infinity,
                  color: Colors.lightGreen,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.access_alarm,
                          size: 45,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _gesture,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Draggable(
                feedback: const Icon(Icons.brush),
                childWhenDragging: const Icon(Icons.palette),
                data: Colors.orange.value.toInt(),
                child: Column(
                  children: const [
                    Icon(Icons.palette),
                    Text("Drag me below"),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              DragTarget(
                onAccept: (data) =>
                    _parseColor = Color(int.parse(data.toString())),
                builder: (context, candidateData, rejectedData) {
                  return candidateData.isEmpty
                      ? Text(
                          "Drag to the end to see magic",
                          style: TextStyle(
                            color: _parseColor,
                          ),
                        )
                      : Text(
                          'Painting Color: $candidateData',
                          style: TextStyle(
                            color: Color(
                              int.parse(
                                candidateData[0].toString(),
                              ),
                            ),
                            fontWeight: FontWeight.bold,
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
