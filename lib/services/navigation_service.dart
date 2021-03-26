import 'package:badges/badges.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_colors.dart';

class NavigationService {
  List<BubbleBottomBarItem> getNavigationItemList() {
    return <BubbleBottomBarItem>[
      BubbleBottomBarItem(
          backgroundColor: AppColors.bottomBarColor,
          icon: Icon(
            Icons.home,
            color: Colors.black54,
          ),
          activeIcon: Icon(Icons.home),
          title: Text("Home")),
      BubbleBottomBarItem(
          backgroundColor: AppColors.bottomBarColor,
          icon: Icon(
            Icons.search,
            color: Colors.black54,
          ),
          activeIcon: Icon(Icons.search),
          title: Text("Search")),
      BubbleBottomBarItem(
          backgroundColor: AppColors.bottomBarColor,
          icon: Badge(
            padding:
            EdgeInsets.only(top: 5.0, bottom: 5.0, right: 4.0, left: 5.0),
            animationType: BadgeAnimationType.scale,
            animationDuration: Duration(milliseconds: 200),
            badgeContent: Text(
              '7',
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
            child: Icon(
              Icons.notifications,
              color: Colors.black54,
            ),
          ),
          activeIcon: Icon(Icons.notifications),
          title: Text("Notify")),
      BubbleBottomBarItem(
          backgroundColor: AppColors.bottomBarColor,
          icon: Icon(
            Icons.apartment,
            color: Colors.black54,
          ),
          activeIcon: Icon(Icons.person),
          title: Text("Profile"))
    ];
  }
}