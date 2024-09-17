import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fashion_app/core/resources/app_assets.dart';
import 'package:fashion_app/core/resources/app_color.dart';
import 'package:fashion_app/feature/home/bloc/get_discount/get_all_discount_bloc.dart';
import 'package:fashion_app/feature/home/bloc/get_discount/get_all_discount_event.dart';
import 'package:fashion_app/feature/home/bloc/get_discount/get_all_discount_state.dart';
import 'package:fashion_app/feature/home/widget/row_of_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountScreen extends StatelessWidget {
  const DiscountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetAllDiscountBloc()..add(GetAllDiscountSuccessEvent()),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Image.asset(
                AppAssets.discount,
                width: double.infinity,
                height: 250.h,
                fit: BoxFit.fill,
              ),
              //SizedBox_Height(height: 20.h),
              BlocBuilder<GetAllDiscountBloc, GetAllDiscountState>(
                builder: (context, state) {
                  if (state is GetAllDiscountSuccessState) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: state.discount.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Divider(),
                                ),
                                ListTile(
                                  leading: Icon(
                                    Icons.local_offer,
                                    color: AppColor.primary,
                                  ),
                                  onTap: () {
                                    AwesomeDialog(
                                      titleTextStyle: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(
                                              color: AppColor.primary,
                                              fontSize: 25),
                                      context: context,
                                      descTextStyle: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(color: AppColor.grey2),
                                      dialogType: DialogType.question,
                                      animType: AnimType.rightSlide,
                                      title:
                                          'Do you want to use this discount?',
                                      btnCancelOnPress: () {},
                                      btnOkColor: AppColor.primary,
                                      btnOkText: 'Yes',
                                      btnCancelColor: AppColor.primarylight
                                          .withOpacity(0.6),
                                      btnOkOnPress: () {},
                                    ).show();
                                  },
                                  title: RowOfOrder(
                                      title1: 'Name of Discount :',
                                      title2: state.discount[index].name),
                                  subtitle: Column(
                                    children: [
                                      RowOfOrder(
                                          title1: 'PrecentTag :',
                                          title2: state
                                              .discount[index].precentage
                                              .toString()),
                                      RowOfOrder(
                                          title1: 'From-Date :',
                                          title2: state
                                              .discount[index].from_date
                                              .toString()),
                                      RowOfOrder(
                                          title1: 'To-Date :',
                                          title2: state.discount[index].to_date
                                              .toString()),
                                      RowOfOrder(
                                          title1: 'Count :',
                                          title2: state.discount[index].count
                                              .toString()),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColor.primary,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
