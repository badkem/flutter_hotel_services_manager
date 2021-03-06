import 'dart:io';

import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:khoaluantotnghiep2021/controller/home/laundry/laundry_controller.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_colors.dart';
import 'package:khoaluantotnghiep2021/ui/widgets/dot.dart';
import 'package:khoaluantotnghiep2021/ui/widgets/modal_fit.dart';
import 'package:khoaluantotnghiep2021/utils/app_endpoint.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

// ignore: must_be_immutable
class LaundryPage extends GetView<LaundryController> {
  double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Obx(() => controller.isLoading.value ?
      Shimmer.fromColors(
        baseColor: Colors.grey[200],
        highlightColor: Colors.grey[350],
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 3 / 5,
              crossAxisCount: 2,
            ),
            itemCount: 4,
            itemBuilder: (context, index){
              return Container(
                margin: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.2),
                        spreadRadius: 6,
                        blurRadius: 7,
                        offset: Offset(0, 2),
                      ),
                    ]),
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/ic_logo_app.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'name',
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 25),
                            ),
                            Text(
                              'This description',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 18),
                            ),
                            Text(
                              '10000',
                              style: TextStyle(
                                  color: Colors.red[700], fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ) :
      GridView.builder(
          shrinkWrap: true,
          itemCount: controller.laundryList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3 / 5,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.2),
                      spreadRadius: 6,
                      blurRadius: 7,
                      offset: Offset(0, 2),
                    ),
                  ]),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                      child: Image.network(
                        '${AppEndpoint.BASE_URL_IMAGE}' +
                            controller.laundryList[index].imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.laundryList[index].name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.black87, fontSize: 22),
                          ),
                          Text(
                            controller.laundryList[index].description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black87,
                                fontStyle: FontStyle.italic,
                                fontSize: 18),
                          ),
                          Text(
                            NumberFormat.decimalPattern().format(
                                controller.laundryList[index].pricing) +
                                "???",
                            style: TextStyle(
                                color: Colors.red[700], fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.decreaseCount(index);
                          controller.calculateTotal();
                        },
                        child: Icon(
                          Icons.remove,
                          size: 28,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Obx(
                            () => Text(
                          '${controller.laundryList[index].qty}',
                          style: TextStyle(
                              color: AppColors.primaryColor, fontSize: 28),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.increaseCount(index);
                          controller.addItem(controller.laundryList[index]);
                          controller.calculateTotal();
                        },
                        child: Icon(
                          Icons.add,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            );
          })
      ),
      floatingActionButton: Obx(() => controller.isVisible.value ?
      Container() :
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 10),
        child: FloatingActionButton(
          onPressed: () => openCart(context),
          child: Badge(
            animationDuration: Duration(milliseconds: 300),
            elevation: 1.0,
            animationType: BadgeAnimationType.slide,
            position: BadgePosition.topEnd(top: -18, end: -14),
            badgeContent: Text(
              "${controller.totalCount}",
              style: TextStyle(fontSize: 18, color: AppColors.iconColor),
            ),
            child: Icon(
              Icons.shopping_cart,
              size: 35,
              color: AppColors.iconColor,
            ),
          ),
        ),
      )
      ),
    );
  }

  openCart(BuildContext context) {
    showCupertinoModalBottomSheet(
        duration: Duration(milliseconds: 400),
        context: context,
        builder: (context){
      return ModalFit(
        child: SingleChildScrollView(
          child: Obx(()
          => Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Laundry Detail",
                          style: TextStyle(
                            fontSize: 24,
                            color: AppColors.primaryTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Obx(() => Text(
                          NumberFormat.decimalPattern()
                              .format(controller.totalCartValue) +
                              "???",
                          style: TextStyle(
                            fontSize: 23,
                            color: AppColors.primaryTextColor,
                          ),
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    child: ListView.builder(
                        primary: true,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.laundryCartItem.length,
                        itemBuilder: (context, index) {
                          return Slidable(
                            key: UniqueKey(),
                            actionPane: SlidableDrawerActionPane(),
                            secondaryActions: <Widget>[
                              IconSlideAction(
                                iconWidget: Icon(Icons.more_horiz),
                                caption: 'Edit',
                                onTap: () => Get.defaultDialog(
                                  barrierDismissible: false,
                                  title: 'Quantity',
                                  content: Container(
                                      width: width * 0.3,
                                      child: TextField(
                                        controller: controller.editQty,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                        autofocus: false,
                                        onChanged: (value) => controller.qty = value,
                                      )),
                                  confirm: TextButton(
                                    child: Text('Okay'),
                                    style: TextButton.styleFrom(
                                      textStyle: TextStyle(
                                        fontSize: 12,
                                      ),
                                      primary: Colors.white,
                                      backgroundColor: AppColors.primaryColor,
                                    ),
                                    onPressed: () {
                                      controller.onEditQtyItem(controller.laundryCartItem[index]);
                                      controller.editQty.clear();
                                    },
                                  ),
                                ),
                                color: Colors.grey.shade300,
                              ),
                              IconSlideAction(
                                iconWidget: Icon(Icons.delete, color: AppColors.iconColor,),
                                caption: 'Delete',
                                onTap: () {
                                  controller.onDeleteItemCart(
                                    controller.laundryCartItem[index],
                                    controller.laundryCartItem[index].qty.value = 0);
                                  controller.calculateTotal();
                                },
                                color: Colors.red,
                              ),
                            ],
                            dismissal: SlidableDismissal(
                              onDismissed: (actionType) {
                                controller.onDeleteItemCart(
                                  controller.laundryCartItem[index],
                                  controller.laundryCartItem[index].qty.value = 0,
                                );
                                controller.calculateTotal();
                              },
                              child: SlidableDrawerDismissal(),
                            ),
                            child: ListTile(
                              leading: Image.network(
                                '${AppEndpoint.BASE_URL_IMAGE}' +
                                    controller.laundryCartItem[index].imagePath,
                                fit: BoxFit.cover,
                                width: 70,
                              ),
                              title: Text(
                                controller.laundryCartItem[index].name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.primaryTextColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Obx(() => RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'x',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: AppColors.primaryTextColor,
                                        )),
                                    TextSpan(
                                        text:
                                        '${controller.laundryCartItem[index].qty}',
                                        style: TextStyle(
                                          fontSize: 23,
                                          color: AppColors.primaryTextColor,
                                        )),
                                  ],
                                ),
                              )),
                              trailing: Text(
                                NumberFormat.decimalPattern().format(
                                    controller.laundryCartItem[index].pricing) +
                                    "???",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.primaryTextColor,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Note",
                            style: TextStyle(
                                fontSize: 20,
                                color: AppColors.primaryTextColor,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: TextField(
                            controller: controller.textNote,
                            autofocus: false,
                            onChanged: (value) => controller.note = value,
                            style: TextStyle(
                                fontSize: 20,
                                color: AppColors.primaryTextColor),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Add note for this cart',
                              hintStyle: TextStyle(
                                  color: Colors.black38
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.5, color: Colors.black45),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  Container(
                    height: height * 0.07,
                    width: width * 0.5,
                    child: TextButton(
                      child: Text('PROCESS ORDER'),
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: 18,
                        ),
                        primary: Colors.white,
                        backgroundColor: AppColors.primaryColor,
                      ),
                      onPressed: () {
                        Get.back();
                        signatureDialog(context);
                      },
                    ),
                  )
                ],
              )
          ),
        )
      );
    });
  }

  signatureDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context){
          return Dialog(
            insetPadding: EdgeInsets.all(10),
            child: Container(
              width: width * 0.9,
              height: height * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'please sign to confirm'.toUpperCase(),
                    style: TextStyle(
                      color: AppColors.primaryTextColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Obx(() =>
                      Column(
                        children: [
                          SizedBox(
                            height: height * 0.02,),
                          Container(
                            height: height * 0.4,
                            child: Stack(
                              children: [
                                SfSignaturePad(
                                    onSignStart: () => controller.isClearVisible(false),
                                    key: controller.signatureGlobalKey,
                                    backgroundColor: Colors.white,
                                    strokeColor: controller.currentColor.value,
                                    minimumStrokeWidth: 4.0,
                                    maximumStrokeWidth: 4.5),
                                !controller.isClearVisible.value ? Align(
                                  alignment: Alignment.bottomCenter,
                                  child: GestureDetector(
                                    onTap: () => controller.clearSign(),
                                    child: Icon(
                                      Icons.cancel,
                                      color: Colors.black26,
                                      size: 35,),
                                  ),
                                ) : Container(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,),
                          Container(
                            height: height * 0.05,
                            width: width * 0.6,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Icon(Icons.palette_outlined, color: controller.currentColor.value, size: 40,),
                                GestureDetector(
                                  onTap: () => controller.changeStrokeColor(Colors.black),
                                  child: DotWidget(
                                    size: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => controller.changeStrokeColor(Colors.blueAccent),
                                  child: DotWidget(
                                    size: 16,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => controller.changeStrokeColor(Colors.lightGreenAccent),
                                  child: DotWidget(
                                    size: 16,
                                    color: Colors.lightGreenAccent,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => controller.changeStrokeColor(Colors.orangeAccent),
                                  child: DotWidget(
                                    size: 16,
                                    color: Colors.orangeAccent,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => controller.changeStrokeColor(Colors.redAccent),
                                  child: DotWidget(
                                    size: 16,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => controller.changeStrokeColor(Colors.purpleAccent),
                                  child: DotWidget(
                                    size: 16,
                                    color: Colors.purpleAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                  ),
                  SizedBox(height: height * 0.03),
                  Container(
                    height: height * 0.05,
                    width: width * 0.3,
                    child: TextButton(
                      child: Text('ORDER'),
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(
                          fontSize: 18,
                        ),
                        primary: Colors.white,
                        backgroundColor: AppColors.primaryColor,
                      ),
                      onPressed: () {
                        controller.uploadImg();
                        Get.back();
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

}
