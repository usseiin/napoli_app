import 'package:flutter/material.dart';

class Ch7AnimatedController extends StatelessWidget {
  const Ch7AnimatedController({Key? key}) : super(key: key);
  static const String nameRoute = "/ch7_animation/animated_controller";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Controller"),
      ),
      body: const SafeArea(
        child: AnimationControllerWidgets(),
      ),
    );
  }
}

class AnimationControllerWidgets extends StatefulWidget {
  const AnimationControllerWidgets({Key? key}) : super(key: key);

  @override
  State<AnimationControllerWidgets> createState() =>
      _AnimationControllerWidgetsState();
}

class _AnimationControllerWidgetsState extends State<AnimationControllerWidgets>
    with TickerProviderStateMixin {
  late AnimationController _controllerFloatUp;
  late AnimationController _controlleGrowSize;
  late Animation<num> _animationFloatUp;
  late Animation<num> _animationGrowSize;

  @override
  void initState() {
    super.initState();
    _controllerFloatUp = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );
    _controlleGrowSize = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );
  }

  @override
  void dispose() {
    _controlleGrowSize.dispose();
    _controllerFloatUp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double balloonHeigth = MediaQuery.of(context).size.height / 4;
    double balloonwidth = MediaQuery.of(context).size.width / 2;
    double balloonLocation = MediaQuery.of(context).size.height - balloonHeigth;
    _animationFloatUp = Tween(
      begin: balloonLocation,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _controllerFloatUp,
        curve: Curves.linear,
      ),
    );
    _animationGrowSize = Tween(
      begin: 40,
      end: balloonwidth,
    ).animate(
      CurvedAnimation(
        parent: _controlleGrowSize,
        curve: Curves.linear,
      ),
    );
    _controlleGrowSize.forward();
    _controllerFloatUp.forward();

    return AnimatedBuilder(
      animation: _controllerFloatUp,
      builder: (context, child) {
        return Container(
          margin: EdgeInsets.only(
            top: _animationFloatUp.value.toDouble(),
          ),
          width: _animationGrowSize.value.toDouble(),
          child: child,
        );
      },
      child: GestureDetector(
        onTap: () {
          if (_controllerFloatUp.isCompleted) {
            _controllerFloatUp.reverse();
            _controlleGrowSize.reverse();
          } else {
            _controllerFloatUp.forward();
            _controlleGrowSize.forward();
          }
        },
        child: Image.asset(
          "assets/images/balloon.png",
          height: balloonHeigth,
        ),
      ),
    );
  }
}
