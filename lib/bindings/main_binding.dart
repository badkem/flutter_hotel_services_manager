import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/controller/home/home_controller.dart';
import 'package:khoaluantotnghiep2021/controller/home/food_service_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<FoodServiceController>(FoodServiceController());
  }
}