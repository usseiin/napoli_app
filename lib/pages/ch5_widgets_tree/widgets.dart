import 'package:flutter/material.dart';

class RowContainer extends StatelessWidget {
  const RowContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.yellow,
          ),
        ),
        const SizedBox(width: 32),
        Expanded(
          child: Container(
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.yellow,
            ),
          ),
        ),
        const SizedBox(width: 32),
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.yellow,
          ),
        ),
      ],
    );
  }
}

class ColumnContainer extends StatelessWidget {
  const ColumnContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(color: Colors.yellow),
          width: 60,
          height: 60,
        ),
        const SizedBox(height: 32),
        Container(
          decoration: const BoxDecoration(color: Colors.yellow),
          width: 40,
          height: 40,
        ),
        const SizedBox(height: 32),
        Container(
          decoration: const BoxDecoration(color: Colors.brown),
          width: 20,
          height: 20,
        ),
      ],
    );
  }
}

class StackContainer extends StatelessWidget {
  const StackContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 100,
      backgroundColor: Colors.green,
      child: Stack(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.yellow,
            ),
          ),
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              color: Colors.amber,
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.brown,
            ),
          ),
        ],
      ),
    );
  }
}
