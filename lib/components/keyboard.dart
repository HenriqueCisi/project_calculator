import 'package:flutter/material.dart';
import 'package:project_calculator/components/button.dart';
import 'package:project_calculator/components/button_row.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({required this.onButtonPressed, super.key});

  final void Function(String) onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        children: [
          ButtonRow(buttons: [
            Button(
              text: 'AC',
              onButtonPressed: onButtonPressed,
              isDoubleSize: true,
              color: Button.dark,
            ),
            Button(
              text: '%',
              onButtonPressed: onButtonPressed,
              color: Button.dark,
            ),
            Button.isOperation(
              text: '/',
              onButtonPressed: onButtonPressed,
            ),
          ]),
          const SizedBox(
            height: 1,
          ),
          ButtonRow(buttons: [
            Button(
              text: '7',
              onButtonPressed: onButtonPressed,
            ),
            Button(
              text: '8',
              onButtonPressed: onButtonPressed,
            ),
            Button(
              text: '9',
              onButtonPressed: onButtonPressed,
            ),
            Button.isOperation(
              text: 'X',
              onButtonPressed: onButtonPressed,
            ),
          ]),
                    const SizedBox(
            height: 1,
          ),
          ButtonRow(buttons: [
            Button(
              text: '4',
              onButtonPressed: onButtonPressed,
            ),
            Button(
              text: '5',
              onButtonPressed: onButtonPressed,
            ),
            Button(
              text: '6',
              onButtonPressed: onButtonPressed,
            ),
            Button.isOperation(
              text: '-',
              onButtonPressed: onButtonPressed,
            ),
          ]),
                    const SizedBox(
            height: 1,
          ),
          ButtonRow(buttons: [
            Button(
              text: '1',
              onButtonPressed: onButtonPressed,
            ),
            Button(
              text: '2',
              onButtonPressed: onButtonPressed,
            ),
            Button(
              text: '3',
              onButtonPressed: onButtonPressed,
            ),
            Button.isOperation(
              text: '+',
              onButtonPressed: onButtonPressed,
            ),
          ]),
                    const SizedBox(
            height: 1,
          ),
          ButtonRow(buttons: [
            Button.isDoubleSize(
              text: '0',
              onButtonPressed: onButtonPressed,
            ),
            Button(
              text: '.',
              onButtonPressed: onButtonPressed,
            ),
            Button.isOperation(
              text: '=',
              onButtonPressed: onButtonPressed,
            ),
          ]),
                    const SizedBox(
            height: 1,
          ),
        ],
      ),
    );
  }
}
