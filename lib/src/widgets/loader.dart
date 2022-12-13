import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_time_track_package/src/constants/rtt_theme_data.dart';

const double _kLoaderSize = 14.0;

class Loader {
  Loader._();

  static Widget circularProgressIndicator({double? loaderSize, Color? color}) {
    Color primary = RttThemeData.lightColorScheme.primary;
    return Center(
      child: CupertinoActivityIndicator(
        animating: true,
        radius: _kLoaderSize,
        color: color ?? primary,
      ),
    );
  }

  static void show(BuildContext context) {
    Navigator.push(context, _LoaderDialog());
  }

  static void dismiss(BuildContext context) {
    Navigator.pop(context);
  }
}

class _LoaderDialog extends RawDialogRoute {
  _LoaderDialog()
      : super(
          barrierColor: Colors.black.withOpacity(0.2),
          pageBuilder: (context, animation, secondaryAnimation) {
            return WillPopScope(
              onWillPop: () {
                return Future.value(false);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Loader.circularProgressIndicator(),
                  ),
                ],
              ),
            );
          },
        );
}
