import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/dashed_divider/dashed_divider.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getx/utils/custom_widget/custom_appbar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controllers/home_controller.dart';
import '../routes/app_pages.dart';
import '../utils/app_theme.dart';
import '../utils/colors.dart';
import '../utils/constant.dart';
import '../utils/custom_theme.dart';
import '../utils/custom_widget/app_bar.dart';
import '../utils/images.dart';


class  CardPage extends GetView<HomeController> {
  @override
  ThemeData theme = AppTheme.theme;
  CustomTheme customTheme = AppTheme.customTheme;


  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(
      color: Colors.transparent,
    ),
  );

  Widget build(BuildContext context) {
    setStatusBarColor(Colors.green.shade900);

    return Scaffold(
        appBar: CustomAppBar(title:"Card",height: 55,),
        body: ListView(
          physics: NeverScrollableScrollPhysics(),
          padding: FxSpacing.fromLTRB(20, 20, 20, 20),
          children: <Widget>[
            Container(
              height:Get.height*0.57,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, int i)
                  {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                      child: FxContainer.bordered(
                        border: Border.all(
                            color:  customTheme.buttonColor
                        ),
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
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  FxText.bodySmall(
                                    style:
                                    TextStyle(fontSize: 15),
                                    color:  customTheme.buttonColor,
                                    "Package - " + "${i+1}",
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
                            FxSpacing.width(16),

                            InkWell(
                              onTap: (){
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
                                          height: Get.height*0.64,
                                          color: Colors.white,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              GestureDetector(
                                                onTap:(){
                                                  Get.back();
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.only(right: 8.0),
                                                  child: Container(
                                                    child: Icon(Icons.cancel,color: Colors.red,),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: Get.height*0.60,
                                                child: ListView.builder(
                                                    itemCount: 10,
                                                    itemBuilder: (context,int index)
                                                    {
                                                      return Padding(
                                                          padding: const EdgeInsets.all(10.0),
                                                          child: Column(
                                                              children: [
                                                                Obx(()=>  ExpansionPanelList(
                                                                  expandedHeaderPadding: EdgeInsets.all(0),
                                                                  expansionCallback: (int i, bool isExpanded) {
                                                                    controller.dataExpansionPanel[index]=!isExpanded;
                                                                  },
                                                                  animationDuration: Duration(milliseconds: 500),
                                                                  children: <ExpansionPanel>[
                                                                    ExpansionPanel(
                                                                      canTapOnHeader: true,
                                                                      isExpanded: controller.dataExpansionPanel[index],
                                                                      headerBuilder: (BuildContext context, bool isExpanded) {
                                                                        return  FxContainer.bordered(
                                                                            color: Colors.white,
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
                                                                                    borderRadiusAll: 5,
                                                                                    bordered: true,
                                                                                    border: Border.all(color: customTheme.appbarColor),
                                                                                    color: Colors.transparent),
                                                                                FxSpacing.width(16),
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    crossAxisAlignment:
                                                                                    CrossAxisAlignment.start,
                                                                                    children: [


                                                                                      Text("Package - "+"${index+1}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.black),),
                                                                                      FxSpacing.height(4),
                                                                                      FxText.bodySmall(
                                                                                        "This package can use by only four members",
                                                                                        fontSize: 10,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                FxContainer(
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

                                                                                // FxSpacing.height(16),

                                                                              ],
                                                                            )
                                                                        );
                                                                      },
                                                                      body:  Container(
                                                                        padding: FxSpacing.fromLTRB(20, 20, 20, 20),
                                                                        child: Center(
                                                                          child: FxText.bodyMedium("Content of panel", fontWeight: 500),
                                                                        ),
                                                                      ),

                                                                    ),




                                                                  ],
                                                                )
                                                                ),


                                                              ]
                                                          )

                                                      );
                                                    }
                                                ),
                                              ),
                                            ],
                                          ),

                                        ),

                                      );

                                    }
                                );


                              },
                              child: FxContainer(
                                  width: 56,
                                  padding: FxSpacing.y(5),
                                  child: Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.info,
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

                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),


            10.height,
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxText.bodyMedium("Subtotal", fontWeight: 500),
                    FxText.bodyMedium("\$250.00",
                        letterSpacing: 0.25, fontWeight: 500),
                  ],
                ),
                FxSpacing.height(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxText.bodyMedium("Delivery", fontWeight: 500),
                    FxText.bodyMedium("\$18.50",
                        letterSpacing: 0.25, fontWeight: 500),
                  ],
                ),
                FxSpacing.height(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxText.bodyMedium("Tax & Fee", fontWeight: 500),
                    FxText.bodyMedium("\$9.50",
                        letterSpacing: 0.25, fontWeight: 500),
                  ],
                ),
                FxSpacing.height(12),
                FxDashedDivider(
                  dashSpace: 6,
                  height: 1.2,
                  dashWidth: 8,
                  color: theme.colorScheme.onBackground,
                ),
                FxSpacing.height(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxText.bodyLarge("Total", fontWeight: 500),
                    FxText.bodyLarge("\$278.00",
                        letterSpacing: 0.25, fontWeight: 500),
                  ],
                ),
              ],
            ),


          ],
        ),
      bottomNavigationBar:Padding(
        padding: FxSpacing.fromLTRB(20, 20, 20, 20),
        child: FxButton.medium(
          padding: FxSpacing.fromLTRB(10, 10, 10, 10),
        onPressed: () {
          Get.toNamed(AppPages.getCheckoutPageRoute());
        },
        child: FxText.labelMedium(
        "CHECKOUT",
        letterSpacing: 0.5,
        fontWeight: 500,
        color: customTheme.groceryOnPrimary,
        ),
        backgroundColor:customTheme.appbarColor,
        borderRadiusAll: 5,
        elevation: 0,
        ),
      ),
    );
  }
 /* Widget drawerMenus(BuildContext context) {
    return InkWell(
      onTap: () {
        showAlignedDialog(
          context: context,
          followerAnchor: Alignment.topLeft,
          isGlobal: true,
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
              position: Tween(begin: Offset(-1, 0), end: Offset(0, 0))
                  .animate(animation),
              child: FadeTransition(
                opacity: CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOut,
                ),
                child: child,
              ),
            );
          },
          builder: (context) {
            return Center(
              child: Container(
                height: Get.height*0.50,
                color: Colors.white,
                child: Padding(
                  padding: FxSpacing.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FxText.titleMedium("Navigation", fontWeight: 500),
                          //FxText.titleMedium("View-all", fontWeight: 500,decoration: TextDecoration.underline,),

                        ],
                      ),

                      Container(
                        margin: FxSpacing.top(16),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      _QuickActionWidget(
                                        iconData: Icons.phone_outlined,
                                        actionText: 'Prepaid',
                                      ),
                                      _QuickActionWidget(
                                        iconData: Icons.subway_outlined,
                                        actionText: 'Metro',
                                      ),
                                      _QuickActionWidget(
                                        iconData:
                                        Icons.local_gas_station_outlined,
                                        actionText: 'Gas Bill',
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      _QuickActionWidget(
                                        iconData: Icons.light_outlined,
                                        actionText: 'Electricity',
                                      ),
                                      _QuickActionWidget(
                                        iconData: Icons.tv,
                                        actionText: 'DTH',
                                      ),
                                      _QuickActionWidget(
                                        iconData: Icons.camera_outlined,
                                        actionText: 'Gold',
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      _QuickActionWidget(
                                        iconData: Icons.phone_outlined,
                                        actionText: 'Postpaid',
                                      ),
                                      _QuickActionWidget(
                                        iconData: Icons.play_arrow_outlined,
                                        actionText: 'G Play',
                                      ),
                                      _QuickActionWidget(
                                        iconData: Icons.umbrella_outlined,
                                        actionText: 'Insurance',
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Icon(Icons.menu),
    );
  }*/
}
class _QuickActionWidget extends StatelessWidget {
  final IconData iconData;
  final String actionText;

  _QuickActionWidget(
      {Key? key, required this.iconData, required this.actionText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      margin: FxSpacing.y(12),
      child: Column(
        children: <Widget>[
          ClipOval(
            child: Material(
              color: themeData.colorScheme.primary.withAlpha(20),
              // button color
              child: InkWell(
                splashColor: themeData.colorScheme.primary.withAlpha(100),
                highlightColor: Colors.transparent,
                child: SizedBox(
                    width: 52,
                    height: 52,
                    child: Icon(
                      iconData,
                      color: themeData.colorScheme.primary,
                    )),
                onTap: () {},
              ),
            ),
          ),
          Padding(
            padding: FxSpacing.top(4),
            child: FxText.bodySmall(actionText, fontWeight: 600),
          )
        ],
      ),
    );
  }
}
