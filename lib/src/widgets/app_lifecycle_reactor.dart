import 'package:flutter/material.dart';

class AppLifecycleReactor extends StatefulWidget {
  final Widget child;
  final Function(AppLifecycleState) onAppLifecycleStateChanged;

  const AppLifecycleReactor(
      {Key? key, required this.onAppLifecycleStateChanged, required this.child})
      : super(key: key);

  @override
  AppLifecycleReactorState createState() => AppLifecycleReactorState();
}

class AppLifecycleReactorState extends State<AppLifecycleReactor>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    widget.onAppLifecycleStateChanged(state);
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
