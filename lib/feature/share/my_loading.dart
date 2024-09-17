import 'package:fashion_app/core/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpinKitChasingDots(
      color: AppColor.primary,
    );
  }
}
