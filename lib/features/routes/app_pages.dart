import 'package:blackhole_spliter/features/home/controller/home_binding.dart';
import 'package:blackhole_spliter/features/home/home_screen.dart';
import 'package:blackhole_spliter/features/list_video/controller/list_video_binding.dart';
import 'package:blackhole_spliter/features/list_video/list_video_screen.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      binding: HomeBinding(),
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.listVideo,
      binding: ListVideoBinding(),
      page: () => const ListVideoScreen(),
    ),
    // GetPage(
    //   name: AppRoutes.scanning,
    //   binding: ScanningBinding(),
    //   page: () => const ScanningScreen(),
    // ),
    // GetPage(
    //   name: AppRoutes.home,
    //   binding: HomeBinding(),
    //   page: () =>  const HomeScreen(),
    // ),
  ];
}
