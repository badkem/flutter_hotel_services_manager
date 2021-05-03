import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/data/model/tourist.dart';
import 'package:khoaluantotnghiep2021/utils/app_clients.dart';
import 'package:khoaluantotnghiep2021/utils/app_endpoint.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TouristController extends GetxController {
  var isLoading = true.obs;
  var isWebViewLoading = true.obs;
  var progress = 0.obs;
  var tourist = Tourist().obs;
  var _urlGetTourist = AppEndpoint.TOURIST;
  var _token;
  WebView webView;

  final key = UniqueKey();

  Future<Tourist> fetchUrlTourist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('user_token');
    try {
      isLoading(true);
      isWebViewLoading(true);
      final response = await AppClients().post(_urlGetTourist,
          options: Options(
            headers: {
              HttpHeaders.authorizationHeader: 'Bearer $_token',
            },
          ));
      tourist.value = Tourist.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
    } finally {
      isLoading(false);
      webView = WebView(
        key: key,
        initialUrl: tourist.value.data.url,
        javascriptMode: JavascriptMode.unrestricted,
        onProgress: (int progressPercent) {
          progress.value = progressPercent;
          print('$progressPercent%');
        },
        onPageFinished: (finish) {
          isWebViewLoading.value = false;
        },
      );
    }
    return tourist.value;
  }

  @override
  void onInit() {
    fetchUrlTourist();
    super.onInit();
  }
  @override
  void onClose() {
    webView = null;
    Get.delete();
    super.onClose();
  }
}