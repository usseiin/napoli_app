import 'package:flutter/material.dart';

class Ch10Layout extends StatelessWidget {
  const Ch10Layout({Key? key}) : super(key: key);
  static const String nameRoute = "/ch9_layout";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Layout"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.red,
            height: 200,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Birthday',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "It's going to be a great birthday we aregoin to dinner at my favorite place. then watch a movie after going to galeteria for ice cream and espresso.",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(
                        Icons.sunny,
                        color: Colors.yellow,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "81\u00b0",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            "4500 San Alpho Drive, Dallas, TX United States",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 8,
                    // runSpacing: 8,
                    children: List.generate(
                      7,
                      (index) {
                        return Chip(
                          label: Text(
                            "Gift ${index + 1}",
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 10,
                            ),
                          ),
                          avatar: const Icon(
                            Icons.card_giftcard,
                            color: Colors.blue,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                            side: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          backgroundColor: Colors.grey.shade100,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                      ),
                      const CircleAvatar(
                        radius: 40,
                      ),
                      const CircleAvatar(
                        radius: 40,
                      ),
                      SizedBox(
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Icon(Icons.cake),
                            Icon(Icons.star_border),
                            Icon(Icons.music_note),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
