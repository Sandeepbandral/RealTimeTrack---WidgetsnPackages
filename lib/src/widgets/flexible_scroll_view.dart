import 'package:flutter/material.dart';

class FlexibleScrollView extends StatelessWidget {
  const FlexibleScrollView({
    super.key,
    this.padding,
    required this.children,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : withSafeArea = false;

  const FlexibleScrollView.withSafeArea({
    super.key,
    this.padding,
    required this.children,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : withSafeArea = true;

  final EdgeInsets? padding;
  final List<Widget> children;
  final bool withSafeArea;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    Widget child = CustomScrollView(
      reverse: false,
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: Column(
              mainAxisSize: mainAxisSize,
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: crossAxisAlignment,
              children: children,
            ),
          ),
        )
      ],
    );
    return withSafeArea ? SafeArea(child: child) : child;
  }
}
