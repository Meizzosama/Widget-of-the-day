import 'package:flutter/material.dart';
import 'dart:math';

class FlipCardExample extends StatefulWidget {
  const FlipCardExample({super.key});

  @override
  _FlipCardExampleState createState() => _FlipCardExampleState();
}

class _FlipCardExampleState extends State<FlipCardExample> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void _toggleCard() {
    if (_isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    _isFront = !_isFront;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flip Card Animation'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _toggleCard,
          child: Stack(
            children: [
              _buildFrontSide(),
              _buildBackSide(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFrontSide() {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final angle = _animation.value * pi;
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(angle),
          child: Opacity(
            opacity: angle <= pi / 2 ? 1.0 : 0.0,
            child: child,
          ),
        );
      },
      child: Container(
        width: 200,
        height: 300,
        color: Colors.blue,
        child: const Center(
          child: Text(
            'Front',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackSide() {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final angle = (_animation.value - 1) * pi;
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(angle),
          child: Opacity(
            opacity: angle.abs() <= pi / 2 ? 1.0 : 0.0,
            child: child,
          ),
        );
      },
      child: Container(
        width: 200,
        height: 300,
        color: Colors.red,
        child: const Center(
          child: Text(
            'Back',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
