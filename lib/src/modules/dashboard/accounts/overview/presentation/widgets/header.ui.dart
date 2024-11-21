import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prospa_assessment/src/presentation/resources/res.dart';
import 'package:prospa_assessment/src/presentation/utility/button_pressed_animation.util.dart';
import 'package:prospa_assessment/src/presentation/widgets.dart';

class AccountsOverviewHeaderUi extends StatelessWidget {
  const AccountsOverviewHeaderUi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).r,
      child: Row(
        children: [
          const Expanded(
            child: TextUi.title2(
              data: 'Hello, Oluwaseun',
              color: white,
              fontFamily: boldText,
            ),
          ),
          ButtonPressAnimation(
            onTap: () {},
            child: Image.asset(
              dummyUserAvatarImg,
              height: 40.r,
              width: 40.r,
            ),
          ),
        ],
      ),
    );
  }
}
