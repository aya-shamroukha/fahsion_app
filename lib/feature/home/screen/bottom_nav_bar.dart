import 'package:fashion_app/core/resources/app_color.dart';
import 'package:fashion_app/feature/auth/screen/signup_screen.dart';
import 'package:fashion_app/feature/home/screen/discount_screen.dart';
import 'package:fashion_app/feature/home/screen/home_screen.dart';
import 'package:fashion_app/feature/home/screen/location_screen.dart';
import 'package:fashion_app/feature/home/screen/order_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarr extends StatefulWidget {
  const BottomNavigationBarr({super.key});
  @override
  State<BottomNavigationBarr> createState() => _BottomNavigationBarrState();
}

class _BottomNavigationBarrState extends State<BottomNavigationBarr> {
  int selectedindex = 0;
  var screen = [
    HomeScreen(),
    const OrderScreen(),
    const DiscountScreen(),
    const LocationScreen()
  ];
  List body = [
    const Icon(Icons.home),
    const Icon(Icons.shopping_cart),
    const Icon(Icons.favorite),
    const Icon(Icons.settings)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            currentIndex: selectedindex,
            selectedItemColor: AppColor.primary,
            unselectedItemColor: AppColor.grey,
            backgroundColor: Colors.transparent,
            onTap: (index) {
              setState(() {
                selectedindex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                label: 'home',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Oreder',
                icon: Icon(Icons.shopping_cart),
              ),
              BottomNavigationBarItem(
                label: 'Offer',
                icon: Icon(Icons.local_offer),
              ),
              BottomNavigationBarItem(
                label: 'My Location',
                icon: Icon(Icons.location_on),
              )
            ]),
      ),
      body: screen[selectedindex],
    );
  }
}
