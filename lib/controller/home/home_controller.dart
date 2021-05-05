import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/services/navigation_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final pageController = PageController();
  List<BubbleBottomBarItem> navigationItems;
  var roomName = ''.obs;
  var guestName = ''.obs;

  getInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     roomName.value = prefs.getString('room_name');
     guestName.value = prefs.getString('customer_name');
  }

  @override
  void onInit() {
    navigationItems = NavigationService().getNavigationItemList();
    getInfo();
    super.onInit();
  }


  @override
  void onClose() {
    pageController.dispose();
    Get.delete();
    super.onClose();
  }
}
