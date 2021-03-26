import 'package:badges/badges.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_colors.dart';

class NavigationService {
  List<BubbleBottomBarItem> getNavigationItemList() {
    return <BubbleBottomBarItem>[
      BubbleBottomBarItem(
          backgroundColor: AppColors.bottomBarColor,
          icon: Image.asset("assets/images/ic_food_2.png", height: 24,),
          activeIcon: Image.asset("assets/images/ic_food_2.png", height: 18,),
          title: Text("Foods", style: TextStyle(fontSize: 14),)),
      BubbleBottomBarItem(
          backgroundColor: AppColors.bottomBarColor,
          icon: Image.asset("assets/images/ic_laundry_2.png", height: 24,),
          activeIcon: Image.asset("assets/images/ic_laundry_2.png", height: 18,),
          title: Text("Laundry", style: TextStyle(fontSize: 14),)),
      BubbleBottomBarItem(
          backgroundColor: AppColors.bottomBarColor,
          icon: Image.asset("assets/images/ic_tourist.png", height: 24, color: Colors.black,),
          activeIcon: Image.asset("assets/images/ic_tourist.png", height: 18, color: Colors.black,),
          title: Text("Activity", style: TextStyle(fontSize: 14),)),
      BubbleBottomBarItem(
          backgroundColor: AppColors.bottomBarColor,
          icon: Image.asset("assets/images/ic_do_not_distrup.png", height: 22, color: Colors.black,),
          activeIcon: Image.asset("assets/images/ic_do_not_distrup.png", height: 14, color: Colors.black,),
          title: Text("Don't Distrup", style: TextStyle(fontSize: 12),)),
      BubbleBottomBarItem(
          backgroundColor: AppColors.bottomBarColor,
          icon: Image.asset("assets/images/ic_hotel.png", height: 24,),
          activeIcon: Image.asset("assets/images/ic_hotel.png", height: 14,),
          title: Text("Information", style: TextStyle(fontSize: 12),)),
    ];
  }
}
