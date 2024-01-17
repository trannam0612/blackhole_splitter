import 'package:blackhole_spliter/features/contants/color_constants.dart';
import 'package:blackhole_spliter/features/home/controller/home_binding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'features/routes/app_pages.dart';
import 'features/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await AppInjector.initializeDependencies();
  configLoading();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );

  runApp(const MyApp());
}

void configLoading() {
  EasyLoading.instance
    // ..indicatorType = EasyLoadingIndicatorType.circle
    ..maskType = EasyLoadingMaskType.custom
    ..loadingStyle = EasyLoadingStyle.custom
    ..textColor = ColorsConstant.cBlue
    ..indicatorSize = 40.0
    ..radius = 12.0
    ..backgroundColor = ColorsConstant.cWhite
    ..indicatorColor = ColorsConstant.cBlue
    ..maskColor = ColorsConstant.cWhite.withOpacity(0.5)
    ..userInteractions = true
    ..indicatorWidget = const CupertinoActivityIndicator()
    // ..indicatorWidget = Lottie.asset(AnimationPaths.loadingDotsAnimation)
    ..dismissOnTap = true
    ..displayDuration = const Duration(seconds: 10);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'i10 BLE',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialBinding: HomeBinding(),
        initialRoute: AppRoutes.home,
        getPages: AppPages.pages,
        builder: EasyLoading.init(),
      ),
    );
  }
}
