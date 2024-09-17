import 'package:fashion_app/core/config/localstorage.dart';
import 'package:fashion_app/core/resources/app_color.dart';
import 'package:fashion_app/core/resources/app_string.dart';
import 'package:fashion_app/feature/clothes/bloc/add_new_comment/add_new_comment_bloc.dart';
import 'package:fashion_app/feature/clothes/bloc/get_clothes_byid/get_clothes_by_id_bloc.dart';
import 'package:fashion_app/feature/clothes/bloc/get_clothes_byid/get_clothes_by_id_event.dart';
import 'package:fashion_app/feature/clothes/bloc/get_clothes_byid/get_clothes_by_id_state.dart';
import 'package:fashion_app/feature/clothes/widget/column_for_details.dart';
import 'package:fashion_app/feature/clothes/widget/comment_widget.dart';
import 'package:fashion_app/feature/clothes/widget/correct_size.dart';
import 'package:fashion_app/feature/clothes/widget/custom_text.dart';
import 'package:fashion_app/feature/clothes/widget/positioned_for_icon.dart';
import 'package:fashion_app/feature/share/custom_button.dart';
import 'package:fashion_app/feature/share/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClothesDetails extends StatelessWidget {
  ClothesDetails({super.key});
  final bool isComment = false;
  final TextEditingController comment = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetClothesByIdBloc()
            ..add(GetClothesByIdSuccessEvent(
                id: getIt.get<SharedPreferences>().getInt(
                      'id_details',
                    ))),
        ),
        BlocProvider(
          create: (context) => AddNewCommentBloc(),
        ),
      ],
      child: SafeArea(
          child: Scaffold(
        body: RefreshIndicator(
          color: AppColor.primary,
          onRefresh: () async {
            context.read<GetClothesByIdBloc>().add(GetClothesByIdSuccessEvent(
                  id: getIt.get<SharedPreferences>().getInt('id_details'),
                ));
          },
          child: Column(
            children: [
              BlocBuilder<GetClothesByIdBloc, GetClothesByIdState>(
                builder: (context, state) {
                  if (state is GetClothesByIdSuccessState) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Image.network(
                                      'http://yamen146.pythonanywhere.com///${state.clothes.image}',
                                      width: 400.w,
                                      height: 300.h,
                                      fit: BoxFit.fill,
                                    ),
                                    const PositionedForIcon(
                                      icon: Icons.favorite_border_outlined,
                                      top: 10,
                                      right: 0,
                                    ),
                                    PositionedForIcon(
                                      icon: Icons.arrow_back,
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      top: 10,
                                      left: 0,
                                    ),
                                  ],
                                ),
                                SizedBox_Height(
                                  height: 7.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      state.clothes.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(
                                              color: AppColor.textcolor,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ColumnForDetails(
                                        text: AppStrings.price,
                                        details: state.clothes.price.toString(),
                                      ),
                                      ColumnForDetails(
                                        text: AppStrings.gender,
                                        details: state.clothes.gender,
                                      ),
                                      ColumnForDetails(
                                        text: AppStrings.season,
                                        details: state.clothes.season,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox_Height(height: 10.h),
                                CustomText(
                                  text: AppStrings.productDetails,
                                  color: AppColor.primary,
                                ),
                                CustomText(
                                  text: state.clothes.description,
                                  size: 16,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Divider(),
                                ),
                                CustomText(
                                  text: AppStrings.size,
                                  color: AppColor.primary,
                                ),
                                SizedBox_Height(height: 5.h),
                                buildSize(state.clothes.size),
                                SizedBox_Height(height: 5.h),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Divider(),
                                ),
                                CommentWidget(comment: comment),
                                SizedBox_Height(height: 60.h),
                                Center(
                                  child: CustomButton(
                                      onPressed: () {},
                                      text: AppStrings.addtocart),
                                )
                              ],
                            );
                          }),
                    );
                  } else {
                    return Center(
                        child: CircularProgressIndicator(
                      color: AppColor.primary,
                    ));
                  }
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
