import 'package:fashion_app/core/config/localstorage.dart';
import 'package:fashion_app/core/config/theme/theme.dart';
import 'package:fashion_app/core/resources/bloc_observer.dart';
import 'package:fashion_app/feature/auth/screen/login_screen.dart';
import 'package:fashion_app/feature/auth/screen/signup_screen.dart';
import 'package:fashion_app/feature/clothes/bloc/add_new_comment/add_new_comment_bloc.dart';
import 'package:fashion_app/feature/clothes/bloc/get_clothes_byid/get_clothes_by_id_bloc.dart';
import 'package:fashion_app/feature/clothes/screen/all_clothes_screen.dart';
import 'package:fashion_app/feature/clothes/screen/clothes_details.dart';
import 'package:fashion_app/feature/home/screen/all_patron.dart';
import 'package:fashion_app/feature/home/screen/bottom_nav_bar.dart';
import 'package:fashion_app/feature/home/screen/home_screen.dart';
import 'package:fashion_app/feature/home/screen/order_screen.dart';
import 'package:fashion_app/feature/on_boarding/on_boarding.dart';
import 'package:fashion_app/feature/on_boarding/splash_screen.dart';
import 'package:fashion_app/feature/on_boarding/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await initgetit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AddNewCommentBloc(),
              ),
              BlocProvider(
                create: (context) => GetClothesByIdBloc(),
              ),
            ],
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: appTheme,
              debugShowCheckedModeBanner: false,
              home: const SplashScreen(),
              routes: {
                'welcome': (context) => const WelcomeScreen(),
                'on': (context) => OnBoaringScreens(),
                'sign': (context) => const SignupScreen(),
                'login': (context) => const LoginScreen(),
                'home': (context) => HomeScreen(),
                'patron': (context) => const AllPatronScreen(),
                'allclothes': (context) => const AllClothesScreen(),
                'clothes_details': (context) => ClothesDetails(),
                'bottom': (context) => const BottomNavigationBarr(),
                'order': (context) => const OrderScreen(),
              },
            ),
          );
        });
  }
}
