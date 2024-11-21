import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prospa_assessment/src/presentation/resources/res.dart';
import 'package:prospa_assessment/src/presentation/utility/button_pressed_animation.util.dart';
import 'package:prospa_assessment/src/presentation/widgets.dart';

class PromoSectionUi extends StatelessWidget {
  const PromoSectionUi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: PromoTileUi(),
        ),
        Gap(12),
        Expanded(
          child: PromoTileUi(),
        ),
      ],
    );
  }
}

class PromoTileUi extends StatelessWidget {
  const PromoTileUi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonPressAnimation(
      onTap: () {},
      child: Container(
        height: 140.r,
        decoration: BoxDecoration(
          color: brandPrimary,
          borderRadius: const BorderRadius.all(smallRadius).r,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              safeWithCoinsImg,
              height: 80.r,
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(smallRadius).r,
                  gradient: LinearGradient(
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter,
                    colors: [
                      primary600.withOpacity(0),
                      primary600.withOpacity(.4),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 12.r,
              right: 12.r,
              child: SvgIconUi(
                closeIcon,
                height: 10.r,
                width: 10.r,
              ),
            ),
            Positioned(
              bottom: 8.r,
              left: 16.r,
              child: const TextUi.body2(
                data: 'Promo title can\ncome here',
                color: white,
                fontFamily: semiBoldText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
