import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Gap extends StatelessWidget {
  const Gap(
    this.size, {
    super.key,
  });

  const Gap.x2({Key? key}) : this(2, key: key);
  const Gap.x4({Key? key}) : this(4, key: key);
  const Gap.x6({Key? key}) : this(6, key: key);
  const Gap.x8({Key? key}) : this(8, key: key);
  const Gap.x16({Key? key}) : this(16, key: key);
  const Gap.x20({Key? key}) : this(20, key: key);
  const Gap.x24({Key? key}) : this(24, key: key);
  const Gap.x30({Key? key}) : this(30, key: key);
  const Gap.x32({Key? key}) : this(32, key: key);
  const Gap.x36({Key? key}) : this(36, key: key);
  const Gap.x40({Key? key}) : this(40, key: key);
  const Gap.x42({Key? key}) : this(42, key: key);
  const Gap.x48({Key? key}) : this(48, key: key);
  const Gap.x56({Key? key}) : this(56, key: key);
  const Gap.x64({Key? key}) : this(64, key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.r,
      width: size.r,
    );
  }
}
