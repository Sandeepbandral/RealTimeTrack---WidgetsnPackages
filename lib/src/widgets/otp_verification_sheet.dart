import 'dart:async';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:real_time_track_package/real_time_track_package.dart';

typedef OtpVerifificationCallback = Future<bool> Function(String otpCode);

typedef OtpVerifiedCallback = void Function(bool verified);

class OtpVerification extends StatefulWidget {
  final String emailOrMobile;
  final VoidCallback onOtpResended;
  final OtpVerifificationCallback onOtpVerification;
  final OtpVerifiedCallback onOtpVerified;

  const OtpVerification({
    super.key,
    required this.emailOrMobile,
    required this.onOtpResended,
    required this.onOtpVerified,
    required this.onOtpVerification,
  });

  static Future<void> show(
    BuildContext context, {
    required String emailOrMobile,
    required VoidCallback onOtpResended,
    required OtpVerifificationCallback onOtpVerification,
    required OtpVerifiedCallback onOtpVerified,
  }) async {
    return await showModalBottomSheet<void>(
      context: context,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: OtpVerification(
            emailOrMobile: emailOrMobile,
            onOtpResended: onOtpResended,
            onOtpVerification: onOtpVerification,
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
        padding: const EdgeInsets.symmetric(horizontal: Dimension.d6)
            .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: AvatarGlow(
                    glowColor: colorScheme.primary,
                    duration: const Duration(milliseconds: 1500),
                    repeat: true,
                    child: SizedBox.square(
                      dimension: 90,
                      child: SvgPicture.asset(
                        RttAssets.success,
                        package: RealTimeTrac.name,
                      ),
                    ),
                  ),
                ),
              ),
            ] else ...[
              const HeadingText(title: 'Enter OTP'),
              const SizedBoxH5(),
              Text(
                num.tryParse(widget.emailOrMobile) != null
                    ? 'Please enter OTP sent to your mobile no. ${widget.emailOrMobile}'
                    : 'Please enter OTP sent to you email ${widget.emailOrMobile}',
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
                      onPressed: () async {
                        if (_otpCode.text.length == 6) {
                          bool verified =
                              await widget.onOtpVerification(_otpCode.text);

                          setState(() {
                            _isOtpVerified = verified;
                          });

                          Future.delayed(const Duration(seconds: 2), () {
                            widget.onOtpVerified(verified);
                          });
                        } else {
                          Fluttertoast.showToast(msg: 'Enter the OTP');
                        }
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
      onChanged: (value) {},
    );
  }
}
