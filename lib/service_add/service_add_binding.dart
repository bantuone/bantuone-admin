import 'package:bantuone_admin/controllers/service_add_controller.dart';
import 'package:get/get.dart';

import '../controllers/service_edit_controller.dart';

class ServiceEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServiceEditController());
  }
}