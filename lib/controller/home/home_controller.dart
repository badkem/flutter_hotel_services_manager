import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/services/navigation_service.dart';

class HomeController extends GetxController {
  final pageController = PageController();
  List<BubbleBottomBarItem> navigationItems;

  @override
  void onInit() {
    navigationItems = NavigationService().getNavigationItemList();
    super.onInit();
  }


  @override
  void onClose() {
    pageController.dispose();
    Get.delete();
    super.onClose();
  }
}
