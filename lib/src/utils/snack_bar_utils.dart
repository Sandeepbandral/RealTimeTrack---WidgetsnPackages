import 'package:flutter/material.dart';

const double _kElevation = 0;

const Duration _kDuration3000ms = Duration(milliseconds: 3000);

const SnackBarBehavior _kSnackBarBehavior = SnackBarBehavior.floating;

class SnackBarUtils {
  SnackBarUtils._();

  static SnackBar snackBar({
    required String message,
    Duration? duration,
    SnackBarAction? action,
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
      action: action,
      backgroundColor: color,
      behavior: _kSnackBarBehavior,
      duration: duration ?? _kDuration3000ms,
      elevation: _kElevation,
    );
  }
}
