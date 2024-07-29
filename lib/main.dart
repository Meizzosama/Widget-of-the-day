import 'package:flutter/material.dart';
import 'package:flutter_concepts/widgets/custom_scrollview.dart';
import 'package:flutter_concepts/widgets/animated_stack_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Widget Of The Day',
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
      ),
      home:  const FlipCardExample(),
    );
  }
}
