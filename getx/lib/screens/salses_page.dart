
import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
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
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:multiselect/multiselect.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:search_choices/search_choices.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../controllers/home_controller.dart';
import '../routes/app_pages.dart';
import '../utils/app_theme.dart';
import '../utils/colors.dart';
import '../utils/custom_bottom_navigation_bar.dart';
import '../utils/custom_dropdown_form.dart';
import '../utils/custom_theme.dart';
import '../utils/custom_widget/app_bar.dart';
import '../utils/custom_widget/quick_action_widget.dart';
import '../utils/custom_widget/widgets.dart';
import '../utils/images.dart';
import 'notifications.dart';

class SalesScreen extends GetView<HomeController>
{

  List<TextIconItem> _textIconChoice = [
    TextIconItem("Add File", Icons.add),
    TextIconItem("Add Product", Icons.production_quantity_limits),
    TextIconItem("Add Customer", Icons.people),

  ];
  final ImagePicker imagePicker = ImagePicker();
  List _testList = [{'no': 1, 'keyword': 'blue'},{'no': 2, 'keyword': 'black'},{'no': 3, 'keyword': 'red'}];
  List<DropdownMenuItem<String>> _dropdownTestItems = [];
  List<DropdownMenuItem> buildDropdownTestItems(List _testList) {
    List<DropdownMenuItem> items = [];
    for (var i in _testList) {
      items.add(
        DropdownMenuItem(value: i,
          child: Text(i['keyword']),
        ),
      );
    }
    return items;
  }
  List<XFile>? imageFileList = [];
  List<String> selected = [];
  List<String> selected1 = [];
  List<String> selected2 = [];
  CustomTheme customTheme = AppTheme.customTheme;
  ThemeData theme = AppTheme.theme;
  String? _chosenValue;
  int v=1;
  int size=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.scaffoldKey,
       // endDrawer: endDrawer(context),
      appBar:AppBar(
        centerTitle: true,
        backgroundColor:customTheme.appbarColor,
        title: FxText.titleMedium("Sales".toUpperCase(), fontWeight: 500,color: Colors.white,),
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
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => DropDownScreen()));
               /* FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['xlsx','csv'],
                );
                if (result != null) {
                  PlatformFile file = result.files.first;
                  controller.setImageVisible(true);
                  controller.image.value = File(file.path.toString());
                }*/

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
            Obx(()=>
               Center(
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
                           child: Icon(Icons.cancel,size: 30,color: Colors.red,)
                       ):Icon(Icons.add_a_photo,size: 22,color: customTheme.buttonColor,)
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
                  hintStyle:  TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500) ,
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
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Icon(color: Colors.grey,
                     Icons.account_circle,
                      size: 22,
                    ),
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
                      width: Get.width*0.70,
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
            10.height,
            RequiredFormTitle(
                'Product Type', fontSize: 15,
                fontWeight: FontWeight.w500),
            5.height,
            Container(
              height: Get.height*0.068,
              decoration: BoxDecoration(
                color:  customTheme.card,
                border: Border.all(color: Colors.grey,),  // Set border width
                borderRadius: BorderRadius.all(Radius.circular(5.0)
                ),
              ),
              child: SearchChoices.single(
                displayClearIcon: false,
                underline: Container(),
                padding: EdgeInsets.fromLTRB(7, 0, 0, 0),
                items: controller.dropdownItems,
                value: controller.selectedValue,
                hint: Text("Select One",style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),),
                searchHint: Text("Select One"),
                onChanged: (value) {
                 controller.setSelectedValue(value);
                },
                isExpanded: true,
                selectedValueWidgetFn: (selectedValue) {
                  return (DropdownMenuItem(
                      child: Text(
                        selectedValue,
                        style: TextStyle(color: Colors.black),
                      )));
                },
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
                      width: Get.width*0.70,
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
            10.height,
            RequiredFormTitle(
                'Model Number', fontSize: 15,
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
                  labelStyle: FxTextStyle.titleSmall(
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                      letterSpacing: 0,
                      color: Colors.black,
                      fontWeight: 700),
                  hintText: "Model Number",
                  hintStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500) ,
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
                  prefixIcon: Padding(
                    padding:   const EdgeInsets.only(right: 10.0),
                    child: Icon(color: Colors.grey,
                    Icons.production_quantity_limits_rounded,
                      size: 22,
                    ),
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
            10.height,
            RequiredFormTitle(
                'Bar Code', fontSize: 15,
                fontWeight: FontWeight.w500),
            5.height,
            Container(
              height: Get.height*0.055,
              width: Get.width*0.439,
              child: TextFormField(
                textInputAction: TextInputAction.next,
                controller: controller.barCode,
                style: FxTextStyle.titleMedium(
                    letterSpacing: 0,
                    color: Colors.black87,
                    fontWeight: 500),
                decoration: InputDecoration(
                  hintText: "Scan code",
                  labelStyle: FxTextStyle.titleSmall(textStyle: TextStyle(fontWeight: FontWeight.bold),
                      letterSpacing: 0,
                      color: Colors.black,
                      fontWeight: 700),
                  hintStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500) ,
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
                  suffixIcon:InkWell(
                    onTap: (){
                      scanBarcodeNormal();
                    },
                    child: Icon(color: Colors.grey,
                      Icons.qr_code,
                      size: 22,
                    ),
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.all(10),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('^[0-9]*\\.?[0-9]*'))

                ],
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
            10.height,
            RequiredFormTitle(
                'Product Unit', fontSize: 15,
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
                      width: Get.width*0.70,
                      decoration: BoxDecoration(
                        borderRadius: radius(4),

                      ),
                      child: DropdownButtonSearch(controller.tempList.value.map((cat) => cat).toList().cast<String>(),
                          'Choose an unit',
                          'Choose an unit', (value) {
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
            10.height,
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
                      width: Get.width*0.430,
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
                          hintStyle:TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500) ,
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
                          prefixIcon: Padding(
                            padding:   const EdgeInsets.only(right: 10.0),
                            child: Icon(color: Colors.grey,
                              Icons.numbers,
                              size: 22,
                            ),
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
                6.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RequiredFormTitle(
                        'Sales Price', fontSize: 15,
                        fontWeight: FontWeight.w500),
                    5.height,
                    Container(
                      height: Get.height*0.055,
                      width: Get.width*0.430,
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
                          hintStyle:  TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500) ,

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
                          prefixIcon: Padding(
                            padding:   const EdgeInsets.only(right: 10.0),
                            child: Icon(color: Colors.grey,
                              Icons.numbers,
                              size: 22,
                            ),
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
                  width: Get.width*0.430,
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
                      hintStyle:  TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500) ,
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
                      prefixIcon: Padding(
                        padding:   const EdgeInsets.only(right: 10.0),
                        child: Icon(color: Colors.grey,
                          Icons.numbers,
                          size: 22,
                        ),
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
                      width: Get.width*0.430,
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
                          hintStyle:  TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500) ,
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
                          prefixIcon: Padding(
                            padding:   const EdgeInsets.only(right: 10.0),
                            child: Icon(color: Colors.grey,
                              Icons.ac_unit,
                              size: 22,
                            ),
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
                6.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RequiredFormTitle(
                        'Opening QTY', fontSize: 15,
                        fontWeight: FontWeight.w500),
                    5.height,
                    Container(
                      height: Get.height*0.055,
                      width: Get.width*0.430,
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
                          hintStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500) ,
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
                          prefixIcon: Padding(
                            padding:   const EdgeInsets.only(right: 10.0),
                            child: Icon(color: Colors.grey,
                              Icons.ac_unit_sharp,
                              size: 22,
                            ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FxText.bodyLarge("Measurement",
                  fontWeight: 600, letterSpacing: 0,color: customTheme.appbarColor,),
                InkWell(
                  onTap: (){
                    controller.setIncreaseMeasuremntCount(v++);
                  },
                  child: Container(
                    height: Get.height*0.055,
                    width: Get.width*0.20,
                    child: Row(
                      children: [
                        Icon(Icons.add,color: Colors.black87,),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text("Add",style: TextStyle(color: Colors.black87),),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
            Divider(color: customTheme.buttonColor,height: 5,thickness: 1,),
            5.height,
                ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                  shrinkWrap: true,
                    itemCount:controller.measurementCount.value,
                  itemBuilder:(context,int index) {
                    return Row(
                      children:
                      [
                        Container(
                          height: Get.height * 0.055,
                          width: Get.width * 0.40,
                          decoration: BoxDecoration(
                            color: customTheme.card,
                            border: Border.all(color: Colors.grey,),
                            // Set border width
                            borderRadius: BorderRadius.all(
                                Radius.circular(5.0)),),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              width: Get.width * 0.70,
                              decoration: BoxDecoration(
                                borderRadius: radius(4),

                              ),
                              child: DropdownButtonSearch(
                                  controller.tempList.value.map((cat) => cat)
                                      .toList()
                                      .cast<String>(),
                                  'Choose an unit',
                                  'Choose an unit', (value) {
                                controller.setUnit(value);
                              },
                                  value: controller.selectedUnit.value),
                            ),
                          ),
                        ),
                        6.width,
                        Container(
                          height: Get.height * 0.055,
                          width: Get.width * 0.38,
                          child: TextFormField(

                            textInputAction: TextInputAction.next,
                            controller: controller.purchasePriceController,
                            style: FxTextStyle.titleMedium(
                                letterSpacing: 0,
                                color: Colors.black87,
                                fontWeight: 500),
                            decoration: InputDecoration(
                              labelStyle: FxTextStyle.titleSmall(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold),
                                  letterSpacing: 0,
                                  color: Colors.black,
                                  fontWeight: 700),
                              hintText: "QTY",
                              hintStyle: FxTextStyle.titleSmall(
                                  letterSpacing: 0,
                                  color: Colors.black,
                                  fontWeight: 700),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  borderSide: BorderSide(
                                      width: 5, color: Colors.red)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.black38)
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
                              FilteringTextInputFormatter.allow(
                                  RegExp('^[0-9]*\\.?[0-9]*'))

                            ],
                            textCapitalization: TextCapitalization.sentences,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            child: InkWell(
                                onTap: () {
                                  controller.setIncreaseMeasuremntCount(--v);
                                },
                                child: Icon(Icons.cancel, size: 25,
                                  color: Colors.red,)
                            ),
                          ),
                        ),
                      ],
                    );



                  }

                ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FxText.bodyLarge("Size declaration",
                  fontWeight: 600, letterSpacing: 0,color: customTheme.appbarColor,
                ),
                InkWell(
                  onTap: (){
                    controller.setIncreaseSizeDeclaration(size++);

                  },
                  child: Container(
                    height: Get.height*0.055,
                    width: Get.width*0.20,
                    child: Row(
                      children: [
                        Icon(Icons.add,color: Colors.black87,),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text("Add",style: TextStyle(color: Colors.black87),),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(color: customTheme.buttonColor,height: 5,thickness: 1,),
            5.height,
            ListView.separated(
              shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return Divider();
                },
              itemCount: controller.sizedeclarationCount.value,
              itemBuilder: (context,int index)
                {
                  return Column(
                    children: [
                      Row(
                        children:
                        [
                          Container(
                            height: Get.height*0.055,
                            width: Get.width*0.43,
                            decoration: BoxDecoration(
                              color:  customTheme.card,
                              border: Border.all(color: Colors.grey,),  // Set border width
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),),
                            child:  DropDown(
                              showUnderline: false,
                              isExpanded: true,
                              items: [" L", " M", " XL"," XXL"],
                              hint: Text(" Size",style: TextStyle(decoration: TextDecoration.none,fontSize: 13,color: Colors.black),),
                              onChanged: print,
                            ),

                          ),
                          6.width,
                          Container(
                            height: Get.height*0.055,
                            width: Get.width*0.43,
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
                                hintText: "Price",
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
                                  Icons.money,
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



                          /*    Container(
                      height: Get.height*0.055,
                      width: Get.width*0.10,
                      decoration: BoxDecoration(
                        color:  customTheme.card,
                        border: Border.all(color: Colors.grey,),  // Set border width
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: InkWell(
                                onTap: (){
                                  controller.setExpand(true);
                                },
                                child: Icon(Icons.add,size: 25,)
                            ),
                          ),
                        ],
                      ),
                    ),*/


                        ],
                      ),
                      5.height,
                      Row(
                        children: [
                          Container(
                            width: Get.width*0.79,
                            height: Get.height*0.055,
                            decoration: BoxDecoration(
                              color:  customTheme.card,
                              border: Border.all(color: Colors.grey,),  // Set border width
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Container(
                                width: Get.width*0.30,
                                child:DropDownMultiSelect(
                                  isDense: true,
                                  decoration: InputDecoration(
                                      border: InputBorder.none
                                  ),
                                  onChanged: (List<String> x) {
                                  },
                                  options: ['Red' , 'Blue' , 'Black' , 'Yellow'],
                                  selectedValues: selected,
                                  whenEmpty:'Color',
                                ),


                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              child: InkWell(
                                  onTap: () {
                                    controller.setIncreaseSizeDeclaration(--size);
                                  },
                                  child: Icon(Icons.cancel, size: 25,
                                    color: Colors.red,)
                              ),
                            ),
                          ),
                        ],
                      ),
                      5.height,

                    ],
                  );
                }
            ),

           10.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: FxText.bodyLarge("Description",
                      fontWeight: 600, letterSpacing: 0,color: customTheme.appbarColor,),
                ),
              ],
            ),
            Divider(color: customTheme.buttonColor,height: 5,thickness: 1,),
            10.height,
            Container(
              child: CupertinoTextField(
                textInputAction: TextInputAction.done,
                decoration: BoxDecoration(  borderRadius: BorderRadius.circular(5), color: theme.colorScheme.background,
                    border: Border.all(color: Colors.grey,)),
                cursorColor: Colors.black,
                placeholder: "Description",
                placeholderStyle: FxTextStyle.titleSmall(
                    letterSpacing: 0,
                    color: Colors.black,
                    fontWeight: 700),
                minLines: 4,
                maxLines: 6,
                style: TextStyle(color: theme.colorScheme.onBackground),
                padding: FxSpacing.xy(8, 1),
              ),
            ),
            5.height,
  /*          Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor:customTheme.appbarColor,
                    textStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold)),

                onPressed: (){

                 selectImages();

                },
                child: Text("Select Multiple Image"),
              ),
            ),*/

        /*    Container(
              child:  DropDown(
                items: ["Male", "Female", "Other"],
                hint: Text("Select Gender"),
                onChanged: print,
              ),

            ),*/
            10.height,

             /*  Container(
                child:  DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Text(
                      'Select Item',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: controller.items.map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                        .toList(),
                    value: controller.searchValue.isNotEmpty?controller.searchValue:null,
                    onChanged: (value) {

                     // controller.searchValue=value as String;
                    },
                    buttonHeight: 40,
                    buttonWidth: 200,
                    itemHeight: 40,
                    dropdownMaxHeight: 200,
                    searchController: controller.textEditingController,
                    searchInnerWidget: Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        bottom: 4,
                        right: 8,
                        left: 8,
                      ),
                      child: TextFormField(
                        controller: controller.textEditingController,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          hintText: 'Search for an item...',
                          hintStyle: const TextStyle(fontSize: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    searchMatchFn: (item, searchValue) {
                      return (item.value.toString().contains(searchValue));
                    },
                    //This to clear the search value when you close the menu
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        controller.textEditingController.clear();
                      }
                    },
                  ),
                ),
              ),*/

            10.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FxText.bodyLarge("Gallery",
                  fontWeight: 600, letterSpacing: 0,color: customTheme.appbarColor,
                ),
                InkWell(
                  onTap: (){
                    controller.setExpanded(!controller.isExpanded.value);
                  },
                  child: Container(
                    height: Get.height*0.055,
                    width: Get.width*0.20,
                    child: Row(
                      children: [
                        Icon(Icons.add,color: Colors.black87,),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text("Add",style: TextStyle(color: Colors.black87),),
                        ),
                      ],
                    ),
                  ),
                ),


              ],
            ),
            Divider(color: customTheme.buttonColor,height: 5,thickness: 1,),
              Visibility(
                visible:controller.isExpanded.value,
                child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                shrinkWrap: true,
                children: List.generate(4, (index) {
                return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Obx(()=>
                   Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: controller.isImageVisible.value&&controller.currentIndex.value==index?FileImage(controller.image.value): AssetImage(Images.no_image) as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5.0),),
                        ),
                      ),
                      Positioned(
                        right: 3,
                        top: 110,
                        child:  InkWell(
                            onTap: () async {
                              if(index==0)
                                {
                                  FilePickerResult? result = await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: ['jpg','png','jpeg'],
                                  );
                                  if (result != null) {
                                    PlatformFile file = result.files.first;
                                    controller.setImageVisible(true);
                                    controller.setCurrentIndex(index);
                                    controller.image.value = File(file.path.toString());
                                  }
                                }
                              if(index==1)
                                {
                                  FilePickerResult? result = await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: ['jpg','png','jpeg'],
                                  );
                                  if (result != null) {
                                    PlatformFile file = result.files.first;
                                    controller.setImageVisible(true);
                                    controller.setCurrentIndex(index);
                                    controller.image.value = File(file.path.toString());
                                  }
                                }
                              if(index==2)
                                {
                                  FilePickerResult? result = await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: ['jpg','png','jpeg'],
                                  );
                                  if (result != null) {
                                    PlatformFile file = result.files.first;
                                    controller.setImageVisible(true);
                                    controller.setCurrentIndex(index);
                                    controller.image.value = File(file.path.toString());
                                  }
                                }
                             if(index==4)
                               {
                                 FilePickerResult? result = await FilePicker.platform.pickFiles(
                                   type: FileType.custom,
                                   allowedExtensions: ['jpg','png','jpeg'],
                                 );
                                 if (result != null) {
                                   PlatformFile file = result.files.first;
                                   controller.setImageVisible(true);
                                   controller.setCurrentIndex(index);
                                   controller.image.value = File(file.path.toString());
                                 }
                               }

                            },
                          child: controller.isImageVisible.value?InkWell(
                            onTap:()
                            {
                             controller.setImageVisible(false);
                              },
                              child:controller.currentIndex.value==index?Icon(Icons.cancel,size: 25,color: Colors.red,):Icon(Icons.add_a_photo,size: 25,color: customTheme.buttonColor,),
                          ):
                          Icon(Icons.add_a_photo,size: 25,color: customTheme.buttonColor,),

                        )
                    )
                    ],

                  ),
                ),
                );
                },
    ),
                ),
              )


    ],
        ),
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
                        duration: Duration(seconds: 10),
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
 /* Widget endDrawer(BuildContext context) {
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
                *//*    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius:50 ,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(Images.logo3),
                      ),
                    ),*//*
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
                                  child: Icon(Icons.cancel,size: 25,color: customTheme.buttonColor,)
                              ):Icon(Icons.add_a_photo,size: 25,color: customTheme.buttonColor,)
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
                          hintStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500) ,
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
                        decoration: BoxDecoration( borderRadius: BorderRadius.circular(5), color: theme.colorScheme.background,
                            border: Border.all(color: Colors.grey,)
                        ),
                        cursorColor: Colors.black,
                        placeholder: "Description",
                        placeholderStyle:FxTextStyle.titleSmall(
                            letterSpacing: 0,
                            color: Colors.red,
                            fontWeight: 700),
                        minLines: 4,
                        maxLines: 6,
                        style: TextStyle(color: Colors.red),
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
  }*/

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
      controller.selectedBarCode.value=barcodeScanRes;
      controller.barCode.text=barcodeScanRes;
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }





  }
  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }

  }


}