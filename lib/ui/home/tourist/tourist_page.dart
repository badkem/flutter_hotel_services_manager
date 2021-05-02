import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:khoaluantotnghiep2021/controller/home/tourist/tourist_controller.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TouristPage extends GetView<TouristController> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    return Scaffold(
      body: Obx(() => controller.isLoading.value ?
      Center(child: CircularProgressIndicator()) :
      Stack(
        children: <Widget>[
          controller.webView,
          controller.isWebViewLoading.value ?
          Center(child: Text(
              'Loading ' + '${controller.progress}%',
              style: TextStyle(fontSize: 20, color: AppColors.primaryTextColor))) : Stack(),
        ],
      )
      ),
    );
  }
}
