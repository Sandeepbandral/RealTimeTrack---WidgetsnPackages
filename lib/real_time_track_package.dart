library real_time_track_package;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_time_track_package/debug.dart';

export 'src/real_time_track_theme_data.dart';
export 'src/real_time_track_assets.dart';

export 'src/widgets/app_lifecycle_reactor.dart';
export 'src/widgets/flexible_scroll_view.dart';
export 'src/widgets/loader.dart';
export 'src/widgets/scrollable_column.dart';
export 'src/widgets/sized_box.dart';
export 'src/widgets/widget_delegate.dart';

export 'debug.dart';

class RealTimeTrack {
  RealTimeTrack._();

  static void googleFontsAllowRuntimeFetching(bool allow) {
    GoogleFonts.config.allowRuntimeFetching = allow;
  }

  static void enableDebug(bool allow) {
    Debug.enabled = allow;
  }

  static GlobalKey<NavigatorState> navigatorKey() {
    return GlobalKey<NavigatorState>();
  }
}
