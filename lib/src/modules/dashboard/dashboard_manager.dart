import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show  SizeExtension;
import 'package:get/get.dart';
import 'package:prospa_assessment/src/data/dummy/dashboard_tabs.dummy.dart';
import 'package:prospa_assessment/src/presentation/resources/res.dart';
import 'package:prospa_assessment/src/presentation/views.dart';
import 'package:prospa_assessment/src/presentation/widgets.dart';

class DashboardUi extends GetView<DashboardManager> {
  const DashboardUi({super.key});

  @override
  DashboardManager get controller => Get.put(DashboardManager());

  @override
  Widget build(BuildContext context) {
    final kBottomPadding = MediaQuery.of(context).padding.bottom;

    return Obx(
      () {
        return PopScope(
          canPop: controller.currentIndex == 0,
          onPopInvokedWithResult: (_, __) {
            if (controller.currentIndex != 0) {
              controller.currentIndex = 0;
            }
          },
          child: ColoredBox(
            color: primary50,
            child: Stack(
              children: [
                Positioned.fill(
                  bottom: 60.r,
                  child: IndexedStack(
                    index: controller.currentIndex,
                    children: const <Widget>[
                      AccountsOverviewUi(),
                      TransferOverviewUi(),
                      InvoiceOverviewUi(),
                      MoreUi(),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: SafeArea(
                    bottom: false,
                    child: Container(
                      height: 60.r + kBottomPadding,
                      color: white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 1.r,
                            child: Stack(
                              children: [
                                Container(
                                  height: 1.r,
                                  color: primary100,
                                ),
                                AnimatedPositioned(
                                  duration: 200.milliseconds,
                                  curve: Curves.easeOut,
                                  left: controller.currentIndex * (context.width / dashboardTabs.length),
                                  width: context.width / dashboardTabs.length,
                                  height: 1.r,
                                  child: Container(
                                    color: brandSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: dashboardTabs.asMap().entries.map(
                              (entry) {
                                final index = entry.key; 
                                final item = entry.value;
                                final isActive = controller.currentIndex == index;
                                return Expanded(
                                  key: ValueKey(index.toString()),
                                  child: NavBarItemUi(
                                    tabItem: item,
                                    isActive: isActive,
                                    onTap: () => controller.currentIndex = index,
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class DashboardManager extends GetxController {
  final _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int i) {
    _currentIndex.value = i;
  }
}
