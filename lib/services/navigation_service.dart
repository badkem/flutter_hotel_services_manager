import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_colors.dart';

class NavigationService {
  List<BubbleBottomBarItem> getNavigationItemList() {
    return <BubbleBottomBarItem>[
      BubbleBottomBarItem(
          backgroundColor: AppColors.iconColor,
          icon: Image.asset("assets/images/ic_food.png", width: 21, height: 21, color: AppColors.iconColor,),
          activeIcon: Image.asset("assets/images/ic_food.png",width: 21, height: 21, color: AppColors.iconColor,),
          title: Text("Foods", style: TextStyle(fontSize: 14, color: Colors.white,),)),
      BubbleBottomBarItem(
          backgroundColor: AppColors.iconColor,
          icon: Image.asset("assets/images/ic_laundry.png", width: 21, height: 21, color: AppColors.iconColor,),
          activeIcon: Image.asset("assets/images/ic_laundry.png", width: 21, height: 21, color: AppColors.iconColor,),
          title: Text("Laundry", style: TextStyle(fontSize: 14, color: Colors.white,),)),
      BubbleBottomBarItem(
          backgroundColor: AppColors.iconColor,
          icon: Image.asset("assets/images/ic_newsfeed.png", width: 21, height: 21, color: Colors.white),
          activeIcon: Image.asset("assets/images/ic_newsfeed.png", width: 21, height: 21, color: Colors.white),
          title: Text("News", style: TextStyle(fontSize: 14, color: Colors.white,),)),
      BubbleBottomBarItem(
          backgroundColor: AppColors.iconColor,
          icon: Icon(Icons.notifications_off_outlined, size: 21, color: AppColors.iconColor,),
          activeIcon: Icon(Icons.notifications_off_outlined, size: 21, color: AppColors.iconColor,),
          title: Text("Don't Disturb", style: TextStyle(fontSize: 12, color: AppColors.iconColor,),)),
      BubbleBottomBarItem(
          backgroundColor: AppColors.iconColor,
          icon: Image.asset("assets/images/ic_hotel.png", width: 21, height: 21, color: AppColors.iconColor,),
          activeIcon: Image.asset("assets/images/ic_hotel.png", width: 21, height: 21, color: AppColors.iconColor,),
          title: Text("Information", style: TextStyle(fontSize: 12, color: Colors.white,),)),
    ];
  }
}
