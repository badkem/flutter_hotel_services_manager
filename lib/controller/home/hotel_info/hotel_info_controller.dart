import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/data/model/hotel_item.dart';
import 'package:khoaluantotnghiep2021/utils/app_clients.dart';
import 'package:khoaluantotnghiep2021/utils/app_endpoint.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HotelInfoController extends GetxController {
  var isLoading = true.obs;
  var _token;
  var _urlGetHotelItem = AppEndpoint.GET_HOTEL_ITEM;
  var hotelItem = HotelItem().obs;

  Future<HotelItem> getHotelItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('user_token');
    try {
      isLoading(true);
      var data = {
        "isNow": 1
      };
      final response = await AppClients().post(_urlGetHotelItem,
          data: data,
          options: Options(
            headers: {
              HttpHeaders.authorizationHeader: 'Bearer $_token',
            },
          ));
      hotelItem.value = HotelItem.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
    } finally {
      isLoading(false);
    }
    return hotelItem.value;
  }
  @override
  void onInit() {
    getHotelItem();
    super.onInit();
  }

  @override
  void onClose() {
    Get.delete();
    super.onClose();
  }
}