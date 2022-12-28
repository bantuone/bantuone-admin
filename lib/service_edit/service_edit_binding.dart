import 'package:bantuone_admin/controllers/service_add_controller.dart';
import 'package:get/get.dart';

class ServiceAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServiceAddController());
  }
}