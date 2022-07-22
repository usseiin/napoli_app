import 'package:flutter/material.dart';
import 'package:napoli_app/pages/widgets.dart';

class Ch8TabBar extends StatefulWidget {
  const Ch8TabBar({Key? key}) : super(key: key);
  static const String nameRoute = "/ch8_tab_bar";

  @override
  State<Ch8TabBar> createState() => _Ch8TabBarState();
}

class _Ch8TabBarState extends State<Ch8TabBar> with TickerProviderStateMixin {
  late TabController _controller;
  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    pages
      ..add(const Birthday())
      ..add(const Reminder())
      ..add(const Gratitude());
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar'),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _controller,
          children: [...pages],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TabBar(
            controller: _controller,
            labelColor: Colors.black38,
            unselectedLabelColor: Colors.black26,
            indicatorColor: Colors.blue,
            tabs: const [
              Tab(
                icon: Icon(Icons.cake),
                text: "Birthday",
              ),
              Tab(
                icon: Icon(Icons.access_alarm),
                text: "Reminder",
              ),
              Tab(
                icon: Icon(Icons.sentiment_satisfied),
                text: "Gratitude",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
