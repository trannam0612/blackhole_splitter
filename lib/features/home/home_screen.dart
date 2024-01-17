import 'package:blackhole_spliter/features/contants/assest_constants.dart';
import 'package:blackhole_spliter/features/contants/color_constants.dart';
import 'package:blackhole_spliter/features/contants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(
              flex: 1,
            ),
            Text(
              'Black Hole & Circle',
              style: StylesConstant.ts24w400
                  .copyWith(color: ColorsConstant.cWhite),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              'SPLITER',
              style: StylesConstant.ts14w400
                  .copyWith(color: ColorsConstant.cWhite),
            ),
            Spacer(
              flex: 1,
            ),
            InkWell(
              onTap: () {
                controller.download(
                  'https://www.youtube.com/watch?v=8EWFZSwzT5c&ab_channel=%C4%90%E1%BB%A9cGarden-K%C3%ADchR%E1%BB%85B%E1%BA%ADtCh%E1%BB%93iNh%E1%BA%ADpKh%E1%BA%A9u',
                  'testFileYoutube.mp4',
                );
              },
              child: Image.asset(
                ImgPaths.imgLogo,
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Please wait...',
              style: StylesConstant.ts14w400
                  .copyWith(color: ColorsConstant.cWhite),
            ),
            Spacer(
              flex: 1,
            ),
            InkWell(
                onTap: () {
                  // Get.toNamed(AppRoutes.listVideo);
                  controller.getListFile();
                },
                child: SvgPicture.asset(SvgPaths.icPlay)),
            SizedBox(
              height: 18.h,
            ),
            Text(
              'VIDEOS',
              style: StylesConstant.ts14w400
                  .copyWith(color: ColorsConstant.cWhite),
            ),
            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }
}
