import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/controller/home/disturb/disturb_controller.dart';

import 'package:khoaluantotnghiep2021/controller/home/history/history_controller.dart';
import 'package:khoaluantotnghiep2021/controller/home/home_controller.dart';
import 'package:khoaluantotnghiep2021/controller/home/food_service/food_service_controller.dart';
import 'package:khoaluantotnghiep2021/controller/home/laundry/laundry_controller.dart';
import 'package:khoaluantotnghiep2021/controller/home/tourist/tourist_controller.dart';
import 'package:khoaluantotnghiep2021/controller/login/login_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<FoodServiceController>(() =>FoodServiceController());
    Get.lazyPut<LaundryController>(() => LaundryController());
    Get.lazyPut<HistoryController>(() => HistoryController());
    Get.lazyPut<TouristController>(() => TouristController());
    Get.lazyPut<DisturbController>(() => DisturbController());
  }
}