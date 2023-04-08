import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

extension WidgetEx on Widget {
  Widget toShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.1),
      highlightColor: Colors.grey.withOpacity(0.18),
      child: this,
    );
  }
}
