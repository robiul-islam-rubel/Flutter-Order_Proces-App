import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getx/utils/custom_theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutx/flutx.dart';

import '../../controllers/home_controller.dart';
import '../../routes/app_pages.dart';
import '../utils/app_theme.dart';
import '../utils/colors.dart';
import '../utils/constant.dart';
import '../utils/custom_widget/custom_appbar.dart';
import '../utils/images.dart';
class TextIconItem {
  String text;
  IconData iconData;

  TextIconItem(this.text, this.iconData);
}

class TermsandConditionPage extends GetView<HomeController> {
  @override

  List<TextIconItem> _textIconChoice = [
    TextIconItem("Add new", Icons.add),
    TextIconItem("Find me", Icons.map),
    TextIconItem("Contact", Icons.email),
    TextIconItem("Setting", Icons.build),
  ];

  ThemeData theme = AppTheme.theme;
  CustomTheme customTheme = AppTheme.customTheme;
  bool? isChecked = false;

  var  selectedValue=false;
  final List<int> _list = List.generate(10, (i) => i);
  final List<bool> _selected = List.generate(10, (i) => false);

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
        appBar: CustomAppBar(title:"ReadMe",height: 55,),
        body: ListView(
            padding: FxSpacing.fromLTRB(20, 20, 20, 20),
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Column(
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
                            color: customTheme.appbarColor, fontWeight: 500),
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
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: FxText.titleMedium("6. Other Package",
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
                      Center(
                        child: FxButton.small(
                          backgroundColor: customTheme.buttonColor,
                          onPressed: (){
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
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children:<Widget> [
                                              Container(
                                                  alignment: AlignmentDirectional.topStart,
                                                  child: TextButton(
                                                      onPressed: () {
                                                        Get.offNamed(AppPages.getCheckoutPageRoute());
                                                      },
                                                      child: FxText.bodyMedium(
                                                        "Package Details".toUpperCase(), fontWeight: 600,color: customTheme.appbarColor)
                                                  )
                                              ),
                                              Divider(thickness: 0.5,color: customTheme.buttonColor,),
                                              Container(
                                                height: Get.height*0.70,
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
                                                            Get.toNamed(AppPages.getCheckoutPageRoute());
                                                          },
                                                          child: FxText.bodyMedium("Decline", fontWeight: 600)),
                                                      TextButton(
                                                          onPressed: () {
                                                            Get.back();
                                                            Get.toNamed(AppPages.getUserTypeRoute());
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
                          },


                          child: FxText.bodyMedium(
                              "See Package"
                          ),
                        ),
                      ),


                    ],
                  ),

                ],
              ),
            ),
      ]
        )

    );
  }

}