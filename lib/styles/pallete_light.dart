import 'package:flutter/material.dart';
import 'package:school/styles/pallete_style.dart';

class PalleteLight implements PalleteStyle {
  @override
  Color primary = Colors.purple;

  @override
  Color accent = Colors.amber;

  @override
  Color background = Colors.grey[50]!;

  @override
  Color backgroundDark = Colors.grey[400]!;

  @override
  Color error = Colors.red;

  @override
  Color primaryDark = const Color.fromARGB(255, 116, 28, 131);

  @override
  Color secondary = Colors.grey;

  @override
  Color success = Colors.green;

  @override
  Color text = Colors.black87;

  @override
  Color textSecondary = Colors.black;

  @override
  Color warning = Colors.yellow[700]!;

  @override
  Color white = Colors.white;
}
