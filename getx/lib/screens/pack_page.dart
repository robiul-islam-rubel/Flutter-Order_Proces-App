import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx/utils/custom_widget/custom_appbar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controllers/home_controller.dart';
import '../routes/app_pages.dart';
import '../utils/app_theme.dart';
import '../utils/colors.dart';
import '../utils/custom_theme.dart';
import '../utils/single_grid_item.dart';

class TextIconItem {
  String text;
  IconData iconData;

  TextIconItem(this.text, this.iconData);
}

class PackPage extends GetView<HomeController> {
  @override
  ThemeData theme = AppTheme.theme;
  CustomTheme customTheme = AppTheme.customTheme;

  var selected = 0;

  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(
      color: Colors.transparent,
    ),
  );

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(Colors.green.shade900);
    return Scaffold(
      appBar: CustomAppBar(title: "Pack",height: 55,),

      body: Obx(
            () => Container(
          padding: FxSpacing.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: [
              GridView.count(
                shrinkWrap: true,
                // physics: ClampingScrollPhysics(),
                crossAxisCount: 2,
                padding: FxSpacing.zero,
                mainAxisSpacing: 20,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      controller.selectedPackType(1);
                    },
                    child: SinglePageItem(
                      iconColor: customTheme.appbarColor,

                      borderColor: controller.selectedPackType.value == 1
                          ? customTheme.buttonColor
                          : Colors.transparent,

                      iconData: Icons.calendar_month,
                      title: "Monthly Pack",
                      //iconColor:customTheme.appbarColor ,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.selectedPackType(2);
                    },
                    child: SinglePageItem(
                      iconColor: customTheme.appbarColor,
                      borderColor: controller.selectedPackType.value == 2
                          ? customTheme.buttonColor
                          : Colors.transparent,
                      title: "Yearky Pack",
                      iconData: Icons.calendar_view_month,
                      // iconColor: customTheme.appbarColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.selectedPackType(3);
                    },
                    child: SinglePageItem(
                      iconColor: customTheme.appbarColor,

                      borderColor: controller.selectedPackType.value == 3
                          ? customTheme.buttonColor
                          : Colors.transparent,

                      iconData: Icons.ac_unit,
                      title: "Regular Pack",
                      //iconColor:customTheme.appbarColor ,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.selectedPackType(4);
                    },
                    child: SinglePageItem(
                      iconColor: customTheme.appbarColor,
                      borderColor: controller.selectedPackType.value == 4
                          ? customTheme.buttonColor
                          : Colors.transparent,
                      title: "Premium Pack",
                      iconData: Icons.account_balance_outlined,
                      // iconColor: customTheme.appbarColor,
                    ),
                  ),
                ],
              ),
              FxSpacing.height(10),
              Visibility(
                visible: controller.selectedPackType.value == 2 ? true : false,
                child: Expanded(
                  child: ListView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            showGeneralDialog(
                                context: context,
                                barrierDismissible: false,
                                barrierLabel: MaterialLocalizations
                                    .of(context)
                                    .modalBarrierDismissLabel,
                                barrierColor: Colors.white.withOpacity(0.9),
                                transitionDuration: const Duration(
                                    milliseconds: 200),
                                pageBuilder: (BuildContext buildContext,
                                    Animation animation,
                                    Animation secondaryAnimation) {
                                  return Center(
                                    child: Container(
                                        color: Colors.white,
                                        width:Get.width*.90,
                                        height: Get.height*.90,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:<Widget> [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                      alignment: AlignmentDirectional.centerEnd,
                                                      child: TextButton(
                                                          onPressed: () {
                                                            Get.offNamed(AppPages.getCheckoutPageRoute());
                                                          },
                                                          child: FxText.bodyMedium(
                                                              "Package Details".toUpperCase(), fontWeight: 600,color: customTheme.appbarColor)
                                                      )
                                                  ),


                                                ],
                                              ),
                                              Divider(thickness: 0.5,color: customTheme.buttonColor,),
                                              Expanded(
                                                child: SingleChildScrollView(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets.only(top: 8),
                                                          child: FxText.titleMedium("1. Monthly Package",
                                                              color: customTheme.appbarColor, fontWeight: 500),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 8),
                                                          child: FxText.bodyMedium("Failure to mitigate climate change Erosion of social cohesion and societal polarization are the two major global risks for the short term",
                                                            color: theme.colorScheme.onBackground,
                                                            fontWeight: 500,
                                                          ),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 16),
                                                          child: FxText.titleMedium(
                                                              "2. Yearly Package",
                                                              color: customTheme.appbarColor, fontWeight: 500
                                                          ),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 8),
                                                          child: FxText.bodyMedium("This year's Global Risks Report finds that cost-of-living crisis, natural disasters, extreme weather events and geoeconomic confrontation are the top three risks the world would be facing in the next two years.",
                                                              color: theme.colorScheme.onBackground,
                                                              fontWeight: 500,
                                                              height: 1.25,
                                                              letterSpacing: 0.1),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 16),
                                                          child: FxText.titleMedium("3. Premium Package",
                                                              color:   customTheme.appbarColor, fontWeight: 500),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 8),
                                                          child: FxText.bodyMedium("These are being amplified by comparatively new developments in the global risks landscape, including unsustainable levels of debt, a new era of low growth, low global investment and de-globalization, it added",
                                                              color: theme.colorScheme.onBackground,
                                                              fontWeight: 500,
                                                              height: 1.25,
                                                              letterSpacing: 0.1),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 16),
                                                          child: FxText.titleMedium("4. Regular Package",
                                                              color: customTheme.appbarColor, fontWeight: 500),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 8),
                                                          child: FxText.bodyMedium("Geopolitical fragmentation will drive geoeconomic warfare and heighten the risk of multi-domain conflicts",
                                                              color: theme.colorScheme.onBackground,
                                                              fontWeight: 500,
                                                              height: 1.25,
                                                              letterSpacing: 0.1),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 16),
                                                          child: FxText.titleMedium("5. Other Package",
                                                              color: customTheme.appbarColor, fontWeight: 500),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 8),
                                                          child: FxText.bodyMedium("Geopolitical fragmentation will drive geoeconomic warfare and heighten the risk of multi-domain conflicts",
                                                              color: theme.colorScheme.onBackground,
                                                              fontWeight: 500,
                                                              height: 1.25,
                                                              letterSpacing: 0.1),
                                                        ),


                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Divider(thickness: 0.5,color: customTheme.buttonColor,),
                                              Container(
                                                  margin: EdgeInsets.only(top: 8),
                                                  alignment: AlignmentDirectional.centerEnd,
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: <Widget>[
                                                      TextButton(
                                                          onPressed: () {
                                                            Get.back();
                                                            // Get.offNamed(AppPages.getCheckoutPageRoute());
                                                          },
                                                          child: FxText.bodyMedium("Decline", fontWeight: 600)),
                                                      TextButton(
                                                          onPressed: () {
                                                            controller.setCurrentIndex(index);
                                                            Get.back();
                                                            // Get.offNamed(AppPages.getUserTypeRoute());
                                                          },
                                                          child: FxText.bodyMedium("Accept",
                                                              fontWeight: 600, color: customTheme.appbarColor)),
                                                    ],
                                                  )
                                              ),



                                            ],
                                          ),
                                        )
                                    ),
                                  );

                                }
                            );

                            controller.setCurrentIndex(index);

                          },
                          child: Obx(() => Padding(
                              padding: const EdgeInsets.only(top: 5.0,bottom: 5),
                              child: Stack(
                                children: [
                                  FxContainer.bordered(
                                    border: Border.all(
                                        color: controller.currentIndex == index
                                            ? customTheme.buttonColor
                                            : Colors.transparent),
                                    color: Colors.grey.shade200,
                                    paddingAll: 16,
                                    borderRadiusAll: 5,
                                    child: Row(
                                      children: [
                                        FxContainer(
                                            width: Get.width*0.20,
                                            padding: FxSpacing.y(12),
                                            child: Center(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  FxText.bodyMedium(
                                                    "Price",
                                                    fontWeight: 700,
                                                    color: Colors.black87,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            borderRadiusAll: 4,
                                            bordered: true,
                                            border:
                                            Border.all(color: customTheme.appbarColor),
                                            color: Colors.transparent),
                                        FxSpacing.width(16),
                                        Expanded(
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                FxText.bodySmall(
                                                  style:
                                                  TextStyle(fontSize: 15),
                                                  color: customTheme.buttonColor,
                                                  "Yearly Pack",
                                                  fontWeight: 700,
                                                ),
                                                FxSpacing.height(4),
                                                FxText.bodySmall(
                                                  "This package can use by only four members",
                                                  fontSize: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        FxSpacing.width(16),

                                        InkWell(
                                          onTap: (){
                                            controller.setCurrentIndex(index);

                                          },
                                          child: FxContainer(
                                              width: 56,
                                              padding: FxSpacing.y(5),
                                              child: Center(
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      MdiIcons.cart,
                                                      color: customTheme.appbarColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              borderRadiusAll: 4,
                                              bordered: true,
                                              border:
                                              Border.all(color: Colors.transparent),
                                              color: Colors.transparent),
                                        ),
                                        /*FxButton.rounded(
                                          backgroundColor: customTheme.appbarColor,
                                          onPressed: () {},
                                          child: Text(
                                            "\$ " + "200",
                                          ),
                                        ),*/
                                      ],
                                    ),
                                  ),
                                  Obx(() => controller.currentIndex == index
                                      ? Positioned(
                                    right: -1,
                                    top: -1,
                                    child: Container(
                                      padding: FxSpacing.all(2),
                                      decoration: BoxDecoration(
                                          color:customTheme.buttonColor,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft:
                                              Radius.circular(8))),
                                      child: Icon(
                                        MdiIcons.check,
                                        color:
                                        theme.colorScheme.onPrimary,
                                        size: 16,
                                      ),
                                    ),
                                  )
                                      : Container()),
                                ],
                              )),),
                        );
                      }),
                ),
              ),
              Visibility(
                visible: controller.selectedPackType.value == 1 ? true : false,
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Text("Dummy data will be here"),
                  ),
                ),
              ),
              Visibility(
                visible: controller.selectedPackType.value == 3 ? true : false,
                child: Expanded(
                  child: ListView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            showGeneralDialog(
                                context: context,
                                barrierDismissible: false,
                                barrierLabel: MaterialLocalizations
                                    .of(context)
                                    .modalBarrierDismissLabel,
                                barrierColor: Colors.white.withOpacity(0.9),
                                transitionDuration: const Duration(
                                    milliseconds: 200),
                                pageBuilder: (BuildContext buildContext,
                                    Animation animation,
                                    Animation secondaryAnimation) {
                                  return Center(
                                    child: Container(
                                        color: Colors.white,
                                        width:Get.width*.90,
                                        height: Get.height*.90,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:<Widget> [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                      alignment: AlignmentDirectional.centerEnd,
                                                      child: TextButton(
                                                          onPressed: () {
                                                            Get.offNamed(AppPages.getCheckoutPageRoute());
                                                          },
                                                          child: FxText.bodyMedium(
                                                              "Package Details".toUpperCase(), fontWeight: 600,color: customTheme.appbarColor)
                                                      )
                                                  ),


                                                ],
                                              ),
                                              Divider(thickness: 0.5,color: customTheme.buttonColor,),
                                              Expanded(
                                                child: SingleChildScrollView(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets.only(top: 8),
                                                          child: FxText.titleMedium("1. Monthly Package",
                                                              color: customTheme.appbarColor, fontWeight: 500),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 8),
                                                          child: FxText.bodyMedium("Failure to mitigate climate change Erosion of social cohesion and societal polarization are the two major global risks for the short term",
                                                            color: theme.colorScheme.onBackground,
                                                            fontWeight: 500,
                                                          ),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 16),
                                                          child: FxText.titleMedium(
                                                              "2. Yearly Package",
                                                              color: customTheme.appbarColor, fontWeight: 500
                                                          ),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 8),
                                                          child: FxText.bodyMedium("This year's Global Risks Report finds that cost-of-living crisis, natural disasters, extreme weather events and geoeconomic confrontation are the top three risks the world would be facing in the next two years.",
                                                              color: theme.colorScheme.onBackground,
                                                              fontWeight: 500,
                                                              height: 1.25,
                                                              letterSpacing: 0.1),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 16),
                                                          child: FxText.titleMedium("3. Premium Package",
                                                              color:   customTheme.appbarColor, fontWeight: 500),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 8),
                                                          child: FxText.bodyMedium("These are being amplified by comparatively new developments in the global risks landscape, including unsustainable levels of debt, a new era of low growth, low global investment and de-globalization, it added",
                                                              color: theme.colorScheme.onBackground,
                                                              fontWeight: 500,
                                                              height: 1.25,
                                                              letterSpacing: 0.1),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 16),
                                                          child: FxText.titleMedium("4. Regular Package",
                                                              color: customTheme.appbarColor, fontWeight: 500),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 8),
                                                          child: FxText.bodyMedium("Geopolitical fragmentation will drive geoeconomic warfare and heighten the risk of multi-domain conflicts",
                                                              color: theme.colorScheme.onBackground,
                                                              fontWeight: 500,
                                                              height: 1.25,
                                                              letterSpacing: 0.1),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 16),
                                                          child: FxText.titleMedium("5. Other Package",
                                                              color: customTheme.appbarColor, fontWeight: 500),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 8),
                                                          child: FxText.bodyMedium("Geopolitical fragmentation will drive geoeconomic warfare and heighten the risk of multi-domain conflicts",
                                                              color: theme.colorScheme.onBackground,
                                                              fontWeight: 500,
                                                              height: 1.25,
                                                              letterSpacing: 0.1),
                                                        ),


                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Divider(thickness: 0.5,color: customTheme.buttonColor,),
                                              Container(
                                                  margin: EdgeInsets.only(top: 8),
                                                  alignment: AlignmentDirectional.centerEnd,
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: <Widget>[
                                                      TextButton(
                                                          onPressed: () {
                                                            Get.back();
                                                            // Get.offNamed(AppPages.getCheckoutPageRoute());
                                                          },
                                                          child: FxText.bodyMedium("Decline", fontWeight: 600)),
                                                      TextButton(
                                                          onPressed: () {
                                                            controller.setCurrentIndex(index);
                                                            Get.back();
                                                            // Get.offNamed(AppPages.getUserTypeRoute());
                                                          },
                                                          child: FxText.bodyMedium("Accept",
                                                              fontWeight: 600, color: customTheme.appbarColor)),
                                                    ],
                                                  )
                                              ),



                                            ],
                                          ),
                                        )
                                    ),
                                  );

                                }
                            );

                            controller.setCurrentIndex(index);

                          },
                          child: Obx(() => Padding(
                              padding: const EdgeInsets.only(top: 5.0,bottom: 5),
                              child: Stack(
                                children: [
                                  FxContainer.bordered(
                                    border: Border.all(
                                        color: controller.currentIndex == index
                                            ? customTheme.buttonColor
                                            : Colors.transparent),
                                    color: Colors.grey.shade200,
                                    paddingAll: 16,
                                    borderRadiusAll: 5,
                                    child: Row(
                                      children: [
                                        FxContainer(
                                            width: Get.width*0.20,
                                            padding: FxSpacing.y(12),
                                            child: Center(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  FxText.bodyMedium(
                                                    "Price",
                                                    fontWeight: 700,
                                                    color: Colors.black87,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            borderRadiusAll: 4,
                                            bordered: true,
                                            border:
                                            Border.all(color: customTheme.appbarColor),
                                            color: Colors.transparent),
                                        FxSpacing.width(16),
                                        Expanded(
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                FxText.bodySmall(
                                                  style:
                                                  TextStyle(fontSize: 15),
                                                  color: customTheme.buttonColor,
                                                  "Regular  Pack",
                                                  fontWeight: 700,
                                                ),
                                                FxSpacing.height(4),
                                                FxText.bodySmall(
                                                  "This package can use by only four members",
                                                  fontSize: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        FxSpacing.width(16),

                                        InkWell(
                                          onTap: (){
                                            controller.setCurrentIndex(index);

                                          },
                                          child: FxContainer(
                                              width: 56,
                                              padding: FxSpacing.y(5),
                                              child: Center(
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      MdiIcons.cart,
                                                      color: customTheme.appbarColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              borderRadiusAll: 4,
                                              bordered: true,
                                              border:
                                              Border.all(color: Colors.transparent),
                                              color: Colors.transparent),
                                        ),
                                        /*FxButton.rounded(
                                          backgroundColor: customTheme.appbarColor,
                                          onPressed: () {},
                                          child: Text(
                                            "\$ " + "200",
                                          ),
                                        ),*/
                                      ],
                                    ),
                                  ),
                                  Obx(() => controller.currentIndex == index
                                      ? Positioned(
                                    right: -1,
                                    top: -1,
                                    child: Container(
                                      padding: FxSpacing.all(2),
                                      decoration: BoxDecoration(
                                          color:customTheme.buttonColor,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft:
                                              Radius.circular(8))),
                                      child: Icon(
                                        MdiIcons.check,
                                        color:
                                        theme.colorScheme.onPrimary,
                                        size: 16,
                                      ),
                                    ),
                                  )
                                      : Container()),
                                ],
                              )),),
                        );
                      }),
                ),
              ),
              Visibility(
                visible: controller.selectedPackType.value == 4 ? true : false,
                child: Expanded(
                  child: ListView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            showGeneralDialog(
                                context: context,
                                barrierDismissible: false,
                                barrierLabel: MaterialLocalizations
                                    .of(context)
                                    .modalBarrierDismissLabel,
                                barrierColor: Colors.white.withOpacity(0.9),
                                transitionDuration: const Duration(
                                    milliseconds: 200),
                                pageBuilder: (BuildContext buildContext,
                                    Animation animation,
                                    Animation secondaryAnimation) {
                                  return Center(
                                    child: Container(
                                        color: Colors.white,
                                        width:Get.width*.90,
                                        height: Get.height*.90,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:<Widget> [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                      alignment: AlignmentDirectional.centerEnd,
                                                      child: TextButton(
                                                          onPressed: () {
                                                            Get.offNamed(AppPages.getCheckoutPageRoute());
                                                          },
                                                          child: FxText.bodyMedium(
                                                              "Package Details".toUpperCase(), fontWeight: 600,color: customTheme.appbarColor)
                                                      )
                                                  ),


                                                ],
                                              ),
                                              Divider(thickness: 0.5,color: customTheme.buttonColor,),
                                              Expanded(
                                                child: SingleChildScrollView(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets.only(top: 8),
                                                          child: FxText.titleMedium("1. Monthly Package",
                                                              color: customTheme.appbarColor, fontWeight: 500),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 8),
                                                          child: FxText.bodyMedium("Failure to mitigate climate change Erosion of social cohesion and societal polarization are the two major global risks for the short term",
                                                            color: theme.colorScheme.onBackground,
                                                            fontWeight: 500,
                                                          ),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 16),
                                                          child: FxText.titleMedium(
                                                              "2. Yearly Package",
                                                              color: customTheme.appbarColor, fontWeight: 500
                                                          ),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 8),
                                                          child: FxText.bodyMedium("This year's Global Risks Report finds that cost-of-living crisis, natural disasters, extreme weather events and geoeconomic confrontation are the top three risks the world would be facing in the next two years.",
                                                              color: theme.colorScheme.onBackground,
                                                              fontWeight: 500,
                                                              height: 1.25,
                                                              letterSpacing: 0.1),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 16),
                                                          child: FxText.titleMedium("3. Premium Package",
                                                              color:   customTheme.appbarColor, fontWeight: 500),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 8),
                                                          child: FxText.bodyMedium("These are being amplified by comparatively new developments in the global risks landscape, including unsustainable levels of debt, a new era of low growth, low global investment and de-globalization, it added",
                                                              color: theme.colorScheme.onBackground,
                                                              fontWeight: 500,
                                                              height: 1.25,
                                                              letterSpacing: 0.1),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 16),
                                                          child: FxText.titleMedium("4. Regular Package",
                                                              color: customTheme.appbarColor, fontWeight: 500),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 8),
                                                          child: FxText.bodyMedium("Geopolitical fragmentation will drive geoeconomic warfare and heighten the risk of multi-domain conflicts",
                                                              color: theme.colorScheme.onBackground,
                                                              fontWeight: 500,
                                                              height: 1.25,
                                                              letterSpacing: 0.1),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 16),
                                                          child: FxText.titleMedium("5. Other Package",
                                                              color: customTheme.appbarColor, fontWeight: 500),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(top: 8),
                                                          child: FxText.bodyMedium("Geopolitical fragmentation will drive geoeconomic warfare and heighten the risk of multi-domain conflicts",
                                                              color: theme.colorScheme.onBackground,
                                                              fontWeight: 500,
                                                              height: 1.25,
                                                              letterSpacing: 0.1),
                                                        ),


                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Divider(thickness: 0.5,color: customTheme.buttonColor,),
                                              Container(
                                                  margin: EdgeInsets.only(top: 8),
                                                  alignment: AlignmentDirectional.centerEnd,
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: <Widget>[
                                                      TextButton(
                                                          onPressed: () {
                                                            Get.back();
                                                            // Get.offNamed(AppPages.getCheckoutPageRoute());
                                                          },
                                                          child: FxText.bodyMedium("Decline", fontWeight: 600)),
                                                      TextButton(
                                                          onPressed: () {
                                                            controller.setCurrentIndex(index);
                                                            Get.back();
                                                            // Get.offNamed(AppPages.getUserTypeRoute());
                                                          },
                                                          child: FxText.bodyMedium("Accept",
                                                              fontWeight: 600, color: customTheme.appbarColor)),
                                                    ],
                                                  )
                                              ),



                                            ],
                                          ),
                                        )
                                    ),
                                  );

                                }
                            );

                            controller.setCurrentIndex(index);

                          },
                          child: Obx(() => Padding(
                              padding: const EdgeInsets.only(top: 5.0,bottom: 5),
                              child: Stack(
                                children: [
                                  FxContainer.bordered(
                                    border: Border.all(
                                        color: controller.currentIndex == index
                                            ? customTheme.buttonColor
                                            : Colors.transparent),
                                    color: Colors.grey.shade200,
                                    paddingAll: 16,
                                    borderRadiusAll: 5,
                                    child: Row(
                                      children: [
                                        FxContainer(
                                            width: Get.width*0.20,
                                            padding: FxSpacing.y(12),
                                            child: Center(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  FxText.bodyMedium(
                                                    "Price",
                                                    fontWeight: 700,
                                                    color: Colors.black87,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            borderRadiusAll: 4,
                                            bordered: true,
                                            border:
                                            Border.all(color: customTheme.appbarColor),
                                            color: Colors.transparent),
                                        FxSpacing.width(16),
                                        Expanded(
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                FxText.bodySmall(
                                                  style:
                                                  TextStyle(fontSize: 15),
                                                  color: customTheme.buttonColor,
                                                  "Premium Pack",
                                                  fontWeight: 700,
                                                ),
                                                FxSpacing.height(4),
                                                FxText.bodySmall(
                                                  "This package can use by only four members",
                                                  fontSize: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        FxSpacing.width(16),

                                        InkWell(
                                          onTap: (){
                                            controller.setCurrentIndex(index);

                                          },
                                          child: FxContainer(
                                              width: 56,
                                              padding: FxSpacing.y(5),
                                              child: Center(
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      MdiIcons.cart,
                                                      color: customTheme.appbarColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              borderRadiusAll: 4,
                                              bordered: true,
                                              border:
                                              Border.all(color: Colors.transparent),
                                              color: Colors.transparent),
                                        ),
                                        /*FxButton.rounded(
                                          backgroundColor: customTheme.appbarColor,
                                          onPressed: () {},
                                          child: Text(
                                            "\$ " + "200",
                                          ),
                                        ),*/
                                      ],
                                    ),
                                  ),
                                  Obx(() => controller.currentIndex == index
                                      ? Positioned(
                                    right: -1,
                                    top: -1,
                                    child: Container(
                                      padding: FxSpacing.all(2),
                                      decoration: BoxDecoration(
                                          color:customTheme.buttonColor,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft:
                                              Radius.circular(8))),
                                      child: Icon(
                                        MdiIcons.check,
                                        color:
                                        theme.colorScheme.onPrimary,
                                        size: 16,
                                      ),
                                    ),
                                  )
                                      : Container()),
                                ],
                              )),),
                        );
                      }),
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: FxSpacing.fromLTRB(20,5,20,0),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          padding: FxSpacing.zero,
          mainAxisSpacing: 20,
          childAspectRatio: 3 / 1,
          crossAxisSpacing: 20,
          children: <Widget>[
            FxButton.block(
              backgroundColor: customTheme.appbarColor,
              elevation: 0,
              borderRadiusAll: 5,
              onPressed: () {
                Get.back();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Icon(
                      MdiIcons.chevronLeft,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  FxText.bodyMedium("PREVIOUS",
                      fontWeight: 500, color: Colors.white, letterSpacing: 0.5),
                ],
              ),
            ),
            FxButton.block(
              backgroundColor: customTheme.buttonColor,
              elevation: 0,
              borderRadiusAll: 5,
              onPressed: () {
                Get.toNamed(AppPages.getCardPageRoute());
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FxText.bodyMedium("NEXT",
                      fontWeight: 500, color: Colors.black, letterSpacing: 0.5),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Icon(
                      MdiIcons.chevronRight,
                      color: Colors.black,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}