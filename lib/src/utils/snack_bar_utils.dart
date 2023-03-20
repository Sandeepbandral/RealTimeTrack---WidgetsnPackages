import 'package:flutter/material.dart';

const double _kElevation = 0;

const Duration _kDuration2000ms = Duration(milliseconds: 2000);

const SnackBarBehavior _kSnackBarBehavior = SnackBarBehavior.floating;

class SnackBarUtils {
  SnackBarUtils._();

  static SnackBar snackBar({
    required String message,
    Duration duration = _kDuration2000ms,
  }) {
    Color color = Colors.black;

    return SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.left,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: color,
      behavior: _kSnackBarBehavior,
      duration: duration,
      elevation: _kElevation,
    );
  }
}
