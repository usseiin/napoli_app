import 'package:flutter/material.dart';
import 'package:napoli_app/pages/ch5_widgets_tree/widget.dart';

class Ch5Basics extends StatefulWidget {
  const Ch5Basics({Key? key}) : super(key: key);
  static const String nameRoute = "ch5_basics";

  @override
  State<Ch5Basics> createState() => _Ch5BasicsState();
}

class _Ch5BasicsState extends State<Ch5Basics> {
  dynamic selectedItem = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BuildAppBar(
        prefferredSize: Size(double.infinity, 130),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const FlutterMobile(),
                const SizedBox(height: 32),
                const ColumnWidgets(),
                const SizedBox(height: 32),
                const RowWdget(),
                const SizedBox(height: 32),
                const ColumnRowNextingWidget(),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    TextButton(
                      onPressed: null,
                      child: Text("Flag"),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: null,
                      child: Text("Flag"),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const IconButton(
                      onPressed: null,
                      icon: Icon(Icons.flight),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.flight,
                        size: 36,
                        color: Colors.green.shade800,
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ElevatedButton(
                      onPressed: null,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        child: Text(
                          "save",
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.save,
                        size: 36,
                        color: Colors.green.shade800,
                      ),
                    ),
                  ],
                ),
                const Divider(),
                const BuildPopMenuBottom(),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.map),
                    Icon(Icons.airport_shuttle),
                    Icon(Icons.brush),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.green.shade100,
        child: const Icon(
          Icons.play_arrow,
          size: 32,
        ),
      ),
      bottomNavigationBar: const BuildBottomAppBar(),
    );
  }
}
