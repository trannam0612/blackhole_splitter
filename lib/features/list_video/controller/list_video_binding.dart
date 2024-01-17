import 'package:get/get.dart';

import 'list_video_controller.dart';

class ListVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ListVideoController>(ListVideoController());
    // Get.put<ScanningController>(ScanningController());
  }
}
