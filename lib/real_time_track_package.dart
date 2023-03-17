library real_time_track_package;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_time_track_package/src/constants/debug.dart';

import 'src/constants/dimension.dart';

export 'src/constants/debug.dart';
export 'src/constants/dimension.dart';
export 'src/constants/rtt_theme_data.dart';
export 'src/constants/rtt_assets.dart';
export 'src/constants/constants.dart';

export 'src/enums/input_type.dart';

export 'src/models/country_model.dart';
export 'src/models/rtt_items.dart';

export 'src/utils/validation_mixin.dart';
export 'src/utils/preferences.dart';

export 'src/helpers/circle_thumb_shape.dart';

export 'src/client/client.dart';

export 'src/services/connectivity_service.dart';

export 'src/widgets/app_lifecycle_reactor.dart';
export 'src/widgets/flexible_scroll_view.dart';
export 'src/widgets/loader.dart';
export 'src/widgets/scrollable_column.dart';
export 'src/widgets/sized_box.dart';
export 'src/widgets/widget_delegate.dart';
export 'src/widgets/text.dart';
export 'src/widgets/rtt_material_button.dart';
export 'src/widgets/rtt_text_field.dart';
export 'src/widgets/rtt_text_button.dart';
export 'src/widgets/country_picker.dart';
export 'src/widgets/otp_verification_sheet.dart';
export 'src/widgets/rtt_bottom_navigatiron_bar.dart';
export 'src/widgets/image_view.dart';
export 'src/widgets/rtt_menu_item_listing.dart';
export 'src/widgets/app_bar.dart';

export 'src/extensions/text_theme_extesion.dart';
export 'src/extensions/widget_extesion.dart';
export 'src/extensions/build_context_ex.dart';

class RealTimeTrack {
  RealTimeTrack._();

  static const String name = 'real_time_track_package';

  static void googleFontsAllowRuntimeFetching(bool allow) {
    GoogleFonts.config.allowRuntimeFetching = allow;
  }

  static void enableDebug(bool allow) {
    Debug.enabled = allow;
  }
}

class SheetHeaderLine extends StatelessWidget {
  const SheetHeaderLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 60,
      decoration: BoxDecoration(
        color: const Color(0xffDCE0E2),
        borderRadius: BorderRadius.circular(Dimension.d2),
      ),
    );
  }
}
