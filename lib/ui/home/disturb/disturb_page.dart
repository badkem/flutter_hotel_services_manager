import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/controller/home/disturb/disturb_controller.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_colors.dart';
import 'package:khoaluantotnghiep2021/ui/widgets/count_down.dart';
import 'package:numberpicker/numberpicker.dart';

class DisturbPage extends StatefulWidget {
  @override
  _DisturbPageState createState() => _DisturbPageState();
}

class _DisturbPageState extends State<DisturbPage> {
  double height, width;
  @override
  Widget build(BuildContext context) {
    final DisturbController controller = Get.put(DisturbController());
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Obx(() => Center(
        child: Column(
          children: [
            Text(
              "Please clean my room at",
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.w500 ,color: AppColors.primaryTextColor),
            ),
            controller.isSubmit.value ?
            CountDown(
              animation: StepTween(
                begin: controller.levelClock.value, // THIS IS A USER ENTERED NUMBER
                end: 0,
              ).animate(controller.animationController),
            ) :
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                NumberPicker(
                  value: controller.hour.value,
                  textStyle: TextStyle(
                      fontSize: 22,
                      color: AppColors.primaryTextColor
                  ),
                  minValue: 0,
                  maxValue: 23,
                  infiniteLoop: true,
                  onChanged: (value) => controller.hour.value = value,
                ),
                NumberPicker(
                  value: controller.min.value,
                  textStyle: TextStyle(
                      fontSize: 22,
                      color: AppColors.primaryTextColor
                  ),
                  minValue: 0,
                  maxValue: 59,
                  infiniteLoop: true,
                  onChanged: (value) => controller.min.value = value,
                ),
              ],
            ),
            controller.isSubmit.value ?
            Container(
              margin: EdgeInsets.only(top: height * 0.03),
              height: height * 0.05,
              width: width * 0.3,
              child: TextButton(
                child: Text('Cancel'),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 18,
                  ),
                  primary: Colors.white,
                  backgroundColor: AppColors.primaryColor,
                ),
                onPressed: () => controller.stopTimer(),
              ),
            ):
            Container(
              margin: EdgeInsets.only(top: height * 0.03),
              height: height * 0.05,
              width: width * 0.3,
              child: TextButton(
                child: Text('Submit'),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 18,
                  ),
                  primary: Colors.white,
                  backgroundColor: AppColors.primaryColor,
                ),
                onPressed: () {
                  controller.getLevelClock(controller.hour.value, controller.min.value);
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
