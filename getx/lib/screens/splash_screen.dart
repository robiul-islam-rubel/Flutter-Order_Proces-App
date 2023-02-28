/*
* File : Shopping Onboarding
* Version : 1.0.0
* */


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/on_boarding/on_boarding.dart';
import 'package:flutx/widgets/on_boarding/ui/pages.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx/screens/registration/registration_screen.dart';
import 'package:getx/screens/shop_type_page.dart';
import 'package:getx/utils/colors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../routes/app_pages.dart';

import '../utils/constant.dart';

import 'login/login_screen.dart';

import '../utils/app_theme.dart';
import '../utils/custom_theme.dart';
import '../utils/images.dart';



class ShoppingOnboardingScreen extends StatefulWidget {
  @override
  _ShoppingOnboardingScreenState createState() =>
      _ShoppingOnboardingScreenState();
}

class _ShoppingOnboardingScreenState extends State<ShoppingOnboardingScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height-100,
              color: customTheme.appbarColor,
              child: FxOnBoarding(
                pages: <PageViewModel>[
                  PageViewModel(
                    theme.backgroundColor,
                    Padding(
                      padding: EdgeInsets.all(40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Center(
                              child: Image(
                                image: AssetImage(Images.logo3),
                                width: 300,
                                height: 320,
                              )),
                          SizedBox(height: 30),
                          FxText.bodyLarge(
                              'Find lots of product\naround the world',
                              fontWeight: 700),
                          SizedBox(height: 16),
                          FxText(
                              'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                              fontWeight: 500),
                        ],
                      ),
                    ),
                  ),
                  PageViewModel(
                    theme.backgroundColor,
                    Padding(
                      padding: EdgeInsets.all(40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Center(
                              child: Image(
                                image: AssetImage(Images.logo2),
                                width: 300,
                                height: 320,
                              )),
                          SizedBox(height: 30),
                          FxText.bodyLarge('Secure payment\nwith SSL ',
                              fontWeight: 700),
                          SizedBox(height: 16),
                          FxText.bodyMedium(
                              'Lorem ipsum dolor sit amet, consect adipiing elit, sed do eiusmod tempor incididunt ut labore et.',
                              fontWeight: 500)
                        ],
                      ),
                    ),
                  ),
                  PageViewModel(
                    theme.backgroundColor,
                    Padding(
                      padding: EdgeInsets.all(40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                              child: Image(
                                image: AssetImage(Images.logo1),
                                width: 300,
                                height: 320,
                              )),
                          SizedBox(height: 30),
                          FxText.bodyLarge('Fast delivery\nat a snap',
                              fontWeight: 700),
                          SizedBox(height: 16),
                          FxText.bodyMedium(
                              'Lorem ipsum dolor sit amet, consect adicing elit, sed do eiusmod tempor incididunt ut labore et.',
                              fontWeight: 500),
                        ],
                      ),
                    ),
                  ),
                ],
                unSelectedIndicatorColor: customTheme.appbarColor,
                selectedIndicatorColor: customTheme.buttonColor,
                doneWidget: InkWell(
                  splashColor: theme.colorScheme.primary,
                  onTap: () {
                    Get.offNamed(AppPages.getRegisterRoute());
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: FxText.titleSmall("DONE".toUpperCase(),
                        fontWeight: 700, color: customTheme.appbarColor),
                  ),
                ),
                skipWidget:  Text("")
              ),

          ),
          FxSpacing.height(34),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Row(
              children: [
                Expanded(
                  child: FxButton.outlined(
                    borderColor: theme.dividerColor,
                    borderRadiusAll:5,
                    onPressed: () {
                      //Get.offNamed(AppPages.getLogInRoute());
                      Get.toNamed(AppPages.getDashBoardPageRoute());

                    },
                    child: FxText.labelLarge(
                      "Sign In",
                    ),
                  ),
                ),
                FxSpacing.width(20),
                Expanded(
                  child: FxButton.small(
                    backgroundColor: Colors.green,
                    padding: FxSpacing.all(16),
                    borderRadiusAll: 5,
                    onPressed: () {
                      Get.offNamed(AppPages.getShopTypeRoute());

                    },
                    elevation: 0,
                    child: FxText.labelLarge(
                      "Register",
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }



  }

