import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getx/routes/app_pages.dart';
import 'package:getx/utils/colors.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../controllers/home_controller.dart';
import '../../utils/app_theme.dart';

import '../../utils/custom_theme.dart';
import '../../utils/custom_widget/app_bar.dart';
import '../../utils/custom_widget/custom_appbar.dart';
import '../../utils/images.dart';
import '../profile_page.dart';
import '../registration/registration_screen.dart';
import 'forget_password_screen.dart';

class LogInScreen extends GetView<HomeController> {

  ThemeData theme = AppTheme.cookifyTheme;
  CustomTheme customTheme = AppTheme.customTheme;

  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(
      color: Colors.transparent,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:    CustomAppBar(title:"Login",height: 55,),
      body: Obx(() => ListView(
          padding: FxSpacing.fromLTRB(
              20, 20, 20, 20),
          children: [
            FxText.displaySmall(
              'Hello Again!',
              fontWeight: 500,
              textAlign: TextAlign.center,
            ),
            FxSpacing.height(20),
            FxText.bodyMedium(
              'Welcome back you\'ve been missed!',
              muted: true,
              textAlign: TextAlign.center,
            ),
            FxSpacing.height(32),

            Column(
                children: [
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    validator: _validateMobilelogin,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.phone,
                    style: FxTextStyle.bodyMedium(),
                    decoration: InputDecoration(
                        errorStyle: TextStyle(height: 0),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        isDense: true,
                        fillColor: theme.cardTheme.color,
                        prefixIcon: Icon(
                          FeatherIcons.phoneCall,
                          color: controller.selectedmobiletooltiplogin.value ==true?Colors.red: theme.colorScheme.onBackground,
                        ),
                        suffixIcon: controller.selectedmobiletooltiplogin.value ? InkWell(
                          onTap: (){
                            controller.setmobilerrorlogin(!controller.selectedmobileerrorlogin.value);
                          },
                          child: Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                        ):null,
                        hintText: "Mobile Number",
                        enabledBorder: outlineInputBorder,
                        focusedBorder: outlineInputBorder,
                        border: outlineInputBorder,
                        contentPadding: FxSpacing.all(16),
                        hintStyle: FxTextStyle.bodyMedium(),
                        isCollapsed: true),
                    maxLines: 1,
                    controller: controller.loginemailController,

                  ),
                  5.height,
                  controller.selectedmobiletooltiplogin.value&&controller.selectedmobileerrorlogin.value?
                  Container(
                    margin: FxSpacing.top(0),
                    child:singleActivityWidget(
                        subtitle:"3. Number can't be null" ,
                        color: Colors.red.shade200,
                        iconData: MdiIcons.run,
                        title: "1. Write number except zero(0)",
                        description: "2. Only digits"),

                  )
                      :Container( ),


                  SizedBox(height: 10,),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    validator: _validatepasswordlogin,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.phone,
                    style: FxTextStyle.bodyMedium(),
                    decoration: InputDecoration(
                        errorStyle: TextStyle(height: 0),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        isDense: true,
                        fillColor: theme.cardTheme.color,
                        prefixIcon: Icon(
                          FeatherIcons.lock,
                          color: controller.selectedpasswordtooltiplogin.value ==true?Colors.red: theme.colorScheme.onBackground,
                        ),
                        suffixIcon: controller.selectedpasswordtooltiplogin.value ? InkWell(
                          onTap: (){
                            controller.setpassworderrorlogin(!controller.selectedpassworderrorlogin.value);

                          },
                          child: Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                        ):null,
                        hintText: "Password",
                        enabledBorder: outlineInputBorder,
                        focusedBorder: outlineInputBorder,
                        border: outlineInputBorder,
                        contentPadding: FxSpacing.all(16),
                        hintStyle: FxTextStyle.bodyMedium(),
                        isCollapsed: true),
                    maxLines: 1,
                    controller: controller.loginpasswordController,

                  ),
                  5.height,
                  controller.selectedpasswordtooltiplogin.value&&controller.selectedpassworderrorlogin.value?
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(width: 1, color: Colors.red)),
                    child: singleActivityWidget(
                        subtitle:"3. Length will be 8 or more" ,
                        color: Colors.red.shade200,
                        iconData: MdiIcons.run,
                        title: "1. Mixed with numbers and characters",
                        description: "2. Password should be unique"),
                  ):Container()


                ]
            ),

            FxSpacing.height(20),
            Align(
              alignment: Alignment.centerRight,
              child: FxButton.text(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>ForgotPasswordScreen ())
                  );

                },
                padding: FxSpacing.zero,
                splashColor: theme.colorScheme.primary.withAlpha(40),
                backgroundColor:  Colors.teal[800],
                child: Text(
                  "Forgot Password ?",
                  style: FxTextStyle.bodySmall(
                      color: Colors.black,decoration: TextDecoration.underline),
                ),
              ),
            ),
            FxSpacing.height(20),
            FxButton.block(

              elevation: 0,
              borderRadiusAll: 5,
              onPressed: ()
              {
                if(controller.loginemailController.text.isEmptyOrNull)
                {
                  controller.setmobiletooltiplogin(true);
                  return;
                }
                if(controller.loginpasswordController.text.isEmptyOrNull)
                {
                  controller.setpasswordtooltiplogin(true);
                  return;
                }
                if(!isPhoneNoValid(controller.loginemailController.text))
                  {
                    return;
                  }
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));

              },
              splashColor: theme.colorScheme.onPrimary.withAlpha(28),
              backgroundColor: customTheme.buttonColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FxText.labelLarge(
                    "Sign In",
                    fontWeight: 500,
                    color: Colors.black,
                    letterSpacing: 0.4,
                  ),
                  FxSpacing.width(10),
                  Icon(Icons.arrow_forward,color: Colors.black,),
                  FxSpacing.width(8),

                ],
              ),
            ),
            FxSpacing.height(20),
            Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: FxSpacing.x(16),
                  child: FxText.bodySmall(
                    'Continue with',
                    muted: true,
                    fontSize: 10,
                    fontWeight: 600,
                  ),
                ),
                Expanded(child: Divider()),
              ],
            ),
            FxSpacing.height(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FxContainer.bordered(
                  padding: FxSpacing.all(16),
                  borderRadiusAll: 4,
                  child: Image(
                    height: 20,
                    width: 20,
                    image: AssetImage(Images.google),
                  ),
                ),
                FxContainer.bordered(
                  padding: FxSpacing.all(16),
                  borderRadiusAll: 4,
                  child: Image(
                    height: 20,
                    width: 20,
                    image: AssetImage(Images.apple),
                  ),
                ),
                FxContainer.bordered(
                  padding: FxSpacing.all(16),
                  borderRadiusAll: 4,
                  child: Image(
                    height: 20,
                    width: 20,
                    image: AssetImage(Images.facebook),
                  ),
                ),
              ],
            ),
            FxSpacing.height(20),
            Center(
              child: FxButton.text(
                  padding: FxSpacing.zero,
                  onPressed: ()
                  {
                    Get.offNamed(AppPages.getRegisterRoute());

                  },
                  child: FxText.labelLarge("Create an Account",
                      decoration: TextDecoration.underline,
                      color: Colors.black)),
            )
          ]
      ),)
    );


  }
  String? _validateMobilelogin(String? value) {
    if (value.isEmptyOrNull) {
      SchedulerBinding.instance.addPostFrameCallback((duration) {
        controller.setmobiletooltiplogin(true);
      }
      );
      return "";
    } else {
      SchedulerBinding.instance.addPostFrameCallback((duration) {
        controller.setmobiletooltiplogin(false);
      });
      return null;
    }
  }
  String? _validatepasswordlogin(String? value) {
    if (value.isEmptyOrNull) {
      SchedulerBinding.instance.addPostFrameCallback((duration) {
        controller.setpasswordtooltiplogin(true);
      }
      );
      return "";
    } else {
      SchedulerBinding.instance.addPostFrameCallback((duration) {
        controller.setpasswordtooltiplogin(false);
      });
      return null;
    }
  }
  Widget singleActivityWidget(
      {required String subtitle,
        required Color color,
        IconData? iconData,
        required String title,
        required String description}) {
    return  SingleChildScrollView(
      child: FxContainer.bordered(
        paddingAll: 3,
        borderRadiusAll: 5,
        child: Row(
          children: [
            FxContainer(
              width: 25,
              padding: EdgeInsets.all(6),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.error,color: Colors.red,)
                  ],
                ),
              ),
              borderRadiusAll: 5,
            ),
            FxSpacing.width(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FxText.bodySmall(
                    "${title}",
                    fontSize: 10,
                  ),

                  FxText.bodySmall(
                    "${description}",
                    fontSize: 10,
                  ),

                  FxText.bodySmall(
                    "${subtitle}",
                    fontSize: 10,
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
  bool isPhoneNoValid(String? phoneNo) {
    if (phoneNo == null) return false;
    final regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    return regExp.hasMatch(phoneNo);
  }


}