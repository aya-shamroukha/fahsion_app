import 'package:fashion_app/core/resources/app_color.dart';
import 'package:fashion_app/feature/clothes/widget/custom_text.dart';
import 'package:flutter/material.dart';

class RowOfOrder extends StatelessWidget {
  const RowOfOrder({
    super.key,
    required this.title1,
    required this.title2,
  });
  final String title1;

  final String title2;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title1,
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: AppColor.primary),
        ),
        CustomText(
          text: title2,
          size: 14,
        )
      ],
    );
  }
}
