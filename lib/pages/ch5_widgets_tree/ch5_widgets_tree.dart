import 'package:flutter/material.dart';
import 'package:napoli_app/pages/ch5_widgets_tree/widgets.dart';

class Ch5WidgetsTree extends StatelessWidget {
  const Ch5WidgetsTree({Key? key}) : super(key: key);
  static const String nameRoute = "/ch5_widgets_tree";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ch5_widgets_tree"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            RowContainer(),
            Divider(),
            ColumnContainer(),
            Divider(),
            StackContainer(),
            Divider(),
            Text("End of the line")
          ],
        ),
      ),
    );
  }
}
