import 'package:flutter/material.dart';

class Ch6Orientation extends StatelessWidget {
  const Ch6Orientation({Key? key}) : super(key: key);
  static const String nameRoute = "/ch6_orientation";

  @override
  Widget build(BuildContext context) {
    late Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orientation'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Icon(Icons.school, size: 48),
                const Divider(),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                  child: Center(
                    child: Text(orientation == Orientation.portrait
                        ? "portrait"
                        : "LandScape"),
                  ),
                ),
                const Divider(),
                GridView.count(
                  shrinkWrap: true,
                  childAspectRatio: 5,
                  crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
                  children: List.generate(
                    8,
                    (index) {
                      return Center(
                        child: Text("Grid${index + 1}"),
                      );
                    },
                  ),
                ),
                const Divider(),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                  child: Center(
                    child: Text(orientation == Orientation.portrait
                        ? "portrait"
                        : "LandScape"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
