import 'package:fashion_app/core/resources/app_color.dart';
import 'package:fashion_app/core/resources/app_string.dart';
import 'package:flutter/material.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColor.primary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Text(
          AppStrings.back,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}
