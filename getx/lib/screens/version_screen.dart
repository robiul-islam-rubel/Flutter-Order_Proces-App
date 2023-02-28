import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getx/utils/custom_theme.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutx/flutx.dart';

import '../../controllers/home_controller.dart';
import '../../routes/app_pages.dart';
import '../utils/app_theme.dart';
import '../utils/colors.dart';
import '../utils/constant.dart';
import '../utils/images.dart';


class PackPage extends GetView<HomeController> {
  @override


  ThemeData theme = AppTheme.theme;
  CustomTheme customTheme = CustomTheme();

  var  selectedValue=false;
  final List<int> _list = List.generate(10, (i) => i);
  final List<bool> _selected = List.generate(10, (i) => false);

  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(
      color: Colors.transparent,
    ),
  );
  final _formKey = GlobalKey<FormState>();
  TextEditingController _country=TextEditingController();
  @override
  Widget build(BuildContext context) {
    setStatusBarColor(Colors.green.shade900);
    return Scaffold(
        appBar: AppBar(automaticallyImplyLeading: true,

          elevation: 4,
          backgroundColor: customTheme.appbarColor,
          title:FxText.bodyLarge(color: Colors.white,
            'Pack Page',
            fontWeight: 700,
            textAlign: TextAlign.center,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: (){

                  },
                  child: Icon(Icons.question_mark,color: Colors.white,)
              ),
            ),

          ],
        ),
        body:  Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FxContainer.bordered(
                  border: Border.all(
                      color: controller.selectedPackDuration == 1 ? customTheme.appbarColor
                          : Colors.transparent),

                  padding: FxSpacing.xy(28, 20),
                  borderRadiusAll: 5,
                  onTap: () {
                    controller.setSelectedPackDuration(1);
                  },
                  child: Column(
                    children: [
                      Image(
                        height: 48,
                        width: 110,
                        image: AssetImage(Images.logo3),
                      ),
                      FxSpacing.height(12),
                      FxText.bodySmall(
                        'Monthly Pack',
                        color: controller.selectedPackDuration == 1
                            ?  customTheme.appbarColor
                            :Colors.black,
                        fontWeight: 600,
                      ),
                    ],
                  ),
                ),
                FxSpacing.width(10),

                FxContainer.bordered(
                  border: Border.all(
                      color: controller.selectedPackDuration == 2
                          ? customTheme.appbarColor
                          : Colors.transparent),

                  padding: FxSpacing.xy(28, 20),
                  borderRadiusAll: 5,
                  onTap: () {
                    controller.setSelectedPackDuration(2);
                  },
                  child: Column(
                    children: [
                      Image(
                        height: 48,
                        width: 100,
                        image: AssetImage(Images.logo3),
                      ),
                      FxSpacing.height(12),
                      FxText.bodySmall(
                        'Yearly Pack',
                        fontWeight: 600,
                        color: controller.selectedUser == 2
                            ? customTheme.appbarColor
                            :Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            5.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FxContainer.bordered(
                  border: Border.all(
                      color: controller.selectedPackType== 1 ? customTheme.appbarColor
                          : Colors.transparent),

                  padding: FxSpacing.xy(28, 20),
                  borderRadiusAll: 5,
                  onTap: () {
                    controller.setSelectedPackType(1);
                  },
                  child: Column(
                    children: [
                      Image(
                        height: 48,
                        width: 110,
                        image: AssetImage(Images.logo1),
                      ),
                      FxSpacing.height(12),
                      FxText.bodySmall(
                        'Regular',
                        color: controller.selectedPackType == 1
                            ? customTheme.appbarColor
                            :Colors.black,
                        fontWeight: 600,
                      ),
                    ],
                  ),
                ),
                FxSpacing.width(10),

                FxContainer.bordered(
                  border: Border.all(
                      color: controller.selectedPackType == 2
                          ? customTheme.appbarColor
                          : Colors.transparent),

                  padding: FxSpacing.xy(28, 20),
                  borderRadiusAll: 5,
                  onTap: () {
                    controller.setSelectedPackType(2);
                  },
                  child: Column(
                    children: [
                      Image(
                        height: 48,
                        width: 100,
                        image: AssetImage(Images.logo3),
                      ),
                      FxSpacing.height(12),
                      FxText.bodySmall(
                        'Premium',
                        fontWeight: 600,
                        color: controller.selectedPackType == 2
                            ? customTheme.appbarColor
                            :Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            FxSpacing.height(10),
            Visibility(
              visible: controller.selectedPackType.value==1?true:false,
              child: Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index)
                    {
                      return  Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                              onTap: (){

                                // Get.offNamed(AppPages.getPackageDetailsRoute());
                              },
                              child: FxContainer.bordered(
                                border: Border.all(
                                    color: _selected[index]==true? customTheme.buttonColor
                                        : Colors.transparent),
                                color: Colors.grey.shade200,
                                paddingAll: 16,
                                borderRadiusAll: 5,
                                child:Row(
                                  children: [
                                    FxContainer(
                                        width: 56,
                                        padding: FxSpacing.y(12),
                                        child: Center(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              FxText.bodyMedium(
                                                "15",
                                                fontWeight: 700,
                                                color: Colors.black87,
                                              ),

                                            ],
                                          ),
                                        ),
                                        borderRadiusAll: 4,
                                        bordered: true,
                                        border: Border.all(color:customTheme.appbarColor),
                                        color:  Colors.transparent

                                    ),
                                    FxSpacing.width(16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          FxText.bodySmall(style: TextStyle(fontSize: 15),
                                            color: customTheme.buttonColor,
                                            "Package - "+"${index+1}",
                                            fontWeight: 700,
                                          ),
                                          FxSpacing.height(4),
                                          FxText.bodySmall(
                                            "This Package is free, you don't have to pay anything to buy this package.",
                                            fontSize: 10,
                                          ),
                                          FxText.bodySmall(
                                            "Monthly-Regular",
                                            fontSize: 10,
                                            fontWeight: 600,
                                          ),


                                        ],
                                      ),
                                    ),
                                    FxSpacing.width(16),
                                    FxButton.rounded(
                                        backgroundColor: customTheme.buttonColor,
                                        onPressed: (){}, child: Text("\$ "+"150",style: TextStyle(color: Colors.black),))
                                  ],
                                ),
                              )
                          )
                      );


                    }
                ),
              ),
            ),
            Visibility(
              visible: controller.selectedPackType.value==2?true:false,
              child: Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index)
                    {
                      return  Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                              onTap: (){

                                // Get.offNamed(AppPages.getPackageDetailsRoute());
                              },
                              child: FxContainer.bordered(
                                border: Border.all(
                                    color: _selected[index]==true? customTheme.buttonColor
                                        : Colors.transparent),
                                color: Colors.grey.shade200,
                                paddingAll: 16,
                                borderRadiusAll: 5,
                                child:Row(
                                  children: [
                                    FxContainer(
                                        width: 56,
                                        padding: FxSpacing.y(12),
                                        child: Center(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              FxText.bodyMedium(
                                                "10",
                                                fontWeight: 700,
                                                color: Colors.black87,
                                              ),

                                            ],
                                          ),
                                        ),
                                        borderRadiusAll: 4,
                                        bordered: true,
                                        border: Border.all(color:customTheme.appbarColor),
                                        color:  Colors.transparent

                                    ),
                                    FxSpacing.width(16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          FxText.bodySmall(style: TextStyle(fontSize: 15),
                                            color: customTheme.buttonColor,
                                            "Package - "+"${index+1}",
                                            fontWeight: 700,
                                          ),
                                          FxSpacing.height(4),
                                          FxText.bodySmall(
                                            "This Package is free, you don't have to pay anything to buy this package.",
                                            fontSize: 10,
                                          ),
                                          FxText.bodySmall(
                                            "Yearly-Premium",
                                            fontSize: 10,
                                            fontWeight: 600,
                                          ),


                                        ],
                                      ),
                                    ),
                                    FxSpacing.width(16),
                                    FxButton.rounded(
                                        backgroundColor: customTheme.buttonColor,
                                        onPressed: (){}, child: Text("\$ "+"100",style: TextStyle(color: Colors.black),))
                                  ],
                                ),
                              )
                          )
                      );


                    }
                ),
              ),
            ),

            FxSpacing.height(10),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8),
              child: Row(
                children: [
                  FxButton.medium(
                    backgroundColor: customTheme.appbarColor,
                    elevation: 0,
                    borderRadiusAll: 5,
                    onPressed: ()
                    {
                      Get.offNamed(AppPages.getPackageDetailsRoute());
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        FxText.bodyMedium("SKIP",
                            fontWeight: 600,
                            color: Colors.white,
                            letterSpacing: 0.5),
                        Container(
                          margin: EdgeInsets.only(left: 16),
                          child: Icon(
                            Icons.skip_next,
                            color:Colors.white,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                  5.width,
                  Container(
                    width: Get.width*0.60,
                    child: FxButton.medium(

                      backgroundColor: customTheme.buttonColor,
                      elevation: 0,
                      borderRadiusAll: 5,
                      onPressed: ()
                      {
                        Get.toNamed(AppPages.getCardPageRoute());
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          FxText.bodyMedium("NEXT",
                              fontWeight: 600,
                              color: Colors.black,
                              letterSpacing: 0.5),
                          Container(
                            margin: EdgeInsets.only(left: 16),
                            child: Icon(
                              Icons.arrow_forward,
                              color:Colors.black,
                              size: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),


          ],
        )
        )
    );
  }

}