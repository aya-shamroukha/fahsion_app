import 'package:fashion_app/core/resources/app_color.dart';
import 'package:fashion_app/feature/home/bloc/get_all_patron/get_all_patron_bloc.dart';
import 'package:fashion_app/feature/home/bloc/get_all_patron/get_all_patron_event.dart';
import 'package:fashion_app/feature/share/back_widget.dart';
import 'package:fashion_app/feature/share/shimmer_body.dart';
import 'package:fashion_app/feature/share/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../bloc/get_all_patron/get_all_patron_state.dart';
import 'home_screen.dart';

class AllPatronScreen extends StatelessWidget {
  const AllPatronScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllPatronBloc()..add(GetAllPatronSuccessEvent()),
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<GetAllPatronBloc, GetAllPatronState>(
            builder: (context, state) {
              if (state is GetAllPatronSuccessState) {
                return Column(children: [
                  SizedBox_Height(height: 20.h),
                  const BackWidget(),
                  SizedBox_Height(height: 10.h),
                  Expanded(
                    child: ListView.builder(
                        itemCount: state.allPatron.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    images2[index],
                                    height: 155.h,
                                    width: 400.w,
                                    fit: BoxFit.cover,
                                    scale: 0.5,
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 74.w,
                                      //height: 50.h,
                                      decoration: BoxDecoration(
                                          color: AppColor.primarylight
                                              .withOpacity(0.7),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            state.allPatron[index].name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displaySmall!
                                                .copyWith(
                                                    color: AppColor.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          );
                        }),
                  ),
                ]);
              } else {
                return SizedBox(
                  height: double.maxFinite,
                  width: 400,
                  child: Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 11,
                        itemBuilder: ((context, index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: ShimmerBodyForImage(
                              height: 155.h,
                              width: 400.w,
                            ),
                          );
                        })),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
