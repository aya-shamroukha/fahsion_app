import 'package:fashion_app/core/domain/model/auth/login_model.dart';
import 'package:fashion_app/core/resources/app_color.dart';
import 'package:fashion_app/core/resources/app_string.dart';
import 'package:fashion_app/feature/auth/bloc/login_bloc/log_in_bloc.dart';
import 'package:fashion_app/feature/auth/bloc/login_bloc/log_in_event.dart';
import 'package:fashion_app/feature/auth/bloc/login_bloc/log_in_state.dart';
import 'package:fashion_app/feature/share/back_widget.dart';
import 'package:fashion_app/feature/share/custom_button.dart';
import 'package:fashion_app/feature/share/custom_text_field.dart';
import 'package:fashion_app/feature/share/my_loading.dart';
import 'package:fashion_app/feature/share/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogInBloc(),
      child: BlocBuilder<LogInBloc, LogInState>(
        builder: (context, state) {
          var loginbloc = BlocProvider.of<LogInBloc>(context);

          return Form(
            key: loginbloc.formkey,
            child: SafeArea(
                child: Scaffold(
              body: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox_Height(height: 10.h),

                      const BackWidget(),
                      SizedBox_Height(height: 70.h),
                      Center(
                        child: Text(
                          AppStrings.login,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                      SizedBox_Height(height: 20.h),
                      Text(
                        AppStrings.logintitle,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontWeight: FontWeight.w300,
                                color: AppColor.grey),
                      ),
                      SizedBox_Height(height: 50.h),

                      CustomTextfield(
                        labeltext: AppStrings.email,
                        controller: loginbloc.email,
                        validate: (val) {
                          if (val.isEmpty && !val.contains('@gmail.com')) {
                            return AppStrings.nameErrorMsg;
                          }
                          return null;
                        },
                      ),

                      //!password
                      CustomTextfield(
                        validate: (val) {
                          if (val!.length < 8) {
                            return AppStrings.passwordlenght;
                          } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                              .hasMatch(val)) {
                            return AppStrings.passwordchar;
                          } else if (!RegExp(r'[A-Z]').hasMatch(val)) {
                            return AppStrings.passwordupper;
                          }
                          return null;
                        },
                        labeltext: AppStrings.password,
                        controller: loginbloc.password,
                        isScreat: loginbloc.isPassword,
                        suffixicon: IconButton(
                            onPressed: () {
                              context
                                  .read<LogInBloc>()
                                  .add(PasswordEvent(loginbloc.isPassword));
                            },
                            icon: loginbloc.isPassword == true
                                ? Icon(
                                    Icons.visibility_off,
                                    color: AppColor.primary,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: AppColor.primary,
                                  )),
                      ),
                      Row(
                        children: [
                          SizedBox_width(width: 20.w),
                          Text(
                            AppStrings.donthaveaccount,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('sign');
                            },
                            child: Text(
                              AppStrings.signup,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      color: AppColor.primary,
                                      textBaseline: TextBaseline.alphabetic),
                            ),
                          )
                        ],
                      ),
                      SizedBox_Height(height: 190.h),

                      state is LogInLoadingState
                          ? const Loading()
                          : CustomButton(
                              onPressed: () {
                                if (BlocProvider.of<LogInBloc>(context)
                                    .formkey
                                    .currentState!
                                    .validate()) {
                                  context
                                      .read<LogInBloc>()
                                      .add(LogInSuccess(LoginModel(
                                        password: loginbloc.password.text,
                                        email: loginbloc.email.text,
                                      )));
                                  Navigator.of(context)
                                      .pushReplacementNamed('bottom');
                                }
                              },
                              text: AppStrings.login,
                            )
                    ],
                  ),
                ),
              ),
            )),
          );
        },
      ),
    );
  }
}
