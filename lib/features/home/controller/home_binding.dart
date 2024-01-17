import 'package:blackhole_spliter/features/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    // Get.put<ScanningController>(ScanningController());
  }
}
