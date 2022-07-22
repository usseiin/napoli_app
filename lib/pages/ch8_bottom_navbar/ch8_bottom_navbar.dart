import 'package:flutter/material.dart';
import 'package:napoli_app/pages/widgets.dart';

class Ch8BottomNavbar extends StatefulWidget {
  const Ch8BottomNavbar({Key? key}) : super(key: key);
  static const nameRoute = "/ch8_navbar";

  @override
  State<Ch8BottomNavbar> createState() => _Ch8BottomNavbarState();
}

class _Ch8BottomNavbarState extends State<Ch8BottomNavbar> {
  List<Widget> pages = [];
  late Widget _currentPage;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    pages
      ..add(const Birthday())
      ..add(const Reminder())
      ..add(const Gratitude());
    _currentPage = pages[_currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navbar'),
      ),
      body: SafeArea(child: _currentPage),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
            _currentPage = pages[_currentIndex];
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.cake),
            label: "Birthday",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm),
            label: 'Reminder',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sentiment_satisfied),
            label: "Gratitude",
          ),
        ],
      ),
    );
  }
}
