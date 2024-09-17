import 'package:fashion_app/core/resources/app_string.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/app_color.dart';

class RowOfSeeAll extends StatelessWidget {
  const RowOfSeeAll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextButton(
            child: Text(
              textAlign: TextAlign.right,
              AppStrings.seeall,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: AppColor.primary),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('patron');
            },
          ),
        ),
      ],
    );
  }
}
