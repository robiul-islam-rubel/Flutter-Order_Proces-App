import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:get/get.dart';
import 'package:getx/utils/custom_widget/custom_appbar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controllers/home_controller.dart';
import '../routes/app_pages.dart';
import '../utils/app_theme.dart';
import '../utils/colors.dart';
import '../utils/custom_theme.dart';
import '../utils/custom_widget/required_field.dart';


class IvoiceCard extends GetView<HomeController> {
  CustomTheme customTheme = AppTheme.customTheme;
  ThemeData theme = AppTheme.theme;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Invoice",height: 55,),
      body: ListView(
        padding: FxSpacing.fromLTRB(20, 20, 20, 20),
        children:
        [
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RequiredFormTitle(
                    'Card Number', fontSize: 15,
                    fontWeight: FontWeight.w500
                ),
                Container(
                  height: 50,
                  width: Get.width*0.90,
                  child: TextFormField(
                    style: FxTextStyle.titleSmall(
                        letterSpacing: 0,
                        color: theme.colorScheme.onBackground,
                        fontWeight: 500),
                    decoration: InputDecoration(
                      labelStyle: FxTextStyle.titleSmall(textStyle: TextStyle(fontWeight: FontWeight.bold),
                          letterSpacing: 0,
                          color: Colors.black,
                          fontWeight: 700),
                      hintText: "1234 5678 9012 3456",
                      hintStyle: FxTextStyle.titleSmall(
                          letterSpacing: 0,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          borderSide:BorderSide(
                              width: 1, color: Colors.greenAccent)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          borderSide: BorderSide(
                              width: 1, color: Colors.black38 )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          borderSide: BorderSide(
                              width: 1, color: customTheme.appbarColor)
                      ),
                      filled: true,
                      fillColor: customTheme.card,
                      prefixIcon: Icon(Icons.numbers,color: customTheme.appbarColor,),

                      isDense: true,
                      contentPadding: EdgeInsets.all(0),
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.number,


                  ),

                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RequiredFormTitle(
                          'Expiry date', fontSize: 15,
                          fontWeight: FontWeight.w500
                      ),
                      Container(
                        height: 50,
                        width: Get.width*0.40,
                        child: TextFormField(
                          keyboardType: TextInputType.datetime,
                          style: FxTextStyle.titleSmall(
                              letterSpacing: 0,
                              color: theme.colorScheme.onBackground,
                              fontWeight: 500),
                          decoration: InputDecoration(
                            labelStyle: FxTextStyle.titleSmall(textStyle: TextStyle(fontWeight: FontWeight.bold),
                                letterSpacing: 0,
                                color: Colors.black,
                                fontWeight: 700),
                            hintText: "01/23",
                            hintStyle: FxTextStyle.titleSmall(
                                letterSpacing: 0,
                                color: theme.colorScheme.onBackground,
                                fontWeight: 500),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                borderSide:BorderSide(
                                    width: 1, color: Colors.greenAccent)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                borderSide: BorderSide(
                                    width: 1, color: Colors.black38 )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                borderSide: BorderSide(
                                    width: 1, color: customTheme.appbarColor)
                            ),
                            filled: true,
                            fillColor: customTheme.card,
                            prefixIcon: Icon(Icons.date_range,color: customTheme.appbarColor,),

                            isDense: true,
                            contentPadding: EdgeInsets.all(0),
                          ),
                          textCapitalization: TextCapitalization.sentences,


                        ),

                      ),

                    ],
                  ),
                  30.width,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RequiredFormTitle(
                          'Security code', fontSize: 15,
                          fontWeight: FontWeight.w500
                      ),
                      Container(
                        height: 50,
                        width: Get.width*0.40,
                        child: TextFormField(
                          style: FxTextStyle.titleSmall(
                              letterSpacing: 0,
                              color: theme.colorScheme.onBackground,
                              fontWeight: 500),
                          decoration: InputDecoration(
                            labelStyle: FxTextStyle.titleSmall(textStyle: TextStyle(fontWeight: FontWeight.bold),
                                letterSpacing: 0,
                                color: Colors.black,
                                fontWeight: 700),
                            hintText: "* * *",
                            hintStyle: FxTextStyle.titleSmall(
                                letterSpacing: 0,
                                color: theme.colorScheme.onBackground,
                                fontWeight: 500),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                borderSide:BorderSide(
                                    width: 1, color: Colors.greenAccent)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                borderSide: BorderSide(
                                    width: 1, color: Colors.black38 )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                borderSide: BorderSide(
                                    width: 1, color: customTheme.appbarColor)
                            ),
                            filled: true,
                            fillColor: customTheme.card,
                            prefixIcon: Icon(MdiIcons.lockOutline,color: customTheme.appbarColor,),

                            isDense: true,
                            contentPadding: EdgeInsets.all(0),
                            suffixIcon:Icon(Icons.remove_red_eye_outlined,color: customTheme.appbarColor,)
                          ),
                          textCapitalization: TextCapitalization.sentences,


                        ),

                      ),

                    ],
                  )


                ],
              )
              ],
           )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: FxSpacing.fromLTRB(20, 20, 20, 20),
        child: FxButton.medium(
          padding: FxSpacing.fromLTRB(10, 10, 10, 10),
          onPressed: () {
           // Get.toNamed(AppPages.getCheckoutPageRoute());
          },
          child: FxText.labelMedium(
            "Pay",
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

}
