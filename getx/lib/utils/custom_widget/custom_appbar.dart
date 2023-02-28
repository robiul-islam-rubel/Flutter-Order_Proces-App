
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../screens/notifications.dart';
import '../../screens/user_page.dart';
import '../../screens/setting.dart';
import '../app_theme.dart';
import '../colors.dart';
import '../custom_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  ThemeData theme = AppTheme.theme;
  CustomTheme customTheme=CustomTheme();

  List<TextIconItem> _textIconChoice = [
    TextIconItem("Add new", Icons.add),
    TextIconItem("Contact", Icons.email),
    TextIconItem("Setting", Icons.build),
    TextIconItem("Adminstrative", Icons.admin_panel_settings),
  ];
  CustomAppBar({
    required this.title,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child:   AppBar(
        centerTitle: true,
        backgroundColor:customTheme.appbarColor,
        title: FxText.titleMedium("${title}".toUpperCase(), fontWeight: 500,color: Colors.white,),
        leading: IconButton(
          onPressed: () =>Get.back(),
          icon: Icon(FeatherIcons.chevronLeft),
        ),
        actions: <Widget>[
          Padding(
            padding: FxSpacing.x(16),
            child: Icon(Icons.notifications,color: Colors.white,),
          ),

          PopupMenuButton(
            onSelected: (value){
              if(value=="Adminstrative")
              {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => BasicSettingScreen())
                );
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
    );
  }
}