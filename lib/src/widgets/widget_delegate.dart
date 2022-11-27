import 'package:flutter/material.dart';

typedef WidgetDelegateBuilder = Widget Function();

class WidgetDelegate extends StatelessWidget {
  const WidgetDelegate({
    Key? key,
    this.shouldShowPrimary = true,
    required this.primaryWidget,
    required this.alternateWidget,
  }) : super(key: key);

  final bool shouldShowPrimary;
  final WidgetDelegateBuilder primaryWidget;
  final WidgetDelegateBuilder alternateWidget;

  @override
  Widget build(BuildContext context) {
    return shouldShowPrimary ? primaryWidget() : alternateWidget();
  }
}
