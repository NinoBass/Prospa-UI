import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:prospa_assessment/src/domain/services/navigation.services.dart';
import 'package:prospa_assessment/src/presentation/resources/res.dart';
import 'package:prospa_assessment/src/presentation/widgets.dart';

class AccountDetailsController extends GetxController {
  void openAccountOptionsModal(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {},
            child: const TextUi.body1(
              data: 'Saving rules',
              color: blue,
              fontFamily: mediumText,
            ),
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {},
            child: const TextUi.body1(
              data: 'Delete account',
              color: error,
              fontFamily: mediumText,
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: navigationService.goBack,
          child: const TextUi.body1(
            data: 'Cancel',
            fontFamily: mediumText,
          ),
        ),
      ),
    );
  }
}
