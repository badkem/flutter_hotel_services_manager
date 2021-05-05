import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:khoaluantotnghiep2021/controller/home/food_service/food_service_controller.dart';
import 'package:khoaluantotnghiep2021/controller/home/history/history_controller.dart';
import 'package:khoaluantotnghiep2021/controller/home/home_controller.dart';
import 'package:khoaluantotnghiep2021/controller/home/hotel_info/hotel_info_controller.dart';
import 'package:khoaluantotnghiep2021/controller/home/laundry/laundry_controller.dart';
import 'package:khoaluantotnghiep2021/controller/home/tourist/tourist_controller.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_colors.dart';

import 'laundry/laundry_page.dart';
import 'disturb/disturb_page.dart';
import 'history/history_page.dart';
import 'food_service/food_service_page.dart';
import 'hotel_info/hotel_info_page.dart';
import 'tourist/tourist_page.dart';

// ignore: must_be_immutable
class HomePage extends GetView<HomeController> {
  double height, width;
  @override
  Widget build(BuildContext context) {
    FoodServiceController _foodController = Get.find();
    LaundryController _laundryController = Get.find();
    HistoryController _historyController = Get.find();
    TouristController _tourController = Get.find();
    HotelInfoController _hotelItemController = Get.find();
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
                          controller.roomName.value,
                          style: TextStyle(
                              fontSize: 20,
                              color: AppColors.primaryTextColor),
                        ),
                        Text( 'GUEST NAME: ' +
                          controller.guestName.value,
                          style: TextStyle(
                              fontSize: 18, color: AppColors.primaryTextColor),
                        ),
                      ],
                    )),
                    InkWell(
                      splashColor: Colors.grey.shade200,
                      onTap: () {
                        controller.pageController.jumpToPage(5);
                        _historyController.getCarts();
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
                    HotelInfoPage(),
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
                switch (tab){
                  case 0:
                    _foodController.getFoodList();
                    _foodController.getAllPromo();
                  break;
                  case 1:
                    _laundryController.getLaundryList();
                    break;
                  case 2:
                    _tourController.fetchUrlTourist();
                    break;
                  case 3:
                    break;
                  case 4:
                    _hotelItemController.getHotelItem();
                    break;
                  case 5:
                    print(5);
                    break;
                }
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
