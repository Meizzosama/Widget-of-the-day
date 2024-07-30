import 'dart:ui';

import 'package:flutter/material.dart';

class BackdropFilterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Backdrop Filter Demo'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://cdn.pixabay.com/photo/2016/07/07/16/46/dice-1502706_640.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Backdrop filter
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              color: Colors.black.withOpacity(0.3),
              child: const Center(
                child: Text(
                  'Hello, Backdrop Filter!',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          // Optional: a simple child overlay
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Welcome to the Backdrop Filter Demo',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Tap Me'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
