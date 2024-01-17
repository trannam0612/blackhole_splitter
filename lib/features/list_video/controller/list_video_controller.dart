import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

class ListVideoController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    print('onInit ListVideoController');
  }

  StreamSubscription<BluetoothConnectionState>? subscription;
}
