import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:khoaluantotnghiep2021/controller/home/hotel_info/hotel_info_controller.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_colors.dart';
import 'package:khoaluantotnghiep2021/utils/app_endpoint.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class HotelInfoPage extends GetView<HotelInfoController> {
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
            child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) =>  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Container(
                    height: height * 0.16,
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
                    child: Row(
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.horizontal(left: Radius.circular(8.0)),
                            child: Image.asset('assets/images/foods.jpeg',
                                fit: BoxFit.fill),
                          ),
                        ),
                        SizedBox(width: width * 0.05,),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('Total', style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20, color: AppColors.primaryTextColor)),
                                  SizedBox(width: width * 0.05,),
                                  Text(
                                      "10000₫",
                                      style: TextStyle(fontSize: 18, color: AppColors.primaryTextColor, fontWeight: FontWeight.w600)),
                                ],
                              ),
                              Text('PENDING',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: AppColors.primaryTextColor)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ))) :
        ListView.builder(
            itemCount: controller.hotelItem.value.data.data.length,
            itemBuilder: (context, index) =>  InkWell(
              onTap: () => hotelItemInfoDetail(context, controller.hotelItem.value.data.data[index].imagePaths),
              child: Container(
                height: height * 0.20,
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    '${AppEndpoint.BASE_URL_IMAGE}' +
                        controller.hotelItem.value.data.data[index].avatar,
                    fit: BoxFit.cover,
                    width: 70,
                  ),
                ),
              ),
            ))
        )
    );
  }
  hotelItemInfoDetail(BuildContext context, String imgPath) {
    showDialog(
        context: context, builder: (context){
      return Dialog(
        insetPadding: EdgeInsets.all(10),
        child: Container(
          width: width * 0.9,
          height: height * 0.8,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Image.network(
              '${AppEndpoint.BASE_URL_IMAGE + imgPath
                  .replaceAll('["', '')
                  .replaceAll('"]', '')}',
              fit: BoxFit.cover,
              width: 70,
            ),
          ),
        ),
      );
    });
  }
}
