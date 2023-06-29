import 'package:flutter/material.dart';

import 'package:project_calculator/components/display.dart';
import 'package:project_calculator/components/keyboard.dart';
import 'package:project_calculator/models/memory.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final Memory _memory = Memory();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(children: [
        Display(
          text: _memory.value,
        ),
        Keyboard(
          onButtonPressed: onButtonPressed,
        )
      ]),
    );
  }

  void onButtonPressed(String command) {
    setState(() {
      _memory.applyCommand(command);
    });
  }
}
