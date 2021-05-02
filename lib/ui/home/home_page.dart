import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/controller/home/history/history_controller.dart';

import 'package:khoaluantotnghiep2021/controller/home/home_controller.dart';
import 'package:khoaluantotnghiep2021/controller/login/login_controller.dart';
import 'package:khoaluantotnghiep2021/ui/home/disturb/disturb_page.dart';
import 'package:khoaluantotnghiep2021/ui/home/history/history_page.dart';
import 'package:khoaluantotnghiep2021/ui/home/tourist/tourist_page.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_colors.dart';

import 'package:khoaluantotnghiep2021/ui/home/laundry/laundry_page.dart';
import 'food_service/food_service_page.dart';

// ignore: must_be_immutable
class HomePage extends GetView<HomeController> {
  double height, width;
  @override
  Widget build(BuildContext context) {
    LoginController l = Get.find();
    HistoryController hc = Get.find();
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text( 'Room: ' +
                          l.textRoomName.text,
                          style: TextStyle(
                              fontSize: 20,
                              color: AppColors.primaryTextColor),
                        ),
                        Text( 'GUEST NAME: ' +
                          l.guestName.value,
                          style: TextStyle(
                              fontSize: 18, color: AppColors.primaryTextColor),
                        ),
                      ],
                    )),
                    InkWell(
                      splashColor: Colors.grey.shade200,
                      onTap: () {
                        controller.pageController.jumpToPage(5);
                        hc.getCarts();
                      },
                      child: Text(
                        "History",
                        style: TextStyle(
                            fontSize: 18, color: AppColors.primaryTextColor),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: PageView(
                  controller: controller.pageController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    FoodServicePage(),
                    LaundryPage(),
                    TouristPage(),
                    DisturbPage(),
                    Text("Ok"),
                    HistoryPage(),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: ValueBuilder<int>(
          initialValue: 0,
          builder: (value, updateFn) => Container(
            color: AppColors.bottomBarColor,
            child: BubbleBottomBar(
              backgroundColor: AppColors.bottomBarColor,
              opacity: .2,
              currentIndex: value,
              onTap: (tab) {
                controller.pageController.jumpToPage(tab);
                updateFn(tab);
              },
              elevation: 8.0,
              hasInk: true,
              inkColor: Colors.white,
              items: controller.navigationItems,
            ),
          ),
        ),
      ),
    );
  }
}
