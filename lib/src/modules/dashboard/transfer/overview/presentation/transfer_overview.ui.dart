import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:prospa_assessment/src/modules/dashboard/transfer/overview/controller/transfer_overview.controller.dart';
import 'package:prospa_assessment/src/presentation/resources/res.dart';
import 'package:prospa_assessment/src/presentation/utility/ui_helpers.utils.dart';

class TransferOverviewUi extends GetView<TransferOverviewController> {
  const TransferOverviewUi({super.key});

  @override
  TransferOverviewController get controller => Get.put(TransferOverviewController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => removePrimaryFocusFromUiElement(context),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: kToolbarHeight + context.height * .20,
              width: context.width,
              color: primary600,
            ),
            Positioned.fill(
              child: SafeArea(
                child: CustomScrollView(
                  physics: const ClampingScrollPhysics(),
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 16).r,
                      sliver: const SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
