import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:khoaluantotnghiep2021/controller/home/home_controller.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_colors.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('Clicks: ${controller.count}')),
      ),
      body: PageView(
        controller: controller.pageCotroller,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Center(
            child: ElevatedButton(
              child: Text("Reset"),
              style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
              onPressed: () {
                controller.resetCount();
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text("Reset"),
              style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
              onPressed: () {
                controller.resetCount();
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text("Reset"),
              style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
              onPressed: () {
                controller.resetCount();
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text("Reset"),
              style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
              onPressed: () {
                controller.resetCount();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          controller.increment();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: ValueBuilder<int>(
        initialValue: 0,
        builder: (value, updateFn) => Container(
          color: AppColors.bottomBarColor,
          child: BubbleBottomBar(
            opacity: .2,
            currentIndex: value,
            onTap: (tab)  {
              controller.pageCotroller.animateToPage(tab, duration: controller.animationDuration, curve: Curves.ease);
              updateFn(tab);
            },
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            elevation: 8.0,
            hasInk: true,
            hasNotch: true,
            fabLocation: BubbleBottomBarFabLocation.end,
            items: controller.navigationItems,
          ),
        ) ,
      ),
    );
  }
}
