import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    required this.text,
    required this.onButtonPressed,
    this.isDoubleSize = false,
    this.color = _default,
    super.key,
  });

  const Button.isDoubleSize({
    required this.text,
    required this.onButtonPressed,
    this.isDoubleSize = true,
    this.color = _default,
    super.key,
  });

  const Button.isOperation({
    required this.text,
    required this.onButtonPressed,
    this.isDoubleSize = false,
    this.color = operation,
    super.key,
  });
  

  final String text;
  final bool isDoubleSize;
  final Color color;
  final void Function(String) onButtonPressed;


  static const dark = Color.fromRGBO(82, 82, 82, 1);
  static const _default = Color.fromRGBO(112, 112, 112, 1);
  static const operation = Color.fromRGBO(250, 158, 13, 1);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: isDoubleSize ? 2 : 1,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color)
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w200,
          ),
        ),
        onPressed: () => onButtonPressed(text),
      ),
    );
  }
}
