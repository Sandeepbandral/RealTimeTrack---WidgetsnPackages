import 'dart:async';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:real_time_track_package/real_time_track_package.dart';

class OtpVerification extends StatefulWidget {
  final VoidCallback onOtpResended;
  final VoidCallback onOtpVerified;

  const OtpVerification({
    super.key,
    required this.onOtpResended,
    required this.onOtpVerified,
  });

  static Future<void> show(
    BuildContext context, {
    required VoidCallback onOtpResended,
    required VoidCallback onOtpVerified,
  }) async {
    return await showModalBottomSheet<void>(
      context: context,
      elevation: 0,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimension.d4),
      ),
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: OtpVerification(
            onOtpResended: onOtpResended,
            onOtpVerified: onOtpVerified,
          ),
        );
      },
    );
  }

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  //
  final TextEditingController _otpCode = TextEditingController();

  bool _isOtpVerified = false;

  int _seconds = 0;
  Timer? _timer;

  void _startTimer() {
    _seconds = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds--;
        if (_seconds == 0) {
          timer.cancel();
        }
      });
    });
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimension.d6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBoxH10(),
            const Center(child: SheetHeaderLine()),
            const SizedBoxH20(),
            if (_isOtpVerified) ...[
              const Center(child: HeadingText(title: 'OTP Verified')),
              const SizedBoxH20(),
              Center(
                child: AvatarGlow(
                  endRadius: 90,
                  glowColor: colorScheme.primary,
                  duration: const Duration(milliseconds: 1500),
                  repeat: true,
                  showTwoGlows: true,
                  repeatPauseDuration: const Duration(milliseconds: 100),
                  child: SvgPicture.asset(
                    RttAssets.success,
                    package: RealTimeTrack.name,
                  ),
                ),
              ),
            ] else ...[
              const HeadingText(title: 'Enter OTP'),
              const SizedBoxH5(),
              Text(
                'Lorem ipsum text here',
                style: textTheme.titleMedium?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBoxH30(),
              _pinCodeTextField(),
              if (_timer?.isActive ?? false) ...[
                const SizedBoxH10(),
                Text(
                  'Resend OTP 00 : ${_seconds.toString().padLeft(2, '0')}',
                  style: textTheme.otpCodeStyle?.copyWith(fontSize: 16),
                ),
                const SizedBoxH10(),
              ] else ...[
                RttTextButton(
                  label: 'Resend Code',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  onPressed: () {
                    widget.onOtpResended();
                    _startTimer();
                  },
                ),
              ],
              const SizedBoxH30(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RttTextButton(
                    label: 'Cancel',
                    color: Colors.grey,
                    onPressed: () => Navigator.pop(context),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _isOtpVerified = true;
                        });
                        Future.delayed(const Duration(seconds: 2), () {
                          Navigator.pop(context);
                          widget.onOtpVerified();
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _pinCodeTextField() {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;

    return PinCodeTextField(
      appContext: context,
      controller: _otpCode,
      length: 6,
      textStyle: textTheme.otpCodeStyle,
      autoDismissKeyboard: true,
      autoDisposeControllers: true,
      cursorColor: colorScheme.primary,
      backgroundColor: Colors.transparent,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(12),
        borderWidth: 1,
        fieldHeight: 48,
        fieldWidth: 48,
        selectedColor: colorScheme.primary,
        selectedFillColor: colorScheme.primary.withOpacity(0.1),
        activeFillColor: colorScheme.primary.withOpacity(0.1),
        inactiveFillColor: Colors.white,
        activeColor: colorScheme.primary,
        inactiveColor: Colors.grey.shade300,
        fieldOuterPadding: EdgeInsets.zero,
      ),
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      onCompleted: (value) {},
      onChanged: (value) {
        if (value.length == 6) {
        } else {}
      },
    );
  }
}
