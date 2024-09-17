import 'package:fashion_app/core/resources/app_color.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.horizontal,
  });
  final String text;
  final Color? color;
  final double? size;
  final double? horizontal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: 3.0, horizontal: horizontal ?? 20),
      child: Text(
        textAlign: TextAlign.start,
        text,
        style: Theme.of(context)
            .textTheme
            .displayMedium!
            .copyWith(color: color ?? AppColor.grey, fontSize: size),
      ),
    );
  }
}
