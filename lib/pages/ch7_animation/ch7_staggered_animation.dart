import 'package:flutter/material.dart';

class Ch7StaggeredAnimation extends StatelessWidget {
  const Ch7StaggeredAnimation({Key? key}) : super(key: key);
  static const String nameRoute = "/ch7_aimation/staggered_animation";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StaggeredAnimation"),
      ),
      body: const SafeArea(
        child: StaggeredAnimation(),
      ),
    );
  }
}

class StaggeredAnimation extends StatefulWidget {
  const StaggeredAnimation({Key? key}) : super(key: key);

  @override
  State<StaggeredAnimation> createState() => _StaggeredAnimationState();
}

class _StaggeredAnimationState extends State<StaggeredAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<num> _animationGrowSize;
  late Animation<num> _animationFloatUp;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double balloonHeight = MediaQuery.of(context).size.height / 4;
    double balloonWidth = MediaQuery.of(context).size.width / 1.2;
    double balloonLocation = MediaQuery.of(context).size.height - balloonHeight;
    _animationFloatUp = Tween(
      begin: balloonLocation,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          1.0,
          curve: Curves.ease,
        ),
      ),
    );
    _animationGrowSize = Tween(
      begin: 100,
      end: balloonWidth,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          1.0,
          curve: Curves.ease,
        ),
      ),
    );
    _controller.forward();
    return AnimatedBuilder(
      animation: _controller,
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
        child: Image.asset(
          "assets/images/balloon.png",
        ),
        onTap: () {
          if (_controller.isCompleted) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
      ),
    );
  }
}
