import 'package:fashion_app/core/resources/app_string.dart';

import '../../../resources/app_assets.dart';

class OnBoradingModel {
  final String imagPath;
  final String title;
  final String subtitle;

  OnBoradingModel(
      {required this.imagPath, required this.title, required this.subtitle});
  static List<OnBoradingModel> onBoradingScreen = [
    OnBoradingModel(
        imagPath: AppAssets.on1,
        title: AppStrings.on1title,
        subtitle: AppStrings.on1subtitle),
    OnBoradingModel(
        imagPath: AppAssets.on2,
        title: AppStrings.on2title,
        subtitle: AppStrings.on1subtitle),
    OnBoradingModel(
        imagPath: AppAssets.on3,
        title: AppStrings.on3title,
        subtitle: AppStrings.on1subtitle)
  ];
}
