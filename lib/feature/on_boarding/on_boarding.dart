import 'package:fashion_app/core/config/localstorage.dart';
import 'package:fashion_app/core/domain/model/auth/on_boarding_model.dart';
import 'package:fashion_app/core/resources/app_color.dart';
import 'package:fashion_app/core/resources/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class OnBoaringScreens extends StatelessWidget {
  OnBoaringScreens({super.key});
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColor.background,
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: PageView.builder(
              controller: controller,
              itemCount: OnBoradingModel.onBoradingScreen.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    //!skip text
                    index != 2
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              child: Text(
                                AppStrings.skip,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                        color: AppColor.primarylight,
                                        fontSize: 20),
                              ),
                              onPressed: () {
                                controller.jumpToPage(2);
                              },
                            ),
                          )
                        : SizedBox(
                            height: 40.h,
                          ),
                    SizedBox(
                      height: 16.h,
                    ),
                    //!image
                    Image.asset(
                      OnBoradingModel.onBoradingScreen[index].imagPath,
                      height: 350.h,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),

                    //!dots
                    SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: ExpandingDotsEffect(
                          activeDotColor: AppColor.primary,
                          dotHeight: 4,
                          spacing: 8),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),

                    //!title
                    Text(OnBoradingModel.onBoradingScreen[index].title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontWeight: FontWeight.normal)),
                    SizedBox(
                      height: 12.h,
                    ),

                    //!subTitle
                    Text(OnBoradingModel.onBoradingScreen[index].subtitle,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: AppColor.grey)),
                    const Spacer(),
                    //!buttons
                    Row(
                      children: [
                        //!back button
                        index != 0
                            ? Container(
                                height: 50.h,
                                width: 55.w,
                                decoration: BoxDecoration(
                                    border: Border.all(color: AppColor.primary),
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.circular(100)),
                                child: IconButton(
                                  icon: Icon(Icons.arrow_back,
                                      color: AppColor.primary),
                                  onPressed: () {
                                    controller.previousPage(
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        curve: Curves.fastLinearToSlowEaseIn);
                                  },
                                ),
                              )
                            : Container(),
                        //spacer
                        const Spacer(),
                        //! next Button

                        Container(
                          height: 50.h,
                          width: 55.w,
                          decoration: BoxDecoration(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.circular(100)),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_forward,
                                color: AppColor.white),
                            onPressed: () async {
                              index != 2
                                  ? controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      curve: Curves.fastLinearToSlowEaseIn)
                                  : await getIt
                                      .get<SharedPreferences>()
                                      .setBool('onboarding', true)
                                      .then((value) {
                                      Navigator.of(context)
                                          .pushReplacementNamed('sign');
                                    });
                            },
                          ),
                        )
                      ],
                    )
                  ],
                );
              },
            ),
          )),
    );
  }
}
