import 'package:fashion_app/core/resources/app_assets.dart';
import 'package:fashion_app/core/resources/app_color.dart';
import 'package:fashion_app/core/resources/app_string.dart';
import 'package:fashion_app/feature/share/custom_button.dart';
import 'package:fashion_app/feature/share/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox_Height(height: 40.h),
            Center(
              child: SizedBox(
                child: Image.asset(
                  AppAssets.welcome,
                  width: double.infinity,
                  height: 350.h,
                  scale: 0.1,
                ),
              ),
            ),
            SizedBox_Height(height: 20.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox_width(width: 40.w),
                Text(
                  AppStrings.the,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Text(
                  AppStrings.fashionApp,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: AppColor.primary, fontStyle: FontStyle.italic),
                ),
                Text(
                  AppStrings.that,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
            Text(
              AppStrings.welcome,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox_Height(height: 20.h),
            Text(
              AppStrings.on1subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox_Height(height: 20.h),
            CustomButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('on');
                },
                text: AppStrings.getstarted),
            SizedBox_Height(height: 20.h),
            Row(
              children: [
                SizedBox_width(width: 20.w),
                Text(
                  AppStrings.haveaccount,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('login');
                  },
                  child: Text(
                    AppStrings.login,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: AppColor.primary,
                        textBaseline: TextBaseline.alphabetic),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
