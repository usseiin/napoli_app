import 'dart:developer';

import 'package:flutter/material.dart';

class Ch11GestureScale extends StatefulWidget {
  const Ch11GestureScale({Key? key}) : super(key: key);
  static const String nameRoute = "/ch11_gesture_scale";

  @override
  State<Ch11GestureScale> createState() => _Ch11GestureScaleState();
}

class _Ch11GestureScaleState extends State<Ch11GestureScale> {
  Offset _startLastOffset = Offset.zero;
  Offset _currentOffset = Offset.zero;
  Offset _lastOffset = Offset.zero;
  double _lastScale = 1.0;
  double _currentScale = 1.0;

  void _onScaleStart(ScaleStartDetails details) {
    log("SleStartDetails $details");
    _startLastOffset = details.focalPoint;
    _lastScale = _currentScale;
    _lastOffset = _currentOffset;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    log("ScaleUpdate: $details - Scale: ${details.scale}");
    if (details.scale != 1.0) {
      double currentScale = _lastScale * details.scale;
      if (currentScale < 0.5) {
        currentScale = 0.5;
      }
      setState(() {
        _currentScale = currentScale;
      });
      log("scale $_currentScale - lastScale $_lastScale");
    } else if (details.scale == 1.0) {
      Offset offsetAdjustedForScale =
          (_startLastOffset - _lastOffset) / _lastScale;
      Offset currentOffset =
          details.focalPoint - (offsetAdjustedForScale * _currentScale);
      setState(() {
        _currentOffset = currentOffset;
      });
    }
  }

  void _onDoubleTap() {
    log("DoubleTap");
    double currentScale = _lastScale * 2;
    if (currentScale > 16) {
      currentScale = 1.0;
      _resetToDefaultValue();
    }
    _lastScale = currentScale;
    setState(() {
      _currentScale = currentScale;
    });
  }

  void _resetToDefaultValue() {
    _startLastOffset = Offset.zero;
    _currentOffset = Offset.zero;
    _lastOffset = Offset.zero;
    _lastScale = 1.0;
    _currentScale = 1.0;
  }

  void _onLongPress() {
    log("LongPress");
    setState(() {
      _resetToDefaultValue();
    });
  }

  void _setScaleSmall() {
    setState(() {
      _currentScale = 0.5;
    });
  }

  void _setScaleBig() {
    setState(() {
      _currentScale = 16.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gesture Scale"),
      ),
      body: GestureDetector(
        onDoubleTap: _onDoubleTap,
        onScaleStart: _onScaleStart,
        onLongPress: _onLongPress,
        onScaleUpdate: _onScaleUpdate,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Transform.scale(
              scale: _currentScale,
              child: Transform.translate(
                offset: _currentOffset,
                child: Image.asset("assets/images/house_home.png"),
              ),
            ),
            Transform(
              transform: Matrix4.identity()
                ..scale(_currentScale, _currentScale)
                ..translate(
                  _currentOffset.dx,
                  _currentOffset.dy,
                ),
              alignment: FractionalOffset.center,
              child: Image.asset("assets/images/house_home.png"),
            ),
            Positioned(
              top: 0.0,
              width: MediaQuery.of(context).size.width,
              child: Container(
                color: Colors.white54,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Scale: ${_currentScale.toStringAsFixed(4)}',
                    ),
                    Text(
                      'Current: $_currentOffset',
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 50,
              width: MediaQuery.of(context).size.width,
              child: Container(
                height: 56,
                color: Colors.white54,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      splashColor: Colors.lightGreenAccent,
                      highlightColor: Colors.lightBlueAccent,
                      onTap: _setScaleSmall,
                      onDoubleTap: _setScaleBig,
                      onLongPress: _onLongPress,
                      child: Container(
                        height: 48.0,
                        width: 128.0,
                        color: Colors.black12,
                        child: const Icon(
                          Icons.touch_app,
                          size: 32.0,
                        ),
                      ),
                    ),
                    InkResponse(
                      splashColor: Colors.lightGreenAccent,
                      highlightColor: Colors.lightBlueAccent,
                      onTap: _setScaleSmall,
                      onDoubleTap: _setScaleBig,
                      onLongPress: _onLongPress,
                      child: Container(
                        height: 48.0,
                        width: 128.0,
                        color: Colors.black12,
                        child: const Icon(
                          Icons.touch_app,
                          size: 32.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
