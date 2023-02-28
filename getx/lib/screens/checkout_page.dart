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
import '../utils/custom_widget/app_bar.dart';
import '../utils/custom_widget/custom_appbar.dart';
import '../utils/custom_widget/forms.dart';
import '../utils/images.dart';
import 'dashboard_page.dart';


class CheckoutPage extends GetView<HomeController> {
  @override
  ThemeData theme = AppTheme.theme;
  CustomTheme customTheme = AppTheme.customTheme;
  List<String> _simpleChoice = ["Add new","Update"];


  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(
      color: Colors.transparent,
    ),
  );

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title:"Checkout",height: 55,),
        body:Obx(() =>  ListView(
            padding: FxSpacing.fromLTRB(20, 20, 20, 20),
          children:[
            FxText.bodyMedium("Payment Method",
                fontWeight: 600, letterSpacing: 0),
            FxSpacing.height(24),
            getSinglePayment(
                index: 1,
                method: "Master Card",
                image: 'assets/payment/master-card.png'
            ),
            getSinglePayment(
                index: 2,
                method: "Visa Card",
                image: 'assets/payment/visa-card.png'),
            // Space.height(16),
            getSinglePayment(
                index: 3,
                method: "Paypal",
                image: 'assets/payment/paypal.png'),
            getSinglePayment(
                index: 4,
                method: "Bkash",
                image: 'assets/payment/bkash1.jpg'),
            getSinglePayment(
                index: 5,
                method: "Nagad",
                image: 'assets/payment/nagad.png'),
          Container(
            width: Get.width*1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FxText.bodyMedium("Total", fontWeight: 700),
                    FxText.bodyMedium("\$278.00",
                        letterSpacing: 0.25, fontWeight: 700),
                  ],
                ),

              ],
            ),
          ),
      ]
        )
        ),
        bottomNavigationBar:Padding(
          padding: FxSpacing.fromLTRB(20, 20, 20, 20),
          child: FxButton.medium(
            padding: FxSpacing.fromLTRB(10, 10, 10, 10),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardScreen()));
            },
            child: FxText.labelMedium(
              "PROCEED TO PAY",
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



  Widget getSinglePayment(
      {int? index, required String image, required String method}) {
    controller.ispaymentmethodTabbed.value = index == controller.selectedPayment.value;
    return FxContainer(
      margin: FxSpacing.bottom(16),
      padding: FxSpacing.all(16),
      bordered: controller.ispaymentmethodTabbed.value,
      border: Border.all(color: customTheme.border),
      color: controller.ispaymentmethodTabbed.value ?  customTheme.buttonColor : theme.scaffoldBackgroundColor,
      borderRadiusAll: 5,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 36,
            child: Image.asset(
              image,
            ),
          ),
          FxSpacing.width(16),
          Expanded(
            child: InkWell(
              onTap: (){
                if(controller.selectedPayment.value==1)
                {
                  // toast(controller.selectedPayment.value.toString());
                  //Get.toNamed(AppPages.getInvoicePageRoute());
                }

                controller.setPaymentMethodTabbed(true);
                controller.setPaymentMethod(index);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.bodyMedium(method, fontWeight: 600),
                  FxSpacing.height(8),
                  FxText.labelSmall(
                      "8765  \u2022\u2022\u2022\u2022  \u2022\u2022\u2022\u2022  7983",
                      muted: true,
                      letterSpacing: 0)
                ],
              ),
            ),
          ),
          // isSelected ? Space.width(16) : Space.width(20),
          PopupMenuButton(
            onSelected: (value){
              if(value=="Add new")
                {
                  Get.toNamed(AppPages.getFormsPageRoute());
                }
            },
            itemBuilder: (BuildContext context) {
              return _simpleChoice.map((String choice) {
                return PopupMenuItem(
                  value: choice,
                  child: FxText.bodyMedium(choice),
                );
              }).toList();
            },
            color: customTheme.card,
            child: Icon(
              MdiIcons.dotsVertical,
              color: theme.colorScheme.onBackground,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}