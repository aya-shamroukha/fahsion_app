import 'package:fashion_app/core/domain/model/auth/signup_model.dart';
import 'package:fashion_app/core/resources/app_color.dart';
import 'package:fashion_app/core/resources/app_string.dart';
import 'package:fashion_app/feature/auth/bloc/signup_bloc/sign_up_bloc.dart';
import 'package:fashion_app/feature/auth/bloc/signup_bloc/sign_up_state.dart';
import 'package:fashion_app/feature/share/custom_button.dart';
import 'package:fashion_app/feature/share/custom_text_field.dart';
import 'package:fashion_app/feature/share/my_loading.dart';
import 'package:fashion_app/feature/share/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/signup_bloc/sign_up_event.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          var signupbloc = BlocProvider.of<SignUpBloc>(context);

          return Form(
            key: signupbloc.formkey,
            child: SafeArea(
                child: Scaffold(
              body: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox_Height(height: 70.h),
                      Center(
                        child: Text(
                          AppStrings.creataccount,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                      SizedBox_Height(height: 20.h),
                      Text(
                        AppStrings.creataccounttitle,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontWeight: FontWeight.w300,
                                color: AppColor.grey),
                      ),
                      SizedBox_Height(height: 50.h),
                      //!username
                      CustomTextfield(
                        labeltext: AppStrings.username,
                        controller: signupbloc.username,
                        validate: (val) {
                          if (val.isEmpty) {
                            return AppStrings.nameErrorMsg;
                          }
                          return null;
                        },
                      ),
                      CustomTextfield(
                        labeltext: AppStrings.email,
                        controller: signupbloc.email,
                        validate: (val) {
                          if (val.isEmpty && !val.contains('@gmail.com')) {
                            return AppStrings.nameErrorMsg;
                          }
                          return null;
                        },
                      ),
                      //!phone
                      CustomTextfield(
                        labeltext: AppStrings.phone,
                        controller: signupbloc.phone,
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
                        controller: signupbloc.password,
                        isScreat: signupbloc.isPassword,
                        suffixicon: IconButton(
                            onPressed: () {
                              context
                                  .read<SignUpBloc>()
                                  .add(PasswordEvent(signupbloc.isPassword));
                            },
                            icon: signupbloc.isPassword == true
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
                            AppStrings.haveaccount,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('login');
                            },
                            child: Text(
                              AppStrings.login,
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
                      SizedBox_Height(height: 130.h),

                      state is SignUpLoadingState
                          ? const Loading()
                          : CustomButton(
                              onPressed: () {
                                if (BlocProvider.of<SignUpBloc>(context)
                                    .formkey
                                    .currentState!
                                    .validate()) {
                                  context
                                      .read<SignUpBloc>()
                                      .add(SignUpSuccess(SignupModel(
                                        name: signupbloc.username.text,
                                        phone: signupbloc.phone.text,
                                        password: signupbloc.password.text,
                                        email: signupbloc.email.text,
                                      )));
                                  // Navigator.of(context)
                                  //     .pushReplacementNamed('bottom');
                                }
                              },
                              text: AppStrings.signup,
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
