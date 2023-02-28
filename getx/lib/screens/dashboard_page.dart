import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getx/routes/app_pages.dart';
import 'package:getx/screens/setting.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/home_controller.dart';
import '../utils/app_theme.dart';
import '../utils/chart_sample_data.dart';
import '../utils/colors.dart';
import '../utils/constant.dart';
import '../utils/custom_bottom_navigation_bar.dart';
import '../utils/custom_theme.dart';
import '../utils/custom_widget/app_bar.dart';
import '../utils/custom_widget/custom_appbar.dart';
import '../utils/dash_controller.dart';
import '../utils/single_grid_item.dart';
import 'notifications.dart';


class DashboardScreen extends GetView<HomeController> {
  List<TextIconItem> _textIconChoice = [
    TextIconItem("Add new", Icons.add),
    TextIconItem("Contact", Icons.email),
    TextIconItem("Setting", Icons.build),
    TextIconItem("Adminstrative", Icons.admin_panel_settings),
  ];
  ThemeData theme = AppTheme.theme;
   CustomTheme customTheme=CustomTheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:customTheme.appbarColor,
        title: FxText.titleMedium("Dashboard".toUpperCase(), fontWeight: 500,color: Colors.white,),
        leading: drawerMenus(context),

        actions: <Widget>[
          Padding(
            padding: FxSpacing.x(16),
            child: Icon(Icons.notifications,color: Colors.white,),
          ),

          PopupMenuButton(
            onSelected: (value){
              if(value=="Adminstrative")
              {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => BasicSettingScreen()));

              }
              if(value=="Setting")
              {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => NotificationSettingScreen()));

              }
            },
            itemBuilder: (BuildContext context) {
              return _textIconChoice.map((TextIconItem choice) {
                return PopupMenuItem(
                  value: choice.text,
                  child: Row(
                    children: <Widget>[
                      Icon(choice.iconData,
                          size: 18,
                          color: theme.colorScheme.onBackground),
                      FxSpacing.width(8),
                      Text(choice.text,
                          style: TextStyle(letterSpacing: 0.15)
                              .merge(theme.textTheme.bodyText2)
                              .merge(TextStyle(
                              color: theme
                                  .colorScheme.onBackground)))
                    ],
                  ),
                );
              }).toList();
            },
            color: theme.backgroundColor,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: FxSpacing.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              overview(),


            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(() =>CustomBottomNavigation(
        animationDuration: Duration(milliseconds: 350),
        selectedItemOverlayColor: customTheme.groceryPrimary.withAlpha(28),
        backgroundColor: AppTheme.shoppingManagerTheme.colorScheme.background,
        selectedIndex: controller.currentIndex.value,
        onItemSelected: (index) {
          controller.setCurrentIndex(index);
          if(controller.currentIndex.value==3)
            {
              _showBottomSheet(context);
            }
          if(controller.currentIndex.value==1)
            {

              Get.toNamed(AppPages.getSalesPageRoute());
            }

        },
        items: <CustomBottomNavigationBarItem>[
          /*-------------- Build tabs here -----------------*/
          CustomBottomNavigationBarItem(
              title: 'Home',
              icon: Icon(Icons.home),
              activeColor:customTheme.greenLight,
              inactiveColor: AppTheme.shoppingManagerTheme.colorScheme.onBackground.withAlpha(180)),
          CustomBottomNavigationBarItem(
              title: 'Sales',
              icon: Icon(Icons.store),
              activeColor:customTheme.greenLight,
              inactiveColor: AppTheme.shoppingManagerTheme.colorScheme.onBackground.withAlpha(180)),
          CustomBottomNavigationBarItem(
              title: 'Purchase',
              icon: Icon(Icons.sell),
              activeColor:customTheme.greenLight,
              inactiveColor: AppTheme.shoppingManagerTheme.colorScheme.onBackground.withAlpha(180)),
          CustomBottomNavigationBarItem(
              title: 'All',
              icon: Icon(Icons.flash_on_outlined),
              activeColor:customTheme.greenLight,
              inactiveColor: AppTheme.shoppingManagerTheme.colorScheme.onBackground.withAlpha(180)),


        ],
      ),
      ),



    );
  }
  void _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: AppTheme.shoppingManagerTheme.backgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              child: Padding(
                padding: FxSpacing.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FxText.titleMedium("Navigation", fontWeight: 500),
                        120.width,
                        InkWell(
                          onTap: (){
                            Get.back();
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
                                              GestureDetector(
                                                onTap:(){
                                                  Get.back();
                                                },
                                                child: Container(
                                                  child: Icon(Icons.cancel,color: Colors.red,),
                                                ),
                                              ),

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

                            child: FxText.titleMedium("View-all", fontWeight: 500,decoration: TextDecoration.underline,)
                        ),
                        20.width,
                        GestureDetector(
                          onTap:(){
                            Get.back();
                          },
                          child: Container(
                            child: Icon(Icons.cancel,color: Colors.red,),
                          ),
                        ),

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
        });
  }


  Widget drawerMenus(BuildContext context) {
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
  }
  Widget overview() {
    return Column(
      children: [
        FxContainer(

            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        FxContainer(
                          width: 10,
                          height: 20,
                          color: theme.colorScheme.primaryContainer,
                          borderRadiusAll: 2,
                        ),
                        FxSpacing.width(8),
                        FxText.titleSmall(
                          "Overview",
                          fontWeight: 600,
                        ),
                      ],
                    ),
                    timeFilter()
                  ],
                ),
                FxSpacing.height(20),
                status()
              ],
            )),
      ],
    );
  }
  Widget timeFilter() {
    return PopupMenuButton(
      color: theme.colorScheme.background,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constant.containerRadius.small)),
      elevation: 1,
      child: FxContainer.bordered(
          paddingAll: 12,

          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FxText.bodySmall(
                controller.time,
              ),
              FxSpacing.width(8),
              Icon(
                FeatherIcons.chevronDown,
                size: 14,
              )
            ],
          )),
      itemBuilder: (BuildContext context) => [...controller.timeList.map((time) => PopupMenuItem(
          onTap: () {
            //controller.changeFilter(time);
          },
          padding: FxSpacing.x(16),
          height: 36,
          child: FxText.bodyMedium(time)))
      ],
    );
  }
  Widget status() {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: FxContainer.bordered(
              color: theme.colorScheme.background,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.bodySmall(
                    'Customers',
                    fontWeight: 600,
                    muted: true,
                  ),
                  FxSpacing.height(8),
                  FxText.titleLarge(
                    '248',
                    fontWeight: 700,
                  ),
                  FxSpacing.height(8),
                  FxContainer(
                      borderRadiusAll: Constant.containerRadius.small,
                      paddingAll: 6,
                      color: theme.colorScheme.primaryContainer,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            FeatherIcons.arrowUp,
                            size: 12,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                          FxSpacing.width(2),
                          FxText.bodySmall(
                            "28%",
                            color: theme.colorScheme.onPrimaryContainer,
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
          FxSpacing.width(20),
          Expanded(
              child: FxContainer(
                color: theme.colorScheme.primaryContainer,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText.bodySmall(
                      'Income',
                      fontWeight: 600,
                      muted: true,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                    FxSpacing.height(8),
                    FxText.titleLarge(
                      '148k',
                      fontWeight: 700,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                    FxSpacing.height(8),
                    FxContainer(
                        borderRadiusAll: Constant.containerRadius.small,
                        paddingAll: 6,
                        color: theme.colorScheme.errorContainer,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              FeatherIcons.arrowDown,
                              size: 12,
                              color: theme.colorScheme.onErrorContainer,
                            ),
                            FxSpacing.width(2),
                            FxText.bodySmall(
                              "45%",
                              fontWeight: 600,
                              color: theme.colorScheme.onErrorContainer,
                            )
                          ],
                        ))
                  ],
                ),
              )),
        ],
      ),
    );
  }


}
class _QuickActionWidget extends StatelessWidget {
  CustomTheme customTheme=CustomTheme();

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
              color: customTheme.greenPrimary.withAlpha(28) ,
              // button color
              child: InkWell(
                splashColor: themeData.colorScheme.primary.withAlpha(100),
                highlightColor: Colors.transparent,
                child: SizedBox(
                    width: 52,
                    height: 52,
                    child: Icon(
                      iconData,
                      color:customTheme.greenLight,
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




