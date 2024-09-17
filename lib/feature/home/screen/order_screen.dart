import 'package:fashion_app/core/resources/app_color.dart';
import 'package:fashion_app/feature/home/bloc/get_order/get_order_bloc.dart';
import 'package:fashion_app/feature/home/bloc/get_order/get_order_event.dart';
import 'package:fashion_app/feature/home/bloc/get_order/get_order_state.dart';
import 'package:fashion_app/feature/home/widget/row_of_order.dart';
import 'package:fashion_app/feature/share/shimmer_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetOrderBloc()..add(GetOrderSuccessEvent()),
      child: SafeArea(child: Scaffold(
        body: BlocBuilder<GetOrderBloc, GetOrderState>(
          builder: (context, state) {
            if (state is GetOrderSuccessState) {
              return Expanded(
                child: ListView.builder(
                    itemCount: state.order.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('clothes_details',
                              arguments: state.order[index].id);
                        },
                        child: Row(
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  for (var cloth in state.order[index].clothes)
                                    //  Text(cloth.clothes.description)
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          'http://yamen146.pythonanywhere.com/${cloth.clothes.image}',
                                          width: 120.w,
                                          fit: BoxFit.cover,
                                          height: 120.h,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (var cloth in state.order[index].clothes)
                                  RowOfOrder(
                                    title1: 'Name :',
                                    title2: cloth.clothes.name,
                                  ),
                                RowOfOrder(
                                  title1: 'Date of order :',
                                  title2: state.order[index].date.toString(),
                                ),
                                RowOfOrder(
                                  title1: 'Cost :',
                                  title2: state.order[index].cost.toString(),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Is deliverd :  ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(color: AppColor.primary),
                                    ),
                                    Container(
                                      width: 25.w,
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                          color: AppColor.primarylight
                                              .withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Icon(
                                        state.order[index].is_delivered
                                            ? Icons.check
                                            : Icons.close,
                                        color: state.order[index].is_delivered
                                            ? Colors.green
                                            : AppColor.red,
                                      ),
                                    )
                                  ],
                                ),
                                RowOfOrder(
                                  title1: 'Mode of payment :',
                                  title2: state.order[index].mode_of_payment
                                      .toString(),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              );
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
      )),
    );
  }
}
