import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisturbController extends GetxController with SingleGetTickerProviderMixin{
  AnimationController animationController;
  var isSubmit = false.obs;
  var min = 0.obs;
  var hour = 0.obs;
  var levelClock = 0.obs;

   getLevelClock (int hour, int min) {
     try {
       isSubmit(false);
       levelClock.value = hour * 3600 + min * 60;
     } finally {
       isSubmit(true);
       animationController = AnimationController(vsync: this, duration: Duration(seconds: levelClock.value));
       animationController.forward();
     }
     return levelClock;
  }

  stopTimer() {
     isSubmit(false);
     animationController.reset();
  }


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    Get.delete();
    super.onClose();
  }
}