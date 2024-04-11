library real_time_track_package;

import 'package:flutter/material.dart';
import 'package:real_time_track_package/src/constants/debug.dart';

import 'src/constants/dimension.dart';

export 'src/constants/debug.dart';
export 'src/constants/dimension.dart';
export 'src/constants/rtt_theme_data.dart';
export 'src/constants/rtt_assets.dart';
export 'src/constants/constants.dart';

export 'src/enums/input_type.dart';
export 'src/enums/method_type.dart';
export 'src/enums/role.dart';

export 'src/models/country_model.dart';
export 'src/models/rtt_items.dart';
export 'src/models/auth_result.dart';
export 'src/models/tokens.dart';
export 'src/models/base_response.dart';
export 'src/models/organization_model.dart';
export 'src/models/driver_delivery_time.dart';
export 'src/models/warehouse_model.dart';

export 'src/utils/validator.dart';
export 'src/utils/preferences.dart';
export 'src/utils/url_launcher.dart';
export 'src/utils/snack_bar_utils.dart';
export 'src/utils/file_utils.dart';
export 'src/utils/google_map_utils.dart';
export 'src/utils/map_launcher_sheet.dart';
export 'package:map_launcher/map_launcher.dart' show Coords;

export 'src/helpers/circle_thumb_shape.dart';
export 'src/helpers/exceptions.dart';
export 'src/helpers/header_builder.dart';
export 'src/helpers/result.dart';
export 'src/helpers/timezone_manager.dart';

export 'src/services/connectivity_service.dart';
export 'src/services/platform_service.dart';
export 'src/services/web_socket_client.dart';

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
export 'src/widgets/image_picker_source_sheet.dart';
export 'src/widgets/photo_viewer.dart';
export 'src/widgets/swipe_button.dart';
export 'src/widgets/dismiss_focus_overlay.dart';
export 'src/widgets/connectivity_builder.dart';
export 'src/widgets/expanded_section.dart';
export 'src/widgets/restart_widget.dart';

export 'src/extensions/text_theme_ex.dart';
export 'src/extensions/widget_ex.dart';
export 'src/extensions/build_context_ex.dart';
export 'src/extensions/string_ex.dart';

export 'src/app/app_config.dart';

export 'package:image_picker/image_picker.dart' show ImageSource;

export 'package:connectivity_plus/connectivity_plus.dart';
export 'package:flutter_svg/flutter_svg.dart';

class RealTimeTrac {
  RealTimeTrac._();

  static const String name = 'real_time_track_package';

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
