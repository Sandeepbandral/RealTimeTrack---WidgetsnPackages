library real_time_track_package;

import 'package:google_fonts/google_fonts.dart';

export 'src/real_time_track_theme_data.dart';
export 'src/real_time_track_constants.dart';
export 'src/real_time_track_assets.dart';

export 'debug.dart';

void googleFontsAllowRuntimeFetching(bool allow) {
  GoogleFonts.config.allowRuntimeFetching = allow;
}
