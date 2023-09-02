import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:real_time_track_package/real_time_track_package.dart';

class ConnectivityBuilder extends StatefulWidget {
  final Widget Function(BuildContext) builder;
  final VoidCallback onRefresh;

  const ConnectivityBuilder({
    super.key,
    required this.onRefresh,
    required this.builder,
  });

  @override
  State<ConnectivityBuilder> createState() => _ConnectivityBuilderState();
}

class _ConnectivityBuilderState extends State<ConnectivityBuilder> {
  ConnectivityResult _connectivityResult = ConnectivityResult.none;

  bool get _isConnected {
    return _connectivityResult == ConnectivityResult.mobile ||
        _connectivityResult == ConnectivityResult.wifi;
  }

  Future<void> _checkConnectivity() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    setState(() {
      _connectivityResult = result;
    });
  }

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    if (_isConnected) {
      return widget.builder(context);
    } else {
      return Padding(
        padding: const EdgeInsets.all(Dimension.d4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No Internet connection.\nMake sure that Wi-Fi or Mobile data is turned on, then try again.',
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge,
            ),
            RttTextButton(
              label: 'Retry',
              decoration: TextDecoration.underline,
              onPressed: () async {
                await _checkConnectivity();
                widget.onRefresh();
              },
            )
          ],
        ),
      );
    }
  }
}
