import 'package:flutter/material.dart';

class FlipContainer extends StatefulWidget {
  @override
  _FlipContainerState createState() => _FlipContainerState();
}

class _FlipContainerState extends State<FlipContainer>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  void _handleSwipe(DragEndDetails details) {
    if (details.primaryVelocity! > 0) {
      // Swiped from left to right (forward flip)
      _controller.forward();
    } else {
      // Swiped from right to left (backward flip)
      _controller.reverse();
    }
  }

  String getDisplayText(double angle) {
    if (angle < 3.1415 / 2) {
      return 'Front Text';
    } else {
      return 'Back Text';
    }
  }
  double angle = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Flip Container'),
      ),
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          child: GestureDetector(
            onHorizontalDragUpdate: (details) {
              setState(() {
                angle -= details.primaryDelta! / 200;
                angle = angle.clamp(0.0, 3.1415);
              });
            },
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity! > 0) {
                // Flip backward
                _controller.reverse();
              } else {
                // Flip forward
                _controller.forward();
              }
            },
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001) // perspective
                ..rotateY(angle),
              alignment: Alignment.center,
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: Transform(
                    transform: Matrix4.identity()..rotateY(angle > 3.1415 / 2 ? 3.1415 : 0),
                    alignment: Alignment.center,
                    child: Text(
                      'Front Text',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      )
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}