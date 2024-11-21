import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show HapticFeedback;
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;
import 'package:prospa_assessment/src/data/dummy/dashboard_tabs.dummy.dart';
import 'package:prospa_assessment/src/presentation/resources/res.dart';
import 'package:prospa_assessment/src/presentation/widgets.dart';

class NavBarItemUi extends StatelessWidget {
  const NavBarItemUi({
    required this.tabItem,
    required this.isActive,
    required this.onTap,
    super.key,
  });

  final DashboardTab tabItem;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.r,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          onTap.call();
          HapticFeedback.lightImpact();
        },
        child: Column(
          children: [
            const Gap(10),
            SizedBox(
              height: 24.r,
              width: 24.r,
              child: AnimatedCrossFade(
                duration: const Duration(milliseconds: 200),
                firstCurve: Curves.easeOut,
                secondCurve: Curves.easeOut,
                crossFadeState: isActive ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                firstChild: Center(
                  child: SvgIconUi(
                    key: UniqueKey(),
                    tabItem.activeIcon,
                    color: brandSecondary,
                    width: 24.r,
                    height: 24.r,
                  ),
                ),
                secondChild: Center(
                  child: SvgIconUi(
                    key: UniqueKey(),
                    tabItem.icon,
                    color: primary300,
                    width: 24.r,
                    height: 24.r,
                  ),
                ),
              ),
            ),
            const Gap(6),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: body3.copyWith(
                fontFamily: mediumText,
                color: isActive ? brandSecondary : primary300,
              ),
              child: TextUi.caption(
                data: tabItem.label,
                textAlign: TextAlign.center,
                height: 12.r / 10,
                fontFamily: mediumText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
