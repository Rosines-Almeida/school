import 'package:flutter/material.dart';
import 'package:school/pages/home/detalhe/detalhe_page.dart';
import 'package:school/pages/home/home_page.dart';

class AppRoutes {
  static String initalRoute = '/';
  static String detalhe = '/detalhe';
  static Map<String, Widget Function(BuildContext)> routes() {
    return {
      initalRoute: (context) => const HomePage(),
      detalhe: (context) => const DetalhePage(),
    };
  }
}
