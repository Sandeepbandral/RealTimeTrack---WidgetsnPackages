import 'package:flutter/material.dart';

class DismissFocusOverlay extends StatelessWidget {
  final Widget? child;

  const DismissFocusOverlay({super.key, this.child});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}
