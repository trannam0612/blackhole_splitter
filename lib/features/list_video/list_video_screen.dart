import 'package:blackhole_spliter/features/contants/assest_constants.dart';
import 'package:blackhole_spliter/features/contants/color_constants.dart';
import 'package:blackhole_spliter/features/contants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'controller/list_video_controller.dart';

class ListVideoScreen extends GetView<ListVideoController> {
  const ListVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: SvgPicture.asset(SvgPaths.icBack),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'VIDEOS',
          style: StylesConstant.ts16w400.copyWith(color: ColorsConstant.cWhite),
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                IconButton(
                  icon: SvgPicture.asset(SvgPaths.icMenu),
                  onPressed: () {},
                ),
                Expanded(
                  child: Container(
                    height: 48,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorsConstant.c7B7B7C),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              fillColor: ColorsConstant.cF6F6F6,
                              filled: true,
                              hintText: 'Search...',
                              hintStyle: StylesConstant.ts12w400
                                  .copyWith(color: ColorsConstant.cTextColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        IconButton(
                          icon: SvgPicture.asset(SvgPaths.icSearch),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                IconButton(
                  icon: SvgPicture.asset(SvgPaths.icSetting),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(24.w),
              child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Image.asset(
                          ImgPaths.imgLogo,
                          width: 86.w,
                          height: 64.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Headline',
                                style: StylesConstant.ts14w400
                                    .copyWith(color: ColorsConstant.cWhite),
                              ),
                              Text(
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                                style: StylesConstant.ts12w400
                                    .copyWith(color: ColorsConstant.cCCCAC9),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '1.2MB',
                                style: StylesConstant.ts14w400
                                    .copyWith(color: ColorsConstant.cCCCAC9),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: SvgPicture.asset(SvgPaths.icAction),
                          onPressed: () {},
                        ),
                      ],
                    );
                  },
                  itemCount: 10),
            )),
            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }
}
