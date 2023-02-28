

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:getx/screens/login/login_screen.dart';
import 'package:getx/utils/colors.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../utils/app_theme.dart';
import '../utils/custom_theme.dart';

class BasicSettingScreen extends StatefulWidget {
  @override
  _BasicSettingScreenState createState() => _BasicSettingScreenState();
}

class _BasicSettingScreenState extends State<BasicSettingScreen> {
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
        appBar: AppBar(
          backgroundColor: customTheme.appbarColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          title: FxText.titleLarge("Setting".toUpperCase(), fontWeight: 500,color: Colors.white,fontSize: 15,),
        ),
        backgroundColor: theme.backgroundColor,
        body: ListView(
          padding: FxSpacing.fromLTRB(20, 20, 20, 20),
          children: <Widget>[
            TextFormField(
              style: FxTextStyle.bodyLarge(
                  letterSpacing: 0.1, color: theme.colorScheme.onBackground),
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: FxTextStyle.titleSmall(
                    letterSpacing: 0.1, color: theme.colorScheme.onBackground),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: customTheme.card,
                prefixIcon: Icon(MdiIcons.magnify,
                    size: 22,
                    color: Colors.black),
                isDense: true,
                contentPadding: EdgeInsets.all(0),
              ),
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.sentences,
            ),
            FxSpacing.height(12),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(MdiIcons.accountEditOutline,
                        size: 24, color: theme.colorScheme.onBackground),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      child: FxText.titleMedium("Account", fontWeight: 500),
                    ),
                  ),
                  Container(
                    child: Icon(MdiIcons.chevronRight,
                        size: 24, color: theme.colorScheme.onBackground),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.3,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(
                      MdiIcons.bellRingOutline,
                      size: 22,
                      color: theme.colorScheme.onBackground,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      child:
                      FxText.titleMedium("Notifications", fontWeight: 500),
                    ),
                  ),
                  Container(
                    child: Icon(MdiIcons.chevronRight,
                        size: 24, color: theme.colorScheme.onBackground),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.3,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(MdiIcons.eyeOutline,
                        size: 22, color: theme.colorScheme.onBackground),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      child: FxText.titleMedium("Appearance", fontWeight: 500),
                    ),
                  ),
                  Container(
                    child: Icon(MdiIcons.chevronRight,
                        size: 24, color: theme.colorScheme.onBackground),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.3,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(MdiIcons.lockOutline,
                        size: 24, color: theme.colorScheme.onBackground),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      child: FxText.titleMedium("Privacy \& Security",
                          fontWeight: 500),
                    ),
                  ),
                  Container(
                    child: Icon(MdiIcons.chevronRight,
                        size: 24, color: theme.colorScheme.onBackground),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.3,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(MdiIcons.faceAgent,
                        size: 24, color: theme.colorScheme.onBackground),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      child: FxText.titleMedium("Help \& Support",
                          fontWeight: 500),
                    ),
                  ),
                  Container(
                    child: Icon(MdiIcons.chevronRight,
                        size: 24, color: theme.colorScheme.onBackground),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.3,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(MdiIcons.helpCircleOutline,
                        size: 24, color: theme.colorScheme.onBackground),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      child: FxText.titleMedium("About", fontWeight: 500),
                    ),
                  ),
                  Container(
                    child: Icon(MdiIcons.chevronRight,
                        size: 24, color: theme.colorScheme.onBackground),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.3,
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInScreen()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Icon(MdiIcons.logout,
                          size: 24, color: theme.colorScheme.onBackground),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 16),
                        child: FxText.titleMedium("Log out", fontWeight: 500),
                      ),
                    ),
                    Container(
                      child: Icon(MdiIcons.chevronRight,
                          size: 24, color: theme.colorScheme.onBackground),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 0.3,
            ),
          ],
        ));
  }
}
