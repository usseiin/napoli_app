import 'package:flutter/material.dart';

class FlyScreen extends StatelessWidget {
  const FlyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fly"),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Hero(
            tag: "paint_format",
            child: Icon(
              Icons.format_paint,
              color: Colors.green,
              size: MediaQuery.of(context).size.shortestSide / 2,
            ),
          ),
        ),
      ),
    );
  }
}
