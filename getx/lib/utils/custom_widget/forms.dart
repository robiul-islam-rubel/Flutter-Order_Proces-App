

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getx/utils/colors.dart';
import 'package:getx/utils/custom_widget/custom_appbar.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../controllers/home_controller.dart';
import '../app_theme.dart';
import '../custom_theme.dart';
class Forms extends GetView<HomeController>{

  CustomTheme customTheme=CustomTheme();
ThemeData theme = AppTheme.theme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Account Setting",height: 55,),
        body: ListView(
          padding: FxSpacing.fromLTRB(20, 20, 20, 20),
          children: <Widget>[
            FxText.bodyLarge("Personal information",
                fontWeight: 600, letterSpacing: 0),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: TextFormField(
                      style: FxTextStyle.titleMedium(
                          letterSpacing: 0,
                          color: Colors.black87,
                          fontWeight: 500),
                      decoration: InputDecoration(
                        labelStyle: FxTextStyle.titleSmall(textStyle: TextStyle(fontWeight: FontWeight.bold),
                            letterSpacing: 0,
                            color: Colors.black,
                            fontWeight: 700),
                        labelText: "Email",
                        hintText: "Email",
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
                                width: 1, color: appBarColor)
                        ),
                        filled: true,
                        fillColor: customTheme.card,
                        prefixIcon: Icon(color: customTheme.appbarColor,
                          MdiIcons.emailOutline,
                          size: 22,
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.all(0),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12),
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
                        labelText: "Number",
                        hintText: "Number",
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
                                width: 1, color: appBarColor)
                        ),
                        filled: true,
                        fillColor: customTheme.card,
                        prefixIcon: Icon(color: customTheme.appbarColor,
                          MdiIcons.phoneOutline,
                          size: 22,
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.all(0),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24, bottom: 0),
              child: FxText.bodyLarge("Company information",
                  fontWeight: 600, letterSpacing: 0),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 16),
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
                        labelText: "Name",
                        hintText: "Name",
                        hintStyle: FxTextStyle.titleSmall(
                            letterSpacing: 0,
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                            borderSide:BorderSide(
                                width: 1)
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
                                width: 1, color: appBarColor)
                        ),
                        filled: true,
                        fillColor: customTheme.card,
                        prefixIcon: Icon(color: Colors.grey,
                          MdiIcons.domain,
                          size: 22,
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.all(0),
                      ),
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12),
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
                        labelText: "Job Title",
                        hintText: "Job Title",
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
                                width: 1, color: appBarColor)
                        ),
                        filled: true,
                        fillColor: customTheme.card,
                        prefixIcon: Icon(color: customTheme.appbarColor,
                          MdiIcons.briefcaseOutline,
                          size: 22,
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.all(0),
                      ),
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12),
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
                        labelText: "Website",
                        hintText: "Website",
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
                                width: 1, color: appBarColor)
                        ),
                        filled: true,
                        fillColor: customTheme.card,
                        prefixIcon: Icon(color: customTheme.appbarColor,
                          MdiIcons.web,
                          size: 22,
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.all(0),
                      ),
                      textCapitalization: TextCapitalization.sentences,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              child: FxText.bodyLarge("Change Password",
                  fontWeight: 600, letterSpacing: 0),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
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
                  labelText: "Old Password",
                  hintText: "Old Password",
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
                          width: 1, color: appBarColor)
                  ),
                  filled: true,
                  fillColor: customTheme.card,
                  prefixIcon: Icon(MdiIcons.lockOutline,color: customTheme.appbarColor,),
                  suffixIcon: IconButton(
                    icon: Icon( MdiIcons.eyeOutline
                      ),
                    onPressed: () {

                    },
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.all(0),
                ),
                textCapitalization: TextCapitalization.sentences,

              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
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
                  labelText: "Password",
                  hintText: " Password",
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
                          width: 1, color: appBarColor)
                  ),
                  filled: true,
                  fillColor: customTheme.card,
                  prefixIcon: Icon(MdiIcons.lockOutline,color: customTheme.appbarColor,),
                  suffixIcon: IconButton(
                    icon: Icon(MdiIcons.eyeOutline),
                    onPressed: () {

                    },
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.all(0),
                ),
                textCapitalization: TextCapitalization.sentences,


              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              child: TextFormField(
                 controller:controller.dateController ,
                style: FxTextStyle.titleSmall(
                    letterSpacing: 0,
                    color: theme.colorScheme.onBackground,
                    fontWeight: 500),
                decoration: InputDecoration(
                  labelStyle: FxTextStyle.titleSmall(textStyle: TextStyle(fontWeight: FontWeight.bold),
                      letterSpacing: 0,
                      color: Colors.black,
                      fontWeight: 700),
                  hintText: "Calendar",
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
                          width: 1, color: appBarColor)
                  ),
                  filled: true,
                  fillColor: customTheme.card,
                  prefixIcon: Icon(MdiIcons.calendar,color: customTheme.appbarColor,),
                  isDense: true,
                  contentPadding: EdgeInsets.all(0),
                ),
                textCapitalization: TextCapitalization.sentences,
                readOnly: true,
                onTap: () async {
                                    await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2015),
                                    lastDate: DateTime(2025),
                                    ).then((selectedDate) {
                                    if (selectedDate != null) {
                                controller.dateController.text =DateFormat('yyyy-MM-dd').format(selectedDate);
                                    }
                                    });
                                    },



              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              child: TextFormField(
                controller: controller.timeController,
                style: FxTextStyle.titleSmall(
                    letterSpacing: 0,
                    color: theme.colorScheme.onBackground,
                    fontWeight: 500),
                decoration: InputDecoration(
                  labelStyle: FxTextStyle.titleSmall(textStyle: TextStyle(fontWeight: FontWeight.bold),
                      letterSpacing: 0,
                      color: Colors.black,
                      fontWeight: 700),
                  hintText: " Time",
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
                          width: 1, color: appBarColor)
                  ),
                  filled: true,
                  fillColor: customTheme.card,
                  prefixIcon: Icon(Icons.access_time,color:customTheme.appbarColor,),

                  isDense: true,
                  contentPadding: EdgeInsets.all(0),
                ),
                readOnly: true,
                textCapitalization: TextCapitalization.sentences,
                onTap: () async {
                    final TimeOfDay? result = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                    if (result != null) {

                        controller.timeController.text = result.format(context);
                    }

                },


              ),
            ),



          ],
        ),
        bottomNavigationBar:Container(
          padding: FxSpacing.fromLTRB(20,0,20,10),
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            padding: FxSpacing.zero,
            mainAxisSpacing: 20,
            childAspectRatio: 3 / 1,
            crossAxisSpacing: 20,
            children: <Widget>[
              FxButton.block(
                backgroundColor: Colors.white,
                elevation: 0,
                onPressed: () {
                 // Get.back();
                },
                child: FxText.bodyMedium("RESET",
                    fontWeight: 500, color: Colors.black, letterSpacing: 0.5),
              ),
              FxButton.block(
                backgroundColor: customTheme.buttonColor,
                elevation: 0,
                borderRadiusAll: 5,
                onPressed: () {
                 // Get.toNamed(AppPages.getCardPageRoute());
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FxText.bodyMedium("SAVE",
                        fontWeight: 500, color: Colors.black, letterSpacing: 0.5),

                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}

