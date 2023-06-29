import 'package:flutter/material.dart';
import 'package:school/components/app_bar_component.dart';

class BodyComponent extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BottomNavigationBar? bar;
  final FloatingActionButton? actionButton;

  const BodyComponent({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(18),
    this.margin,
    this.bar,
    this.actionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(),
      body: Container(
        //tamanhos para ocupar toda tela
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.topCenter,
        margin: margin ?? const EdgeInsets.all(18),
        padding: padding ?? const EdgeInsets.only(top: 8),
        //medidas que o box tem, desta forma não estora a view port
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
        ),
        child: child,
      ),
      bottomNavigationBar: bar,
      floatingActionButton: actionButton,
    );
  }
}
