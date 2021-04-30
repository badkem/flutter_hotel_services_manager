import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:khoaluantotnghiep2021/controller/home/history/history_provider.dart';
import 'package:khoaluantotnghiep2021/data/model/carts.dart';
import 'package:khoaluantotnghiep2021/services/time_ago.dart';

class HistoryController extends GetxController {
  var listCarts = Carts().obs;
  var isLoading = true.obs;

  void getCarts() async {
    try {
      isLoading(true);
      var carts =  await HistoryProvider().getListCart();
      if(listCarts != null){
          listCarts.value = carts;
          listCarts.value.data.carts.sort((a, b) {
            var x = TimeAgo.timeAgoSinceDate('${a.dateCreated}');
            var y = TimeAgo.timeAgoSinceDate('${b.dateCreated}');
            return y.compareTo(x);
          });
      }
    } finally {
      isLoading(false);
    }
  }

  void onScroll() {
     CircularProgressIndicator();
  }

  @override
  void onClose() {
    Get.delete();
    super.onClose();
  }
}