import 'package:fashion_app/core/resources/app_color.dart';
import 'package:fashion_app/feature/clothes/widget/custom_text.dart';
import 'package:flutter/material.dart';

Widget buildSize(dynamic clothes) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: clothes == 'S'
                  ? AppColor.primarylight.withOpacity(0.7)
                  : AppColor.white.withOpacity(0.7)),
          child: CustomText(
            text: 'S',
            color: AppColor.primary,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: clothes == 'M'
                  ? AppColor.primarylight.withOpacity(0.7)
                  : AppColor.white.withOpacity(0.7)),
          child: CustomText(
            text: 'M',
            color: AppColor.primary,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: clothes == 'L'
                  ? AppColor.primarylight.withOpacity(0.7)
                  : AppColor.white.withOpacity(0.7)),
          child: CustomText(
            text: 'L',
            color: AppColor.primary,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: clothes == 'XL'
                  ? AppColor.primarylight.withOpacity(0.7)
                  : AppColor.white.withOpacity(0.7)),
          child: CustomText(
            text: 'XL',
            color: AppColor.primary,
          ),
        ),
      ],
    ),
  );
}
