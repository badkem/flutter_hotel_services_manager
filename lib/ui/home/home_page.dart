import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/controller/home/food_service/food_service_controller.dart';
import 'package:khoaluantotnghiep2021/controller/home/history/history_controller.dart';

import 'package:khoaluantotnghiep2021/controller/home/home_controller.dart';
import 'package:khoaluantotnghiep2021/controller/home/laundry/laundry_controller.dart';
import 'package:khoaluantotnghiep2021/controller/home/tourist/tourist_controller.dart';
import 'package:khoaluantotnghiep2021/controller/login/login_controller.dart';
import 'package:khoaluantotnghiep2021/ui/home/disturb/disturb_page.dart';
import 'package:khoaluantotnghiep2021/ui/home/history/history_page.dart';
import 'package:khoaluantotnghiep2021/ui/home/tourist/tourist_page.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_colors.dart';

import 'package:khoaluantotnghiep2021/ui/home/laundry/laundry_page.dart';
import 'package:shimmer/shimmer.dart';
import 'food_service/food_service_page.dart';

// ignore: must_be_immutable
class HomePage extends GetView<HomeController> {
  double height, width;
  @override
  Widget build(BuildContext context) {
    LoginController l = Get.find();
    FoodServiceController _foodController = Get.find();
    LaundryController _laundryController = Get.find();
    HistoryController _historyController = Get.find();
    TouristController _tourController = Get.find();
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
                    Center(
                      child: Shimmer.fromColors(
                        enabled: false,
                        baseColor: Colors.grey[200],
                        highlightColor: Colors.grey[350],
                        child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) =>  Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                              child: Container(
                                height: height * 0.16,
                                margin: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.blueGrey.withOpacity(0.2),
                                        spreadRadius: 6,
                                        blurRadius: 7,
                                        offset: Offset(0, 2),
                                      ),
                                    ]),
                                child: Row(
                                  children: [
                                    Container(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.horizontal(left: Radius.circular(8.0)),
                                        child: Image.asset('assets/images/foods.jpeg',
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    SizedBox(width: width * 0.05,),
                                    Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text('Total', style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20, color: AppColors.primaryTextColor)),
                                              SizedBox(width: width * 0.05,),
                                              Text(
                                                  "10000₫",
                                                  style: TextStyle(fontSize: 18, color: AppColors.primaryTextColor, fontWeight: FontWeight.w600)),
                                            ],
                                          ),
                                          Text('PENDING',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20,
                                                  color: AppColors.primaryTextColor)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))),
                    ),
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
                    print(3);
                    break;
                  case 4:
                    print(4);
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
