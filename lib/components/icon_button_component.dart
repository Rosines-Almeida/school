import 'package:flutter/material.dart';

class IconButtonComponent extends StatelessWidget {
  final Function() onPressed;
  final IconData icon;
  final double iconSize;
  final Color? color;

  const IconButtonComponent({
    super.key,
    required this.onPressed,
    this.icon = Icons.add,
    this.iconSize = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      iconSize: iconSize,
      color: color,
    );
  }
}
