import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:khoaluantotnghiep2021/services/time_ago.dart';
import 'package:intl/intl.dart';
import 'package:khoaluantotnghiep2021/controller/home/history/history_controller.dart';
import 'package:khoaluantotnghiep2021/ui/theme/app_colors.dart';
import 'package:khoaluantotnghiep2021/ui/widgets/modal_fit.dart';
import 'package:khoaluantotnghiep2021/utils/app_endpoint.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class HistoryPage extends GetView<HistoryController> {
  double height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
   return Scaffold(
     body: Obx(() => controller.isLoading.value ?
     Shimmer.fromColors(
         enabled: false,
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
       itemCount: controller.listCarts.value.data.carts.length,
       itemBuilder: (context, index){
         return GestureDetector(
           onTap: () => openCart(context, index),
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
                     child: controller.listCarts.value.data.carts[index].type == 1 ?
                     Image.asset('assets/images/foods.jpeg',
                         fit: BoxFit.fill) :
                     Image.asset('assets/images/laundry.jpeg',
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
                           Text(NumberFormat.decimalPattern().format(
                               controller.listCarts.value.data.carts[index].totalMoney) +
                               "₫",
                               style: TextStyle(fontSize: 18, color: AppColors.primaryTextColor, fontWeight: FontWeight.w600)),
                         ],
                       ),
                       controller.listCarts.value.data.carts[index].status == 0 ?
                       Text('PENDING',
                           style: TextStyle(
                               fontWeight: FontWeight.w600,
                               fontSize: 20,
                               color: AppColors.primaryTextColor)) :
                       controller.listCarts.value.data.carts[index].status == 1 ?
                       Text('ACCEPTED',
                           style: TextStyle(
                               fontWeight: FontWeight.w600,
                               fontSize: 20,
                               color: AppColors.primaryTextColor)) :
                       controller.listCarts.value.data.carts[index].status == 2 ?
                       Text('ACCEPTED',
                           style: TextStyle(
                               fontWeight: FontWeight.w600,
                               fontSize: 20,
                               color: AppColors.primaryTextColor)) :
                       controller.listCarts.value.data.carts[index].status == 3 ?
                       Text('FINISHED',
                           style: TextStyle(
                               fontWeight: FontWeight.w600,
                               fontSize: 20,
                               color: AppColors.primaryTextColor)) :
                       controller.listCarts.value.data.carts[index].status == 4 ?
                       Text('CANCELLED',
                           style: TextStyle(
                               fontWeight: FontWeight.w600,
                               fontSize: 20,
                               color: AppColors.primaryTextColor)) : Container(),
                       Text(TimeAgo.timeAgoSinceDate('${controller.listCarts.value.data.carts[index].dateCreated}'),
                           style: TextStyle(fontSize: 17, color: AppColors.primaryTextColor)
                       ),
                     ],
                   ),
                 ),
               ],
             ),
           ),
         );
       },
     )
     ),
   );
  }

  openCart(BuildContext context, int i) {
    showCupertinoModalBottomSheet(
        duration: Duration(milliseconds: 400),
        context: context,
        builder: (context){
          return ModalFit(
              child: SingleChildScrollView(
                child: Obx(() => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          controller.listCarts.value.data.carts[i].type == 1 ?
                          Text(
                            "Food Detail",
                            style: TextStyle(
                              fontSize: 24,
                              color: AppColors.primaryTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ) :
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
                                .format(controller.listCarts.value.data.carts[i].totalMoney) +
                                "₫",
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
                    controller.listCarts.value.data.carts[i].type == 1 ?
                    Container(
                      child: ListView.builder(
                          primary: true,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.listCarts.value.data.listFoodCart.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                leading: Image.network(
                                  '${AppEndpoint.BASE_URL_IMAGE}' +
                                      controller.listCarts.value.data.listFoodCart[index].imagePath,
                                  fit: BoxFit.cover,
                                  width: 70,
                                ),
                                title: Text(
                                  controller.listCarts.value.data.listFoodCart[index].name,
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
                                          '${controller.listCarts.value.data.listFoodCart[index].number}',
                                          style: TextStyle(
                                            fontSize: 23,
                                            color: AppColors.primaryTextColor,
                                          )),
                                    ],
                                  ),
                                )),
                                trailing: controller.listCarts.value.data.carts[i].discount == 0 ?
                                Text(
                                  NumberFormat.decimalPattern().format(
                                      controller.listCarts.value.data.listFoodCart[index].pricing) +
                                      "₫",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.primaryTextColor,
                                  ),
                                ) :
                                Column(
                                  children: [
                                    Text(
                                      NumberFormat.decimalPattern().format(
                                          controller.listCarts.value.data.listFoodCart[index].pricing) +
                                          "₫",
                                      style: TextStyle(
                                        fontSize: 20,
                                        decoration: TextDecoration.lineThrough,
                                        color: AppColors.primaryTextColor,
                                      ),
                                    ),
                                    Text(
                                      NumberFormat.decimalPattern().format(
                                          controller.listCarts.value.data.listFoodCart[index].discount) +
                                          "₫",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: AppColors.primaryTextColor,
                                      ),
                                    ),
                                  ],
                                )
                            );
                          }),
                    ) :
                    Container(
                      child: ListView.builder(
                          primary: true,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.listCarts.value.data.listLaundryCart.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                leading: Image.network(
                                  '${AppEndpoint.BASE_URL_IMAGE}' +
                                      controller.listCarts.value.data.listLaundryCart[index].imagePath,
                                  fit: BoxFit.cover,
                                  width: 70,
                                ),
                                title: Text(
                                  controller.listCarts.value.data.listLaundryCart[index].name,
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
                                          '${controller.listCarts.value.data.listLaundryCart[index].number}',
                                          style: TextStyle(
                                            fontSize: 23,
                                            color: AppColors.primaryTextColor,
                                          )),
                                    ],
                                  ),
                                )),
                                trailing: Text(
                                  NumberFormat.decimalPattern().format(
                                      controller.listCarts.value.data.listLaundryCart[index].pricing) +
                                      "₫",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.primaryTextColor,
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
                          TextField(
                            autofocus: false,
                            onChanged: (value) {},
                            style: TextStyle(
                                fontSize: 20,
                                color: AppColors.primaryTextColor),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: controller.listCarts.value.data.carts[i].note,
                              hintStyle: TextStyle(
                                  color: Colors.black38
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.5, color: Colors.black45),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
              )
          );
        });
  }
}