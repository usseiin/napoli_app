import 'package:flutter/material.dart';

class Ch9ListView extends StatelessWidget {
  const Ch9ListView({Key? key}) : super(key: key);
  static const String nameRoute = "/ch9_listview";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return const ListTile(
                title: Text(""),
              );
            },
          ),
        ),
      ),
    );
  }
}
