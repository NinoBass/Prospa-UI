import 'package:get/get.dart';
import 'package:prospa_assessment/src/domain/services/services.dart';

class ServicesInjector {
  ServicesInjector._();

  static void initializeServices() {
    Get.lazyPut(NavigationService.new);
  }
}
