import 'package:fashion_app/core/resources/app_color.dart';
import 'package:fashion_app/feature/share/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColumnForDetails extends StatelessWidget {
  const ColumnForDetails({
    super.key,
    required this.text,
    required this.details,
  });
  final String text;
  final String details;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppColor.primary),
        ),
        SizedBox_Height(height: 5.h),
        Text(
          details,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppColor.grey, fontSize: 15),
        )
      ],
    );
  }
}
