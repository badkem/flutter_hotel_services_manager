import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/data/repository/repository.dart';
import 'package:khoaluantotnghiep2021/ui/home/home_page.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_colors.dart';
import 'package:meta/meta.dart';

class LoginController extends GetxController {
  TextEditingController textRoomName, textLabel;
  String roomName, label = '';

  checkRoomExist() {
    if (textRoomName.text.isNotEmpty && textLabel.text.isNotEmpty) {
      MyRepository().checkRoomExistRequest(roomName, label);
      Get.to(HomePage());
    } else {
    showDialog();
    }
  }

  showDialog(){
    return Get.defaultDialog(
        title: "Login Failed",
        titleStyle: TextStyle(
          color: AppColors.primaryTextColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        content: Column(
          children: [
            Text("Please contact via manager!"),
            SizedBox(height: 10),
            TextButton(
              child: Text('Okay'),
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  fontSize: 12,
                ),
                primary: Colors.white,
                backgroundColor: AppColors.primaryColor,
              ),
              onPressed: () => Get.back(),
            ),
          ],
        ));
  }
  @override
  void onInit() {
    textRoomName = new TextEditingController();
    textLabel = new TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    textRoomName.dispose();
    textLabel.dispose();
    super.onClose();
  }
}
