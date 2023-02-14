import 'package:flutter/material.dart';

class IconTextwidget extends StatelessWidget {
  final IconData icon;
  final IconData iconPressed;
  final String text;
  final VoidCallback onPressed;
  final bool isPressed;
  const IconTextwidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
    required this.iconPressed,
    this.isPressed = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: onPressed,
            icon: isPressed
                ? Icon(
                    iconPressed,
                    color: Colors.red,
                  )
                : Icon(
                    icon,
                    color: Colors.white,
                  )),
        // Icon(icon, color: Colors.white),
        FittedBox(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
