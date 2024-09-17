import 'package:fashion_app/core/resources/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PositionedForIcon extends StatelessWidget {
  const PositionedForIcon({
    super.key,
    this.top,
    this.right,
    this.bottom,
    this.left,
    required this.icon,
    this.onPressed,
  });
  final double? top;
  final double? right;
  final double? bottom;
  final double? left;
  final IconData icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      left: left,
      bottom: bottom,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 35.w,
          height: 30.h,
          decoration: BoxDecoration(
              color: AppColor.primarylight.withOpacity(0.7),
              borderRadius: BorderRadius.circular(100)),
          child: Center(
            child: IconButton(
                onPressed: onPressed,
                icon: Icon(
                  icon,
                  color: AppColor.primary,
                )),
          ),
        ),
      ),
    );
  }
}
