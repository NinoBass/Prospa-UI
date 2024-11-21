import 'dart:async' show unawaited;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show HapticFeedback;
import 'package:flutter_screenutil/flutter_screenutil.dart' show BorderRadiusExtension, SizeExtension;
import 'package:prospa_assessment/src/data/enums/button_type.enum.dart';
import 'package:prospa_assessment/src/presentation/global_widgets/text.ui.dart';
import 'package:prospa_assessment/src/presentation/resources/res.dart';
import 'package:prospa_assessment/src/presentation/utility/button_pressed_animation.util.dart';

class ButtonUi extends StatelessWidget {
  const ButtonUi._({
    required this.type,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.loading = false,
    this.showInkResponse = true,
    super.key,
  });

  const ButtonUi.primary({
    required String text,
    VoidCallback? onPressed,
    Color? foregroundColor,
    Color? backgroundColor,
    bool loading = false,
    bool showInkResponse = true,
    Key? key,
  }) : this._(
          key: key,
          text: text,
          type: ButtonType.primary,
          onPressed: onPressed,
          loading: loading,
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          showInkResponse: showInkResponse,
        );

  const ButtonUi.ghost({
    required String text,
    VoidCallback? onPressed,
    Color? foregroundColor,
    Color? backgroundColor,
    bool loading = false,
    bool showInkResponse = true,
    Key? key,
  }) : this._(
          key: key,
          text: text,
          type: ButtonType.ghost,
          onPressed: onPressed,
          loading: loading,
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          showInkResponse: showInkResponse,
        );

  final String text;
  final ButtonType type;
  final VoidCallback? onPressed;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final bool loading;
  final bool showInkResponse;

  @override
  Widget build(BuildContext context) {
    return ButtonPressAnimation(
      child: SizedBox(
        height: 50.r,
        child: TextButton(
          onPressed: onPressed == null
              ? null
              : () async {
                  if (!loading) {
                    await Future<void>.delayed(
                      const Duration(milliseconds: 100), // little delay to show button press animation
                      () {
                        unawaited(HapticFeedback.mediumImpact());
                        onPressed?.call();
                      },
                    );
                  }
                },
          style: ButtonStyle(
            alignment: Alignment.center,
            overlayColor: showInkResponse ? WidgetStateProperty.all(Colors.transparent) : null,
            elevation: WidgetStateProperty.all(0),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            backgroundColor: WidgetStateProperty.all(
              backgroundColor ?? (type.isPrimary ? brandSecondary : null),
            ),
            padding: WidgetStateProperty.all(EdgeInsets.zero),
            maximumSize: WidgetStateProperty.all(
              Size.fromHeight(50.r),
            ),
            minimumSize: WidgetStateProperty.all(
              Size.square(50.r),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  smallRadius,
                ).r,
              ),
            ),
            foregroundBuilder: (context, states, child) {
              if (loading) {
                return CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation(
                    foregroundColor ?? white,
                  ),
                );
              }

              return TextUi.body1(
                data: text,
                overflow: TextOverflow.ellipsis,
                color: foregroundColor ?? white,
                height: 20 / 16,
                fontFamily: semiBoldText,
              );
            },
          ),
          child: const SizedBox.shrink(),
        ),
      ),
    );
  }
}
