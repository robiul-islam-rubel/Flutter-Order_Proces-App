import 'package:another_flushbar/flushbar.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:flutx/flutx.dart';
import 'package:getx/utils/constant.dart';
import 'package:intl/intl.dart';

import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:super_tooltip/super_tooltip.dart';

import '../../controllers/home_controller.dart';
import '../../routes/app_pages.dart';
import '../../utils/app_theme.dart';
import '../../utils/colors.dart';
import '../../utils/custom_theme.dart';
import '../../utils/custom_widget/app_bar.dart';
import '../../utils/custom_widget/custom_appbar.dart';
import '../../utils/custom_widget/required_field.dart';
import '../../utils/custom_widget/widgets.dart';
import '../../utils/images.dart';



class RegistrationScreen extends GetView<HomeController> {
  FocusNode shopFocus=FocusNode();
  FocusNode mobFocus=FocusNode();
  FocusNode emailFocus=FocusNode();
  FocusNode addFocus=FocusNode();


  @override

    ThemeData theme = AppTheme.cookifyTheme;
  SuperTooltip? tooltip;
  CustomTheme customTheme = CustomTheme();
  final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: Colors.grey,
      ),
    );
  @override
  Widget build(BuildContext context) {
    setStatusBarColor(Colors.green.shade900);
    return Scaffold(
      appBar:   CustomAppBar(title:"Registration".tr,height: 55,),
      body: ListView(
          padding: FxSpacing.fromLTRB(20, 20, 20, 20),
        children: [
          FxText.displayMedium(
            fontWeight: 400,
            'Register',
            textAlign: TextAlign.center,
          ),
          FxSpacing.height(20),
          FxText.bodyMedium(
            'Sign up to get started!',
            muted: true,
            textAlign: TextAlign.center,
          ),
          FxSpacing.height(32),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RequiredFormTitle(
                    'Shop Name', fontSize: 15,
                    fontWeight: FontWeight.w500),
                FxSpacing.height(5),
                Container(
                  height: Get.height*0.055,
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[a-z A-Z]')),],
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: FxTextStyle.bodyMedium(),
                  decoration: InputDecoration(
                      errorStyle: TextStyle(height: 0),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      isDense: true,
                      fillColor: theme.cardTheme.color,
                      prefixIcon: Icon(
                        FeatherIcons.home,
                        color:  theme.colorScheme.onBackground,
                      ),
                      hintText: "Shop Name",
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      border: outlineInputBorder,
                      contentPadding: FxSpacing.only(top: 12),
                      hintStyle: FxTextStyle.bodyMedium(),
                      isCollapsed: true),
                  maxLines: 1,
                  controller: controller.registershopnameController,

                  ),
                ),
                FxSpacing.height(10),
                RequiredFormTitle(
                    'Mob/Phn Num', fontSize: 15,
                    fontWeight: FontWeight.w500),
                FxSpacing.height(5),
                Row(
                  children: [
                    Container(
                      width: 85,
                      height: Get.height*0.055,
                      child: TextFormField(
                        textAlign:TextAlign.center,
                        onTap: (){
                          showCountryPicker(
                            context: context,
                            favorite: <String>['BD'],
                            showPhoneCode: true,
                            onSelect: (Country country)
                            {
                              String temp="+";
                              temp+=country.phoneCode.toString();
                              controller.setCountry(temp);
                              controller.registermobilecodeController.text=temp;

                            },
                            countryListTheme: CountryListThemeData(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40.0),
                                topRight: Radius.circular(40.0),
                              ),
                              // Optional. Styles the search field.
                              inputDecoration: InputDecoration(
                                labelText: 'Search',
                                hintText: 'Start typing to search',
                                prefixIcon:  Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: const Color(0xFF8C98A8).withOpacity(0.2),
                                  ),
                                ),
                              ),
                              // Optional. Styles the text in the search field
                              searchTextStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          );
                        },
                        readOnly: true,
                        style: FxTextStyle.bodyMedium(),
                        decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            filled: true,
                            isDense: true,
                            fillColor: theme.cardTheme.color,
                            hintText: "+880",
                            enabledBorder: outlineInputBorder,
                            focusedBorder: outlineInputBorder,
                            border: outlineInputBorder,
                            contentPadding: FxSpacing.all(12),
                            hintStyle: FxTextStyle.bodyMedium(),
                           isCollapsed: true),
                            maxLines: 1,
                        controller: controller.registermobilecodeController,

                      ),
                    ),
                    SizedBox(
                      width: Get.width*0.01,
                    ),
                    Container(
                      height: Get.height*0.055,
                      width: Get.width*0.64,
                      child: TextFormField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                        ],
                        textInputAction: TextInputAction.next,
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
                              color: theme.colorScheme.onBackground,
                            ),
                            hintText: "Mobile Number",
                            enabledBorder: outlineInputBorder,
                            focusedBorder: outlineInputBorder,
                            border: outlineInputBorder,
                            contentPadding: FxSpacing.only(top: 12),
                            hintStyle: FxTextStyle.bodyMedium(),
                            isCollapsed: true),
                        maxLines: 1,
                        controller: controller.registermobileController,

                      ),
                    ),


                  ],
                ),
                FxSpacing.height(10),
                Padding(
                  padding: const EdgeInsets.only(right: 215.0),
                  child: Text(
                      'Email Address',style: TextStyle(fontSize: 15,
                      fontWeight: FontWeight.w500)),
                ),
                FxSpacing.height(5),
                Container(
                  height: Get.height*0.055,
                  child: TextFormField(
                      textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    style: FxTextStyle.bodyMedium(),
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        isDense: true,
                        fillColor: theme.cardTheme.color,
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: theme.colorScheme.onBackground,
                        ),
                        hintText: "Email Address",
                        enabledBorder: outlineInputBorder,
                        focusedBorder: outlineInputBorder,
                        border: outlineInputBorder,
                        contentPadding: FxSpacing.only(top: 12),
                        hintStyle: FxTextStyle.bodyMedium(),
                        isCollapsed: true),
                    maxLines: 1,
                    controller: controller.registeremailController,

                  ),
                ),
                FxSpacing.height(10),
                Padding(
                  padding: const EdgeInsets.only(right: 255.0),
                  child: Text('Address',style: TextStyle(fontSize: 15,
                      fontWeight: FontWeight.w500)),
                ),
                FxSpacing.height(5),
                CupertinoTextField(
                  controller: controller.registeraddressController,
                  textInputAction: TextInputAction.done,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: theme.colorScheme.background,
                      border: Border.all(color: Colors.grey,)),
                  cursorColor: Colors.black,
                  placeholder: "Write your address here",
                  placeholderStyle: TextStyle(color: theme.colorScheme.onBackground.withAlpha(160),fontSize: 16),
                  minLines: 4,
                  maxLines: 6,
                  style: TextStyle(color: theme.colorScheme.onBackground),
                  padding: FxSpacing.xy(8, 1),
                ),

              ],
            ),
          FxSpacing.height(20),
          FxButton.block(
            elevation: 0,
            borderRadiusAll: 5,
            onPressed: ()
            {
              Flushbar(
                backgroundColor: Colors.white,
                flushbarPosition:FlushbarPosition.BOTTOM,
                duration: Duration(seconds: 10),
                messageText: Obx(()=>
                    singleActivityWidget(
                        subtitle:"3. ${controller.subtitle.value}" ,
                        color: Colors.red.shade200,
                        iconData: MdiIcons.run,
                        title:"1. ${controller.title.value}",
                        description: "2. ${controller.description.value}"),
                ),
                isDismissible: true,
                dismissDirection: FlushbarDismissDirection.VERTICAL,
              ).show(context);
         /*     if(controller.registershopnameController.text.isEmptyOrNull)
              {
                controller.title.value="Shop name can't be empty or null";
                controller.description.value="Combinations of numbers and characters";
                controller.subtitle.value="First letter will be capital e.g Pull";
                return;

              }
              if(!isPhoneNoValid(controller.registermobileController.text.toString()))
              {
                controller.title.value="Mobile number can't be empty or null";
                controller.description.value="At least 10 digits needed e.g 1832234265";
                controller.subtitle.value="Enter a valid mobile number";
                return;

              }
              if(!is_validemail(controller.registeremailController.text.toString()))
              {
                controller.title.value="Email can't be null";
                controller.description.value="Enter a valid email e.g something@gmail.com";
                controller.subtitle.value="Must Include @ sign";
                return;

              }*/
              Get.toNamed(AppPages.getTermsandConditionPageRoute());


           /*  if(controller.registershopnameController.text.isEmptyOrNull)
               {
                 controller.setshopnametooltip(true);
                 return;
               }
             if(controller.registermobileController.text.isEmptyOrNull)
               {
                 controller.setmobiletooltip(true);
                 return;
               }
             if(!isPhoneNoValid(controller.registermobileController.text))
               {

                 return;
               }
             if(!is_validemail(controller.registeremailController.text)&&!controller.registeremailController.text.isEmptyOrNull)
               {
                 return;
               }*/

          /*   if(controller.registeremailController.text.isEmptyOrNull)
               {
                 Get.toNamed(AppPages.getTermsandConditionPageRoute());

               }*/
             controller.registershopnameController.text="";
             controller.registermobileController.text="";
             controller.registeremailController.text="";



            },
            splashColor: theme.colorScheme.onPrimary.withAlpha(30),
            backgroundColor: customTheme.buttonColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FxText.labelLarge(
                  "Create Account",
                  fontWeight: 500,
                  color: Colors.black,
                  letterSpacing: 0.4,
                ),
                FxSpacing.width(8),

              ],
            ),
          ),
          FxSpacing.height(20),
          Row(
            children: [
              Expanded(child: Divider()),
              Padding(
                padding: FxSpacing.x(20),
                child: FxText.bodySmall(
                  'Continue with',
                  muted: true,
                  fontWeight: 600,
                  fontSize: 10,
                ),
              ),
              Expanded(child: Divider()),
            ],
          ),
          FxSpacing.height(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FxContainer.bordered(
                padding: FxSpacing.all(16),
                borderRadiusAll: 8,
                child: Image(
                  height: 24,
                  width: 24,
                  image: AssetImage(Images.google),
                ),
              ),
              FxContainer.bordered(
                padding: FxSpacing.all(16),
                borderRadiusAll: 8,
                child: Image(
                  height: 24,
                  width: 24,
                  image: AssetImage(Images.apple),
                ),
              ),
              FxContainer.bordered(
                padding: FxSpacing.all(16),
                borderRadiusAll: 8,
                child: Image(
                  height: 24,
                  width: 24,
                  image: AssetImage(Images.facebook),
                ),
              ),
            ],
          ),
          FxSpacing.height(20),
          Center(
            child: FxButton.text(
              backgroundColor: customTheme.buttonColor,
              onPressed: () {

                Get.offNamed(AppPages.getLogInRoute());

              },
              splashColor: customTheme.buttonColor,
              child: FxText.labelLarge("I have an Account",
                  decoration: TextDecoration.underline,
                  color: Colors.black
              ),
            ),
          ),



            ]
          ),


      );

  }

 bool is_validemail(String email)
 {
   final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
   return emailValid? true:false;
 }


  bool isPhoneNoValid(String? phoneNo) {
    if (phoneNo == null) return false;
    final regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    return regExp.hasMatch(phoneNo);
  }

}
/*
class TargetWidget extends StatefulWidget {
  const TargetWidget({Key? key}) : super(key: key);

  @override
  _TargetWidgetState createState() => new _TargetWidgetState();
}

class _TargetWidgetState extends State<TargetWidget> {
  SuperTooltip? tooltip;
  CustomTheme customTheme=CustomTheme();
  Future<bool> _willPopCallback() async {
    // If the tooltip is open we don't pop the page on a backbutton press
    // but close the ToolTip
    if (tooltip!.isOpen) {
      tooltip!.close();
      return false;
    }
    return true;
  }

  void onTap(String s) {
    if (tooltip != null && tooltip!.isOpen) {
      tooltip!.close();
      return;
    }

    var renderBox = context.findRenderObject() as RenderBox;
    final overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox?;

    var targetGlobalCenter = renderBox.localToGlobal(renderBox.size.center(Offset.zero), ancestor: overlay);

    // We create the tooltip on the first use
    tooltip = // We create the tooltip on the first use
    tooltip = SuperTooltip(
      popupDirection: TooltipDirection.down,
      borderColor: customTheme.appbarColor,
      borderWidth: 1,
      hasShadow: false,
      content: new Material(
          child: Text(
            "Lorem ipsum dolor sit amet, consetetur sadipscingelitr, "
                "sed diam nonumy eirmod tempor invidunt ut laboreet dolore magna aliquyam erat, "
                "sed diam voluptua. At vero eos et accusam et justoduo dolores et ea rebum. ",
            softWrap: true,
          )),

    );

    tooltip!.show(context);
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _willPopCallback,
      child: new GestureDetector(
        onTap: (){},
        child: TextFormField(
          onChanged: onTap,
          onTap: (){
            toast("Hello");
            var renderBox = context.findRenderObject() as RenderBox;
            final overlay = Overlay.of(context)!.context.findRenderObject() as RenderBox?;

            var targetGlobalCenter = renderBox.localToGlobal(renderBox.size.center(Offset.zero), ancestor: overlay);

            // We create the tooltip on the first use
            tooltip = // We create the tooltip on the first use
            tooltip = SuperTooltip(


              popupDirection: TooltipDirection.down,
              borderColor: customTheme.appbarColor,
              borderWidth: 1,
              hasShadow: false,
              content:  Material(
                  child: Text(
                    "Lorem lkfjgjgpjerpgjoerpgojerpjepojgrojgepjgepjeprjgeporgjeprjgerpogjerpojgs",
                    softWrap: true,
                  )),

            );


            tooltip!.show(context);
          },
        )),
    );
  }
}*/
