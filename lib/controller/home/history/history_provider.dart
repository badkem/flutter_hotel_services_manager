import 'dart:io';

import 'package:dio/dio.dart';
import 'package:khoaluantotnghiep2021/data/model/carts.dart';
import 'package:khoaluantotnghiep2021/utils/app_clients.dart';
import 'package:khoaluantotnghiep2021/utils/app_endpoint.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryProvider {
  Carts carts;

  String _token;
  int _roomId;

  String _urlGetListCart = AppEndpoint.GET_LIST_CART;

  Future<Carts> getListCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('user_token');
    _roomId = prefs.getInt('room_id');
    var query = {
      'roomId': _roomId
    };
    try {
      final response = await AppClients().post(_urlGetListCart,
          data: query,
          options: Options(
            headers: {
              HttpHeaders.authorizationHeader: 'Bearer $_token',
              HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
            },
          ));
      carts = Carts.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
    }
    return carts;
  }

}