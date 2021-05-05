import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'routes/app_pages.dart';
import 'ui/home/home_page.dart';
import 'ui/login/login_page.dart';
import 'ui/theme/app_theme.dart';
import 'bindings/main_binding.dart';
import 'resources/strings/localization_service.dart';

void main() async {
  MainBinding().dependencies();
  //block landscape mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown]);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('user_token');
  runApp(
    GetMaterialApp(
      initialRoute: token != null ? Routes.HOME : Routes.LOGIN,
      theme: appThemeData,
      getPages: AppPages.pages,
      home: token != null ? HomePage() : LoginPage(),
      translations: LocalizationService(),
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      defaultTransition: Transition.cupertino,
      transitionDuration: Get.defaultTransitionDuration,
      debugShowCheckedModeBanner: false,
    ),
  );
}

