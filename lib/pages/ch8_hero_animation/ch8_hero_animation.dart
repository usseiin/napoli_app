import 'package:flutter/material.dart';
import 'package:napoli_app/pages/ch8_hero_animation/ch8_fly_screen.dart';

class Ch8HeroAnimation extends StatelessWidget {
  const Ch8HeroAnimation({Key? key}) : super(key: key);
  static const String nameRoute = "/ch8_hero_animation";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hero Animation"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Hero(
                tag: "paint_format",
                child: IconButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const FlyScreen(),
                    ),
                  ),
                  icon: const Icon(
                    Icons.format_paint,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
