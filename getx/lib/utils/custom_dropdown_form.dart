
import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:getx/screens/setting.dart';
import 'package:getx/utils/custom_widget/required_field.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../controllers/home_controller.dart';
import '../routes/app_pages.dart';
import '../screens/notifications.dart';
import '../utils/app_theme.dart';
import '../utils/colors.dart';
import '../utils/custom_bottom_navigation_bar.dart';
import '../utils/custom_theme.dart';
import '../utils/custom_widget/app_bar.dart';
import '../utils/custom_widget/quick_action_widget.dart';
import '../utils/custom_widget/widgets.dart';
import '../utils/images.dart';


class DropDownScreen extends GetView<HomeController>
{

  List<TextIconItem> _textIconChoice = [
    TextIconItem("Add File", Icons.add),
    TextIconItem("Add Product", Icons.production_quantity_limits),
    TextIconItem("Add Customer", Icons.people),

  ];
  CustomTheme customTheme = AppTheme.customTheme;
  ThemeData theme = AppTheme.theme;
  String? _chosenValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      endDrawer: endDrawer(context),
      appBar:AppBar(
        centerTitle: true,
        backgroundColor:customTheme.appbarColor,
        title: FxText.titleMedium("CustomDropDown".toUpperCase(), fontWeight: 500,color: Colors.white,),
        leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: Icon( FeatherIcons.chevronLeft)
        ),

        actions: <Widget>[
          PopupMenuButton(
            onSelected: (value) async {
              if(value=="Add File")
              {


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
      body: Obx(() => Padding(
        padding: FxSpacing.fromLTRB(20, 20, 20, 0),
        child: ListView(
          //physics: NeverScrollableScrollPhysics(),
          children: [
            FxText.displaySmall(
              fontSize: 20,
              fontWeight: 600,
              'Add New Product',
              textAlign: TextAlign.center,
            ),
            FxText.bodySmall(
              'The quick brown fox jumps over the lazy dog',
              muted: true,
              textAlign: TextAlign.center,
            ),
            20.height,
            FxText.bodyLarge("Product information",
              fontWeight: 600, letterSpacing: 0,color: customTheme.appbarColor,),
            Divider(color: customTheme.buttonColor,height: 5,thickness: 1,),
            10.height,
            RequiredFormTitle(
                'Name', fontSize: 15,
                fontWeight: FontWeight.w500),
            5.height,
            Container(
              height: Get.height*0.055,
              child: TextFormField(
                textInputAction: TextInputAction.next,
                controller: controller.salesNameController,
                style: FxTextStyle.titleMedium(
                    letterSpacing: 0,
                    color: Colors.black87,
                    fontWeight: 500),
                decoration: InputDecoration(
                  labelStyle: FxTextStyle.titleSmall(textStyle: TextStyle(fontWeight: FontWeight.bold),
                      letterSpacing: 0,
                      color: Colors.black,
                      fontWeight: 700),
                  hintText: "Name",
                  hintStyle: FxTextStyle.titleSmall(
                      letterSpacing: 0,
                      color: Colors.black,
                      fontWeight: 700),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      borderSide:BorderSide(
                          width: 5, color: Colors.red)
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
                  prefixIcon: Icon(color: Colors.grey,
                    Icons.account_circle,
                    size: 22,
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.all(0),
                ),
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
            10.height,
            RequiredFormTitle(
                'Category', fontSize: 15,
                fontWeight: FontWeight.w500),
            5.height,
            Container(
              height: Get.height*0.055,
              width: 500,
              decoration: BoxDecoration(
                color:  customTheme.card,
                border: Border.all(color: Colors.grey,),  // Set border width
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Container(
                      child: DropDownWithoutSearch(controller.tempList.value.map((cat) => cat).toList().cast<String>(),
                          'Choose a category ',
                              (value) {
                            controller.setCategory(value);
                          },
                          value: controller.selectedCategory.value),
                    ),
                    Icon(Icons.add)
                  ],
                ),
              ),
            ),
            10.height,
            RequiredFormTitle(
                'Brand', fontSize: 15,
                fontWeight: FontWeight.w500),
            5.height,
            Container(
              height: Get.height*0.055,
              width: 500,
              decoration: BoxDecoration(
                color:  customTheme.card,
                border: Border.all(color: Colors.grey,),  // Set border width
                borderRadius: BorderRadius.all(Radius.circular(5.0)),),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  width: Get.width*0.30,
                  decoration: BoxDecoration(
                    borderRadius: radius(4),
                  ),
                  child: DropDownWithoutSearch(controller.tempList.value.map((cat) => cat).toList().cast<String>(),
                      'Choose a category ',
                          (value) {
                        controller.setCategory(value);
                      },
                      value: controller.selectedCategory.value),
                ),
              ),
            ),
            10.height,
            RequiredFormTitle(
                'Unit', fontSize: 15,
                fontWeight: FontWeight.w500),
            5.height,
            Container(
              height: Get.height*0.055,
              width: 500,
              decoration: BoxDecoration(
                color:  customTheme.card,
                border: Border.all(color: Colors.grey,),  // Set border width
                borderRadius: BorderRadius.all(Radius.circular(5.0)),),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  width: Get.width*0.30,
                  decoration: BoxDecoration(
                    borderRadius: radius(4),
                  ),
                  child: DropDownWithoutSearch(controller.tempList.value.map((cat) => cat).toList().cast<String>(),
                      'Choose a category ',
                          (value) {
                        controller.setCategory(value);
                      },
                      value: controller.selectedCategory.value),
                ),
              ),
            ),


         /*  Container(
             child: DropDownMultiSelect(
               onChanged: (List<String> x) {
                 setState(() {
                   selected =x;
                 });
               },
               options: ['a' , 'b' , 'c' , 'd'],
               selectedValues: selected,
               whenEmpty: 'Select Something',
             ),
           ),*/





            20.height,
            FxText.bodyLarge("Price information",
              fontWeight: 600, letterSpacing: 0,color: customTheme.appbarColor,),
            Divider(color: customTheme.buttonColor,height: 5,thickness: 1,),
            10.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RequiredFormTitle(
                        'Purchase Price', fontSize: 15,
                        fontWeight: FontWeight.w500),
                    5.height,
                    Container(
                      height: Get.height*0.055,
                      width: Get.width*0.439,
                      child: TextFormField(

                        textInputAction: TextInputAction.next,
                        controller: controller.purchasePriceController,
                        style: FxTextStyle.titleMedium(
                            letterSpacing: 0,
                            color: Colors.black87,
                            fontWeight: 500),
                        decoration: InputDecoration(
                          labelStyle: FxTextStyle.titleSmall(textStyle: TextStyle(fontWeight: FontWeight.bold),
                              letterSpacing: 0,
                              color: Colors.black,
                              fontWeight: 700),
                          hintText: "Purchase Price",
                          hintStyle: FxTextStyle.titleSmall(
                              letterSpacing: 0,
                              color: Colors.black,
                              fontWeight: 700),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              borderSide:BorderSide(
                                  width: 5, color: Colors.red)
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
                          prefixIcon: Icon(color: Colors.grey,
                            MdiIcons.emailOutline,
                            size: 22,
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.all(0),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp('^[0-9]*\\.?[0-9]*'))

                        ],
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),


                  ],
                ),
                3.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RequiredFormTitle(
                        'Sales Price', fontSize: 15,
                        fontWeight: FontWeight.w500),
                    5.height,
                    Container(
                      height: Get.height*0.055,
                      width: Get.width*0.439,
                      child: TextFormField(

                        textInputAction: TextInputAction.next,
                        controller: controller.salesPriceController,
                        style: FxTextStyle.titleMedium(
                            letterSpacing: 0,
                            color: Colors.black87,
                            fontWeight: 500),
                        decoration: InputDecoration(
                          labelStyle: FxTextStyle.titleSmall(textStyle: TextStyle(fontWeight: FontWeight.bold),
                              letterSpacing: 0,
                              color: Colors.black,
                              fontWeight: 700),
                          hintText: "Sales Price",
                          hintStyle: FxTextStyle.titleSmall(
                              letterSpacing: 0,
                              color: Colors.black,
                              fontWeight: 700),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              borderSide:BorderSide(
                                  width: 5, color: Colors.red)
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
                          prefixIcon: Icon(color: Colors.grey,
                            MdiIcons.emailOutline,
                            size: 22,
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.all(0),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp('^[0-9]*\\.?[0-9]*'))
                        ],

                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                  ],
                )




              ],
            ),

            10.height,
            RequiredFormTitle(
                'Discount Price', fontSize: 15,
                fontWeight: FontWeight.w500),
            5.height,
            Row(
              children: [
                Container(
                  height: Get.height*0.055,
                  width: Get.width*0.45,
                  child: TextFormField(

                    textInputAction: TextInputAction.next,
                    controller: controller.discountPriceController,
                    style: FxTextStyle.titleMedium(
                        letterSpacing: 0,
                        color: Colors.black87,
                        fontWeight: 500),
                    decoration: InputDecoration(
                      labelStyle: FxTextStyle.titleSmall(textStyle: TextStyle(fontWeight: FontWeight.bold),
                          letterSpacing: 0,
                          color: Colors.black,
                          fontWeight: 700),
                      hintText: "Discount Price",
                      hintStyle: FxTextStyle.titleSmall(
                          letterSpacing: 0,
                          color: Colors.black,
                          fontWeight: 700),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          borderSide:BorderSide(
                              width: 5, color: Colors.red)
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
                      prefixIcon: Icon(color: Colors.grey,
                        MdiIcons.emailOutline,
                        size: 22,
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.all(0),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp('^[0-9]*\\.?[0-9]*'))
                    ],
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),

              ],
            ),
            10.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RequiredFormTitle(
                        'Minimum QTY', fontSize: 15,
                        fontWeight: FontWeight.w500),
                    5.height,
                    Container(
                      height: Get.height*0.055,
                      width: Get.width*0.439,
                      child: TextFormField(

                        textInputAction: TextInputAction.next,
                        style: FxTextStyle.titleMedium(
                            letterSpacing: 0,
                            color: Colors.black87,
                            fontWeight: 500),
                        decoration: InputDecoration(
                          labelStyle: FxTextStyle.titleSmall(textStyle: TextStyle(fontWeight: FontWeight.bold),
                              letterSpacing: 0,
                              color: Colors.black,
                              fontWeight: 700),
                          hintText: "Minimum QTY",
                          hintStyle: FxTextStyle.titleSmall(
                              letterSpacing: 0,
                              color: Colors.black,
                              fontWeight: 700),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              borderSide:BorderSide(
                                  width: 5, color: Colors.red)
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
                          prefixIcon: Icon(color: Colors.grey,
                            MdiIcons.emailOutline,
                            size: 22,
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.all(0),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp('^[0-9]*\\.?[0-9]*'))
                        ],
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),


                  ],
                ),
                3.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RequiredFormTitle(
                        'Opening QTY', fontSize: 15,
                        fontWeight: FontWeight.w500),
                    5.height,
                    Container(
                      height: Get.height*0.055,
                      width: Get.width*0.439,
                      child: TextFormField(


                        textInputAction: TextInputAction.next,
                        style: FxTextStyle.titleMedium(
                            letterSpacing: 0,
                            color: Colors.black87,
                            fontWeight: 500),
                        decoration: InputDecoration(
                          labelStyle: FxTextStyle.titleSmall(textStyle: TextStyle(fontWeight: FontWeight.bold),
                              letterSpacing: 0,
                              color: Colors.black,
                              fontWeight: 700),
                          hintText: "Opening QTY",
                          hintStyle: FxTextStyle.titleSmall(
                              letterSpacing: 0,
                              color: Colors.black,
                              fontWeight: 700),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              borderSide:BorderSide(
                                  width: 5, color: Colors.red)
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
                          prefixIcon: Icon(color: Colors.grey,
                            MdiIcons.emailOutline,
                            size: 22,
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.all(0),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp('^[0-9]*\\.?[0-9]*'))
                        ],
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                  ],
                )
              ],
            ),

            20.height,
            FxText.bodyLarge("Description",
              fontWeight: 600, letterSpacing: 0,color: customTheme.appbarColor,),
            Divider(color: customTheme.buttonColor,height: 5,thickness: 1,),
            10.height,
            Container(
              child: CupertinoTextField(
                textInputAction: TextInputAction.done,
                decoration: BoxDecoration(  borderRadius: BorderRadius.circular(5), color: theme.colorScheme.background,
                    border: Border.all(color: Colors.grey,)),
                cursorColor: Colors.black,
                placeholder: "Descriptions",
                placeholderStyle: TextStyle(color: theme.colorScheme.onBackground.withAlpha(160),fontSize: 16),
                minLines: 4,
                maxLines: 6,
                style: TextStyle(color: theme.colorScheme.onBackground),
                padding: FxSpacing.xy(8, 1),
              ),
            ),
            10.height,
            Container(
              child:Text(controller.image.value.path) ,
            ),
            10.height,
            FxButton.block(
              backgroundColor: customTheme.appbarColor,
              elevation: 0,
              borderRadiusAll: 5,
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['xlsx','csv'],
                );
                if (result != null) {
                  PlatformFile file = result.files.first;
                  controller.setImageVisible(true);
                  controller.image.value = File(file.path.toString());
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxText.bodyMedium("Add Excel File",
                      fontWeight: 500, color: Colors.white, letterSpacing: 0.5),
                ],
              ),
            ),



          ],
        ),
        /*ListView(
          children: [
            RequiredFormTitle(
                'Name', fontSize: 15,
                fontWeight: FontWeight.w500),

            Container(
              height: Get.height*0.055,
              width: 500,
              decoration: BoxDecoration(
                color:  customTheme.card,
                border: Border.all(color: Colors.grey,),  // Set border width
                borderRadius: BorderRadius.all(Radius.circular(5.0)),),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  width: Get.width*0.30,
                  decoration: BoxDecoration(
                    borderRadius: radius(4),
                  ),
                  child: DropDownWithoutSearch(controller.tempList.value.map((cat) => cat).toList().cast<String>(),
                      'Choose a category ',
                          (value) {
                        controller.setCategory(value);
                      },
                      value: controller.selectedCategory.value),
                ),
              ),
            ),
         10.height,
            Container(
              height: Get.height*0.055,
              width: 500,
              decoration: BoxDecoration(
                color:  customTheme.card,
                border: Border.all(color: Colors.grey,),  // Set border width
                borderRadius: BorderRadius.all(Radius.circular(5.0)),),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      width: Get.width*0.40,
                      child: DropDownWithoutSearch(controller.tempList.value.map((cat) => cat).toList().cast<String>(),
                          'Choose an unit',
                           (value) {
                            controller.setUnit(value);
                          },
                          value: controller.selectedUnit.value),
                    ),
                  ),
                  Text("|",style: TextStyle(color: customTheme.appbarColor),),

                  InkWell(
                    onTap: (){
                      controller.openEndDrawer();

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Icon(Icons.add,color: Colors.black,),
                      ),
                    ),
                  ),


                ],
              ),
            ),

         *//*   Container(
              height: Get.height*0.055,
              width: 400,
              decoration: BoxDecoration(
                color:  customTheme.card,
                border: Border.all(color: Colors.grey,),  // Set border width
                borderRadius: BorderRadius.all(Radius.circular(5.0)),),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  width: Get.width*0.30,
                  decoration: BoxDecoration(
                    borderRadius: radius(4),
                  ),
                  child: CustomSearch(controller.tempList.value.map((cat) => cat).toList().cast<String>(), 'Choose a category ',

                ),
              ),
            ),
            ),*//*
            10.height,
            Container(
              child:Text(controller.image.value.path) ,
            ),
            10.height,
            FxButton.block(
              backgroundColor: customTheme.appbarColor,
              elevation: 0,
              borderRadiusAll: 5,
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['xlsx','csv'],
                );
                if (result != null) {
                  PlatformFile file = result.files.first;
                  controller.setImageVisible(true);
                  controller.image.value = File(file.path.toString());
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxText.bodyMedium("Add Excel File",
                      fontWeight: 500, color: Colors.white, letterSpacing: 0.5),
                ],
              ),
            ),




          ],
        ),*/
      ),
      ),
      bottomNavigationBar:
      Container(
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
                  FxText.bodyMedium("BACK",
                      fontWeight: 500, color: Colors.white, letterSpacing: 0.5),
                ],
              ),
            ),
            FxButton.block(
              backgroundColor: customTheme.buttonColor,
              elevation: 0,
              borderRadiusAll: 5,
              onPressed: () {
                if (controller.currentIndex == 1) {
                  Flushbar(
                    backgroundColor: Colors.white,
                    flushbarPosition: FlushbarPosition.BOTTOM,
                    duration: Duration(seconds: 3),
                    messageText: Obx(() =>
                        singleActivityWidget(
                            subtitle: "3. ${controller.subtitle.value}",
                            color: Colors.red.shade200,
                            iconData: MdiIcons.run,
                            title: "1. ${controller.title.value}",
                            description: "2. ${controller.description
                                .value}"),
                    ),
                    isDismissible: true,
                    dismissDirection: FlushbarDismissDirection.VERTICAL,
                  ).show(context);
                  if (controller.salesNameController.text.isEmptyOrNull) {
                    controller.title.value =
                    "Shop name can't be empty or null";
                    controller.description.value =
                    "Combinations of numbers and characters";
                    controller.subtitle.value =
                    "First letter will be capital e.g Pull";
                    return;
                  }
                  if (controller.selectedCategory.value.isEmptyOrNull) {
                    controller.title.value = "Please select a category";
                    controller.description.value = "Category can't be null";
                    controller.subtitle.value =
                    "Only one category can be selected";
                    return;
                  }
                  if (controller.selectedBrand.value.isEmptyOrNull) {
                    controller.title.value = "Please select a brand";
                    controller.description.value = "Brand can't be null";
                    controller.subtitle.value =
                    "Only one brand can be selected";

                    return;
                  }
                  if (controller.selectedUnit.value.isEmptyOrNull) {
                    controller.title.value = "Please select a unit";
                    controller.description.value = "Unit can't be null";
                    controller.subtitle.value =
                    "Only one unit can be selected";
                    return;
                  }
                  if (controller.purchasePriceController.text
                      .isEmptyOrNull) {
                    controller.title.value =
                    "Purchase price can't be empty or null";
                    controller.description.value = "Value can be float";
                    controller.subtitle.value = "No characters";

                    return;
                  }
                  if (controller.salesPriceController.text.isEmptyOrNull) {
                    controller.title.value =
                    "Sales price can't be empty or null";
                    controller.description.value = "Value can be float";
                    controller.subtitle.value = "No characters";

                    return;
                  }
                  if (controller.discountPriceController.text
                      .isEmptyOrNull) {
                    controller.title.value =
                    "Discount price can't be empty or null";
                    controller.description.value = "Value can be float";
                    controller.subtitle.value = "No characters";
                    return;
                  }
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FxText.bodyMedium("ADD PRODUCT",
                      fontWeight: 500, color: Colors.black, letterSpacing: 0.5),

                ],
              ),
            ),
          ],
        ),
      ),
      /*BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        backgroundColor: Colors.white,
        selectedIconTheme: IconThemeData(color: theme.primaryColor),
        selectedItemColor: theme.primaryColor,
        unselectedIconTheme: IconThemeData(color: theme.colorScheme.onBackground),
        unselectedItemColor: theme.colorScheme.onBackground,
        onTap: (value) async {
          controller.setCurrentIndex(value);
          if(controller.currentIndex==0)
            {
              Get.back();
            }
          if(controller.currentIndex==1)
            {

             Flushbar(
               backgroundColor: Colors.white,
               flushbarPosition:FlushbarPosition.BOTTOM,
               duration: Duration(seconds: 3),
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
             if(controller.salesNameController.text.isEmptyOrNull)
             {
               controller.title.value="Shop name can't be empty or null";
               controller.description.value="Combinations of numbers and characters";
               controller.subtitle.value="First letter will be capital e.g Pull";
               return;

             }
             if(controller.selectedCategory.value.isEmptyOrNull)
             {
               controller.title.value="Please select a category";
               controller.description.value="Category can't be null";
               controller.subtitle.value="Only one category can be selected";
               return;
             }
             if(controller.selectedBrand.value.isEmptyOrNull)
             {
               controller.title.value="Please select a brand";
               controller.description.value="Brand can't be null";
               controller.subtitle.value="Only one brand can be selected";
               return;
             }
             if(controller.selectedUnit.value.isEmptyOrNull)
             {
               controller.title.value="Please select a unit";
               controller.description.value="Unit can't be null";
               controller.subtitle.value="Only one unit can be selected";
               return;
             }
             if(controller.purchasePriceController.text.isEmptyOrNull)
             {
               controller.title.value="Purchase price can't be empty or null";
               controller.description.value="Value can be float";
               controller.subtitle.value="No characters";
               return;
             }
             if(controller.salesPriceController.text.isEmptyOrNull)
             {
               controller.title.value="Sales price can't be empty or null";
               controller.description.value="Value can be float";
               controller.subtitle.value="No characters";
               return;
             }
             if(controller.discountPriceController.text.isEmptyOrNull)
             {
               controller.title.value="Discount price can't be empty or null";
               controller.description.value="Value can be float";
               controller.subtitle.value="No characters";
               return;
             }
            }
          if(controller.currentIndex==2)
          {
          }

        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.arrow_back_outlined), label: 'Back'),
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits),
            label: 'Add Product',
            backgroundColor: Colors.white,
          ),



        ],
      ),*/

    );

  }
  Widget endDrawer(BuildContext context) {
    return Container(
      margin: FxSpacing.fromLTRB(10,5, 10, 20),
      width: Get.width*1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: customTheme.appbarColor,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: Get.height*0.08,
              padding: EdgeInsets.only(left: 8,right: 8),
              color: customTheme.appbarColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: FxText(
                      "Something",
                      fontWeight: 700,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                  FxContainer.rounded(
                      onTap: () {
                        controller.closeEndDrawer();
                      },
                      paddingAll: 6,
                      color: theme.colorScheme.onPrimary.withAlpha(80),
                      child: Icon(
                        FeatherIcons.x,
                        size: 12,
                        color: theme.colorScheme.onPrimary,
                      )
                  )
                ],
              ),
            ),
            10.height,
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8),
              child: Container(
                height: Get.height*0.749,
                child: ListView(
                  //physics: NeverScrollableScrollPhysics(),
                  children: [
                    /*    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius:50 ,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(Images.logo3),
                      ),
                    ),*/
                    Obx(() =>  Center(
                      child: Stack(
                        children: [
                          InkWell(
                            onTap: () async {
                              FilePickerResult? result = await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['jpg','png'],
                              );
                              if (result != null) {
                                PlatformFile file = result.files.first;
                                controller.setImageVisible(true);
                                controller.image.value = File(file.path.toString());
                              }

                            },
                            child: CircleAvatar(
                                radius: 60,
                                backgroundImage: controller.isImageVisible.value?FileImage(controller.image.value):AssetImage(Images.no_image) as ImageProvider
                            ),
                          ),
                          Positioned(
                              right: 12,
                              top: 80,
                              child: controller.isImageVisible.value? InkWell(
                                  onTap: (){
                                    controller.isImageVisible.value=false;
                                  },
                                  child: Icon(Icons.cancel,size: 20,color: customTheme.buttonColor,)
                              ):Icon(Icons.add_a_photo,size: 20,color: customTheme.buttonColor,)
                          )

                        ],

                      ),
                    ),
                    ),
                    FxText.displaySmall(
                      fontSize: 20,
                      fontWeight: 600,
                      'Add New Product',
                      textAlign: TextAlign.center,
                    ),
                    FxText.bodySmall(
                      'The quick brown fox jumps over the lazy dog',
                      muted: true,
                      textAlign: TextAlign.center,
                    ),
                    20.height,
                    FxText.bodyLarge("Product information",
                      fontWeight: 600, letterSpacing: 0,color: customTheme.appbarColor,),
                    Divider(color: customTheme.buttonColor,height: 5,thickness: 1,),
                    10.height,
                    RequiredFormTitle(
                        'Name', fontSize: 15,
                        fontWeight: FontWeight.w500),
                    5.height,
                    Container(
                      height: Get.height*0.055,
                      child: TextFormField(
                        textInputAction: TextInputAction.next,

                        style: FxTextStyle.titleMedium(
                            letterSpacing: 0,
                            color: Colors.black87,
                            fontWeight: 500),
                        decoration: InputDecoration(
                          labelStyle: FxTextStyle.titleSmall(textStyle: TextStyle(fontWeight: FontWeight.bold),
                              letterSpacing: 0,
                              color: Colors.black,
                              fontWeight: 700),
                          hintText: "Name",
                          hintStyle: FxTextStyle.titleSmall(
                              letterSpacing: 0,
                              color: Colors.black,
                              fontWeight: 700),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              borderSide:BorderSide(
                                  width: 5, color: Colors.red)
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
                          prefixIcon: Icon(color: Colors.grey,
                            Icons.account_circle,
                            size: 22,
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.all(0),
                        ),
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                    10.height,
                    RequiredFormTitle(
                        'Category', fontSize: 15,
                        fontWeight: FontWeight.w500),
                    5.height,

                    Container(
                      height: Get.height*0.055,
                      decoration: BoxDecoration(
                        color:  customTheme.card,
                        border: Border.all(color: Colors.grey,),  // Set border width
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              width: Get.width*0.80,
                              decoration: BoxDecoration(
                                borderRadius: radius(4),

                              ),
                              child: DropdownButtonSearch(controller.tempList.value.map((cat) => cat).toList().cast<String>(),
                                  'Choose a category ',
                                  'Choose a category name', (value) {
                                    controller.setCategory(value);
                                  },
                                  value: controller.selectedCategory.value),
                            ),
                          ),

                        ],
                      ),
                    ),
                    10.height,
                    RequiredFormTitle(
                        'Brand', fontSize: 15,
                        fontWeight: FontWeight.w500),
                    5.height,
                    Container(
                      height: Get.height*0.055,
                      decoration: BoxDecoration(
                        color:  customTheme.card,
                        border: Border.all(color: Colors.grey,),  // Set border width
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              width: Get.width*0.80,
                              decoration: BoxDecoration(
                                borderRadius: radius(4),

                              ),
                              child: DropdownButtonSearch(controller.tempList.value.map((cat) => cat).toList().cast<String>(),
                                  'Choose a brand name',
                                  'Choose a brand name', (value) {
                                    controller.setBrand(value);
                                  },
                                  value: controller.selectedBrand.value),
                            ),
                          ),



                        ],
                      ),
                    ),
                    10.height,
                    RequiredFormTitle(
                        'Unit', fontSize: 15,
                        fontWeight: FontWeight.w500),
                    5.height,
                    Container(
                      height: Get.height*0.055,
                      decoration: BoxDecoration(
                        color:  customTheme.card,
                        border: Border.all(color: Colors.grey,),  // Set border width
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              width: Get.width*0.80,
                              decoration: BoxDecoration(
                                borderRadius: radius(4),

                              ),
                              child: DropdownButtonSearch(controller.tempList.value.map((cat) => cat).toList().cast<String>(),
                                  'Choose a brand name',
                                  'Choose a brand name', (value) {
                                    controller.setUnit(value);
                                  },
                                  value: controller.selectedUnit.value),
                            ),
                          ),



                        ],
                      ),
                    ),

                    20.height,
                    FxText.bodyLarge("Price information",
                      fontWeight: 600, letterSpacing: 0,color: customTheme.appbarColor,),
                    Divider(color: customTheme.buttonColor,height: 5,thickness: 1,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RequiredFormTitle(
                                'Purchase Price', fontSize: 15,
                                fontWeight: FontWeight.w500),
                            5.height,
                            Container(
                              height: Get.height*0.055,
                              width: Get.width*0.41,
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                style: FxTextStyle.titleMedium(
                                    letterSpacing: 0,
                                    color: Colors.black87,
                                    fontWeight: 500),
                                decoration: InputDecoration(
                                  labelStyle: FxTextStyle.titleSmall(textStyle: TextStyle(fontWeight: FontWeight.bold),
                                      letterSpacing: 0,
                                      color: Colors.black,
                                      fontWeight: 700),
                                  hintText: "Purchase Price",
                                  hintStyle: FxTextStyle.titleSmall(
                                      letterSpacing: 0,
                                      color: Colors.black,
                                      fontWeight: 700),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      borderSide:BorderSide(
                                          width: 5, color: Colors.red)
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
                                  prefixIcon: Icon(color: Colors.grey,
                                    MdiIcons.emailOutline,
                                    size: 22,
                                  ),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(0),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp('^[0-9]*\\.?[0-9]*'))
                                ],
                                textCapitalization: TextCapitalization.sentences,
                              ),
                            ),


                          ],
                        ),
                        3.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RequiredFormTitle(
                                'Sales Price', fontSize: 15,
                                fontWeight: FontWeight.w500),
                            5.height,
                            Container(
                              height: Get.height*0.055,
                              width: Get.width*0.42,
                              child: TextFormField(
                                textInputAction: TextInputAction.next,

                                style: FxTextStyle.titleMedium(
                                    letterSpacing: 0,
                                    color: Colors.black87,
                                    fontWeight: 500),
                                decoration: InputDecoration(
                                  labelStyle: FxTextStyle.titleSmall(textStyle: TextStyle(fontWeight: FontWeight.bold),
                                      letterSpacing: 0,
                                      color: Colors.black,
                                      fontWeight: 700),
                                  hintText: "Sales Price",
                                  hintStyle: FxTextStyle.titleSmall(
                                      letterSpacing: 0,
                                      color: Colors.black,
                                      fontWeight: 700),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      borderSide:BorderSide(
                                          width: 5, color: Colors.red)
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
                                  prefixIcon: Icon(color: Colors.grey,
                                    MdiIcons.emailOutline,
                                    size: 22,
                                  ),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(0),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp('^[0-9]*\\.?[0-9]*'))
                                ],
                                textCapitalization: TextCapitalization.sentences,
                              ),
                            ),
                          ],
                        )




                      ],
                    ),
                    10.height,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RequiredFormTitle(
                            'Discount Price', fontSize: 15,
                            fontWeight: FontWeight.w500),
                        5.height,
                        Container(
                          height: Get.height*0.055,
                          width: Get.width*0.42,
                          child: TextFormField(
                            textInputAction: TextInputAction.next,

                            style: FxTextStyle.titleMedium(
                                letterSpacing: 0,
                                color: Colors.black87,
                                fontWeight: 500),
                            decoration: InputDecoration(
                              labelStyle: FxTextStyle.titleSmall(textStyle: TextStyle(fontWeight: FontWeight.bold),
                                  letterSpacing: 0,
                                  color: Colors.black,
                                  fontWeight: 700),
                              hintText: "Discount Price",
                              hintStyle: FxTextStyle.titleSmall(
                                  letterSpacing: 0,
                                  color: Colors.black,
                                  fontWeight: 700),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  borderSide:BorderSide(
                                      width: 5, color: Colors.red)
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
                              prefixIcon: Icon(color: Colors.grey,
                                MdiIcons.emailOutline,
                                size: 22,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(0),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp('^[0-9]*\\.?[0-9]*'))
                            ],
                            textCapitalization: TextCapitalization.sentences,
                          ),
                        ),
                      ],
                    ),
                    10.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RequiredFormTitle(
                                'Minimum QTY', fontSize: 15,
                                fontWeight: FontWeight.w500),
                            5.height,
                            Container(
                              height: Get.height*0.055,
                              width: Get.width*0.41,
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                style: FxTextStyle.titleMedium(
                                    letterSpacing: 0,
                                    color: Colors.black87,
                                    fontWeight: 500),
                                decoration: InputDecoration(
                                  labelStyle: FxTextStyle.titleSmall(textStyle: TextStyle(fontWeight: FontWeight.bold),
                                      letterSpacing: 0,
                                      color: Colors.black,
                                      fontWeight: 700),
                                  hintText: "Minimum QTY",
                                  hintStyle: FxTextStyle.titleSmall(
                                      letterSpacing: 0,
                                      color: Colors.black,
                                      fontWeight: 700),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      borderSide:BorderSide(
                                          width: 5, color: Colors.red)
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
                                  prefixIcon: Icon(color: Colors.grey,
                                    MdiIcons.emailOutline,
                                    size: 22,
                                  ),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(0),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp('^[0-9]*\\.?[0-9]*'))
                                ],
                                textCapitalization: TextCapitalization.sentences,
                              ),
                            ),


                          ],
                        ),
                        5.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RequiredFormTitle(
                                'Opening', fontSize: 15,
                                fontWeight: FontWeight.w500),
                            5.height,
                            Container(
                              height: Get.height*0.055,
                              width: Get.width*0.42,
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                style: FxTextStyle.titleMedium(
                                    letterSpacing: 0,
                                    color: Colors.black87,
                                    fontWeight: 500),
                                decoration: InputDecoration(
                                  labelStyle: FxTextStyle.titleSmall(textStyle: TextStyle(fontWeight: FontWeight.bold),
                                      letterSpacing: 0,
                                      color: Colors.black,
                                      fontWeight: 700),
                                  hintText: "Opening",
                                  hintStyle: FxTextStyle.titleSmall(
                                      letterSpacing: 0,
                                      color: Colors.black,
                                      fontWeight: 700),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      borderSide:BorderSide(
                                          width: 5, color: Colors.red)
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
                                  prefixIcon: Icon(color: Colors.grey,
                                    MdiIcons.emailOutline,
                                    size: 22,
                                  ),
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(0),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp('^[0-9]*\\.?[0-9]*'))
                                ],
                                textCapitalization: TextCapitalization.sentences,
                              ),
                            ),
                          ],
                        ),




                      ],
                    ),

                    20.height,
                    FxText.bodyLarge("Description",
                      fontWeight: 600, letterSpacing: 0,color: customTheme.appbarColor,),
                    Divider(color: customTheme.buttonColor,height: 5,thickness: 1,),
                    10.height,
                    Container(
                      child: CupertinoTextField(
                        textInputAction: TextInputAction.next,
                        decoration: BoxDecoration(  borderRadius: BorderRadius.circular(5), color: theme.colorScheme.background,
                            border: Border.all(color: Colors.grey,)),
                        cursorColor: Colors.black,
                        placeholder: "Descriptions",
                        placeholderStyle: TextStyle(color: theme.colorScheme.onBackground.withAlpha(160),fontSize: 16),
                        minLines: 4,
                        maxLines: 6,
                        style: TextStyle(color: theme.colorScheme.onBackground),
                        padding: FxSpacing.xy(8, 1),
                      ),
                    ),



                  ],
                ),

              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
              child: Container(
                child: FxContainer.none(
                  onTap: () {
                    controller.closeEndDrawer();
                  },
                  padding: FxSpacing.y(12),
                  child: Center(
                    child: FxText(
                      "Save",
                      color: Colors.black,
                      fontWeight: 600,
                    ),
                  ),
                  color: customTheme.buttonColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}

Future<void> scanQR() async {
  String result = "";

  try {
    //result = await FlutterBarcodeScanner.scanBarcode("#0000ff", "Cancel", false, ScanMode.BARCODE,);
  } catch(e) {
    print("ERROR");
  }


}


