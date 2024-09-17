import 'package:fashion_app/core/resources/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/app_color.dart';

ThemeData appTheme = ThemeData(
    //brightness: Brightness.dark,
    primaryColor: AppColor.primary,

//  appBarTheme:  AppBarTheme(
//   backgroundColor: AppColor.background,
//   centerTitle: false,

//  iconTheme: IconThemeData(color: AppColor.white),
//   titleTextStyle:
//   TextStyle(fontSize: 24,color: AppColor.textColor,fontWeight: FontWeight.normal),
// elevation: 0,

//   ),
    // floatingActionButtonTheme:  FloatingActionButtonThemeData(
    //   shape: CircleBorder(),
    //   backgroundColor: AppColor.primary),
    scaffoldBackgroundColor: AppColor.white,
    //drawerTheme: DrawerThemeData(backgroundColor: AppColor.background),
    textTheme: TextTheme(
      displayLarge: boldStyle(),
      displayMedium: normalStyle(),
      displaySmall: smallStyle(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          //side: const BorderSide(),
          backgroundColor: AppColor.primary,
          textStyle: TextStyle(color: AppColor.white, fontSize: 20.sp),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: false,
      labelStyle: TextStyle(fontSize: 16.sp, color: AppColor.primary),
      fillColor: AppColor.secondary,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColor.primary)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColor.primary)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColor.primary)),
      hintStyle: TextStyle(fontSize: 15.sp, color: AppColor.primary),
    ));
