import 'package:get/get.dart';
import 'package:prospa_assessment/src/domain/services/services.dart';

class AccountsOverviewController extends GetxController {
  void openSavingsAccountPage() {
    navigationService.navigateTo(
      Routes.accountDetails,
    );
  }
}
