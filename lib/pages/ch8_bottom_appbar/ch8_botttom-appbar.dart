import 'package:flutter/material.dart';

class Ch8BottomAppBar extends StatelessWidget {
  const Ch8BottomAppBar({Key? key}) : super(key: key);
  static const String nameRoute = "/ch8_bottom_appbar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom AppBar"),
      ),
      body: SafeArea(child: Container()),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue.shade200,
        shape: const CircularNotchedRectangle(),
        notchMargin: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(
                Icons.access_alarm,
                color: Colors.white,
              ),
              Icon(
                Icons.bookmark_border,
                color: Colors.white,
              ),
              Icon(
                Icons.flight,
                color: Colors.white,
              ),
              Divider()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue.shade200,
        child: const Icon(Icons.place),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
