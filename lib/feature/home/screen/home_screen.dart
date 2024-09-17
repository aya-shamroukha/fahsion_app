// ignore_for_file: avoid_print

import 'package:fashion_app/core/config/localstorage.dart';
import 'package:fashion_app/core/resources/app_assets.dart';
import 'package:fashion_app/core/resources/app_color.dart';
import 'package:fashion_app/core/resources/app_string.dart';
import 'package:fashion_app/feature/home/bloc/get_all_category/get_all_category_bloc.dart';
import 'package:fashion_app/feature/home/bloc/get_all_category/get_all_category_event.dart';
import 'package:fashion_app/feature/home/bloc/get_all_category/get_all_category_state.dart';
import 'package:fashion_app/feature/home/bloc/get_all_patron/get_all_patron_bloc.dart';
import 'package:fashion_app/feature/home/bloc/get_all_patron/get_all_patron_event.dart';
import 'package:fashion_app/feature/home/bloc/get_all_patron/get_all_patron_state.dart';
import 'package:fashion_app/feature/home/widget/row_of_seeall.dart';
import 'package:fashion_app/feature/share/custom_text_field.dart';
import 'package:fashion_app/feature/share/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../share/shimmer_body.dart';

final List<String> images2 = [
  AppAssets.tshirt2,
  AppAssets.oversizeTshirt,
  AppAssets.hoodie,
  AppAssets.graduationStole,
  AppAssets.torso,
  AppAssets.shortSleeve,
  AppAssets.longsleeve,
  AppAssets.skirt,
  AppAssets.cap,
  AppAssets.collar,
  AppAssets.buttonedCollar,
];

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<String> images = [
    AppAssets.tshirt,
    AppAssets.jeans,
    AppAssets.sunglasses,
    AppAssets.dress
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetAllCategoryBloc()..add(GetAllCategorySuccessEvent()),
        ),
        BlocProvider(
          create: (context) =>
              GetAllPatronBloc()..add(GetAllPatronSuccessEvent()),
        ),
      ],
      child: SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox_Height(height: 20.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Hello Aya!',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: AppColor.primary, fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox_Height(height: 10.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: AppColor.primary,
                        size: 30,
                      ),
                      Text(
                        '${getIt.get<SharedPreferences>().getString('address')}',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: AppColor.titlecolor),
                      ),
                    ],
                  ),
                ),
                SizedBox_Height(height: 5.h),
                Row(
                  children: [
                    SizedBox(
                      width: 300.w,
                      height: 72,
                      child: CustomTextfield(
                        labeltext: AppStrings.search,
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColor.primary,
                        ),
                      ),
                    ),
                    Container(
                      height: 40.h,
                      width: 44.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.primary),
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(100)),
                      child: IconButton(
                        icon: const Icon(Icons.tune, color: AppColor.white),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Image.asset(
                    AppAssets.home,
                    width: double.infinity,
                    height: 150.h,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.category,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: AppColor.textcolor),
                      ),
                      TextButton(
                        child: Text(
                          AppStrings.seeall,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(color: AppColor.primary),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                //!category
                BlocBuilder<GetAllCategoryBloc, GetAllCategoryState>(
                    builder: (context, state) {
                  if (state is GetAllCategorySuccessState) {
                    return SizedBox(
                      height: 77.h,
                      width: double.infinity,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          getIt.get<SharedPreferences>().setInt(
                                              'id',
                                              state.allcategory[index].id);
                                          Navigator.of(context)
                                              .pushNamed('allclothes');
                                          print(getIt
                                              .get<SharedPreferences>()
                                              .getInt(
                                                'id',
                                              ));
                                        },
                                        child: Container(
                                          height: 60,
                                          width: 50.w,
                                          decoration: BoxDecoration(
                                              color: AppColor.primarylight
                                                  .withOpacity(0.6),
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          child: Image.asset(
                                            images[index],
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      state.allcategory[index].name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(color: AppColor.titlecolor),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  } else {
                    return SizedBox(
                      height: 70,
                      width: double.infinity,
                      child: Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            itemBuilder: ((context, index) {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child: const ShimmerBody(),
                              );
                            })),
                      ),
                    );
                  }
                }),
                const RowOfSeeAll(),
                //!patron
                BlocBuilder<GetAllPatronBloc, GetAllPatronState>(
                    builder: (context, state) {
                  if (state is GetAllPatronSuccessState) {
                    return SizedBox(
                      height: 177.h,
                      width: double.infinity,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.allPatron.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: InkWell(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.asset(
                                            images2[index],
                                            height: 130.h,
                                            width: 150.w,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox_Height(
                                      height: 7.h,
                                    ),
                                    Text(
                                      state.allPatron[index].name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(color: AppColor.titlecolor),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  } else {
                    return SizedBox(
                      height: 130,
                      width: double.infinity,
                      child: Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            itemBuilder: ((context, index) {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade100,
                                child: ShimmerBodyForImage(
                                  height: 130.h,
                                  width: 150.w,
                                ),
                              );
                            })),
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
