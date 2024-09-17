// ignore_for_file: avoid_print

import 'package:fashion_app/core/config/localstorage.dart';
import 'package:fashion_app/feature/clothes/bloc/get_clothesby_category/get_clothes_by_category_bloc.dart';
import 'package:fashion_app/feature/clothes/bloc/get_clothesby_category/get_clothes_by_category_event.dart';
import 'package:fashion_app/feature/clothes/bloc/get_clothesby_category/get_clothes_by_category_state.dart';
import 'package:fashion_app/feature/share/back_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/resources/app_color.dart';
import '../../share/shimmer_body.dart';

class AllClothesScreen extends StatelessWidget {
  const AllClothesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetClothesByCategoryBloc()
        ..add(GetClothesByCategorySuccessEvent(
            id: getIt.get<SharedPreferences>().getInt(
                  'id',
                ))),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const BackWidget(),
                BlocBuilder<GetClothesByCategoryBloc,
                    GetClothesByCategoryState>(
                  builder: (context, state) {
                    if (state is GetClothesByCategorySuccessState) {
                      return Expanded(
                        child: ListView.builder(
                            itemCount: state.clothes.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        getIt.get<SharedPreferences>().setInt(
                                            'id_details',
                                            state.clothes[index].id);
                                        Navigator.of(context)
                                            .pushNamed('clothes_details');
                                        print(getIt
                                            .get<SharedPreferences>()
                                            .getInt(
                                              'id_details',
                                            ));
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          'http://yamen146.pythonanywhere.com/${state.clothes[index].image}',
                                          width: 400.w,
                                          height: 300.h,
                                          fit: BoxFit.fill,
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
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  state.clothes[index].name,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displaySmall!
                                                      .copyWith(
                                                          color:
                                                              AppColor.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              );
                            }),
                      );
                    } else {
                      return Expanded(
                        child: SizedBox(
                          height: double.maxFinite,
                          width: 400,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: 10,
                              itemBuilder: ((context, index) {
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  child: ShimmerBodyForImage(
                                    height: 200.h,
                                    width: 400.w,
                                  ),
                                );
                              })),
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
