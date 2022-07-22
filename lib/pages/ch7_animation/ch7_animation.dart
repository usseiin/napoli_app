import 'package:flutter/material.dart';
import 'package:napoli_app/pages/ch7_animation/ch7_animation_controller.dart';
import 'package:napoli_app/pages/ch7_animation/ch7_staggered_animation.dart';

class Ch7Animation extends StatefulWidget {
  const Ch7Animation({Key? key}) : super(key: key);
  static const String nameRoute = "/ch7_animation";

  @override
  State<Ch7Animation> createState() => _Ch7AnimationState();
}

class _Ch7AnimationState extends State<Ch7Animation> {
  double _width = 100;
  final double _heigth = 100;
  void _increaseWidth() {
    setState(() {
      _width < 320 ? _width += 50 : _width = 100;
    });
  }

  _showFade() {
    setState(() {
      _showFirst = !_showFirst;
    });
  }

  _showOpacity() {
    setState(() {
      _toOpaque = !_toOpaque;
    });
  }

  bool _showFirst = true;
  bool _toOpaque = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => _increaseWidth(),
              child: Container(
                width: _width,
                height: _heigth,
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                ),
                child: const Center(
                  child: Text("Tap to\ngrown\nwidth"),
                ),
              ),
            ),
            const Divider(),
            Stack(
              children: [
                AnimatedCrossFade(
                  firstChild: Container(
                    width: 100,
                    height: 100,
                    color: Colors.yellow,
                  ),
                  secondChild: Container(
                    width: 150,
                    height: 150,
                    color: Colors.blue,
                  ),
                  alignment: Alignment.topLeft,
                  firstCurve: Curves.easeIn,
                  secondCurve: Curves.easeIn,
                  crossFadeState: _showFirst
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(
                    milliseconds: 500,
                  ),
                ),
                Positioned.fill(
                  child: OutlinedButton(
                    onPressed: _showFade,
                    child: const Text(
                      "Tap\nto Resise\nand change\nColor",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            Stack(
              children: [
                AnimatedOpacity(
                  opacity: _toOpaque ? .3 : 1,
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    color: Colors.green,
                    width: 100,
                    height: 100,
                    child: const Center(
                      child: Text(
                        'Tap\nto show\nOpacity',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: ElevatedButton(
                    onPressed: _showOpacity,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.transparent,
                      ),
                    ),
                    child: const Text(""),
                  ),
                ),
              ],
            ),
            const Divider(),
            TextButton(
              onPressed: () => Navigator.of(context)
                  .pushNamed(Ch7AnimatedController.nameRoute),
              child: const Text("Try Animated controller"),
            ),
            const Divider(),
            TextButton(
              onPressed: () => Navigator.of(context)
                  .pushNamed(Ch7StaggeredAnimation.nameRoute),
              child: const Text("Try Staggered Animated controller"),
            ),
          ],
        ),
      ),
    );
  }
}
