import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class _QuickActionWidget extends StatelessWidget implements PreferredSizeWidget {
  final IconData iconData;
  final String actionText;

  _QuickActionWidget(
      {Key? key, required this.iconData, required this.actionText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      margin: FxSpacing.y(12),
      child: Column(
        children: <Widget>[
          ClipOval(
            child: Material(
              color: themeData.colorScheme.primary.withAlpha(20),
              // button color
              child: InkWell(
                splashColor: themeData.colorScheme.primary.withAlpha(100),
                highlightColor: Colors.transparent,
                child: SizedBox(
                    width: 52,
                    height: 52,
                    child: Icon(
                      iconData,
                      color: themeData.colorScheme.primary,
                    )),
                onTap: () {},
              ),
            ),
          ),
          Padding(
            padding: FxSpacing.top(4),
            child: FxText.bodySmall(actionText, fontWeight: 600),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
Widget drawerMenus(BuildContext context) {
  return InkWell(
    onTap: () {
      showAlignedDialog(
        context: context,
        followerAnchor: Alignment.topLeft,
        isGlobal: true,
        transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          return SlideTransition(
            position: Tween(begin: Offset(-1, 0), end: Offset(0, 0))
                .animate(animation),
            child: FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut,
              ),
              child: child,
            ),
          );
        },
        builder: (context) {
          return Center(
            child: Container(
              height: Get.height*0.50,
              color: Colors.white,
              child: Padding(
                padding: FxSpacing.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FxText.titleMedium("Navigation", fontWeight: 500),
                        //FxText.titleMedium("View-all", fontWeight: 500,decoration: TextDecoration.underline,),

                      ],
                    ),

                    Container(
                      margin: FxSpacing.top(16),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    _QuickActionWidget(
                                      iconData: Icons.phone_outlined,
                                      actionText: 'Prepaid',
                                    ),
                                    _QuickActionWidget(
                                      iconData: Icons.subway_outlined,
                                      actionText: 'Metro',
                                    ),
                                    _QuickActionWidget(
                                      iconData:
                                      Icons.local_gas_station_outlined,
                                      actionText: 'Gas Bill',
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    _QuickActionWidget(
                                      iconData: Icons.light_outlined,
                                      actionText: 'Electricity',
                                    ),
                                    _QuickActionWidget(
                                      iconData: Icons.tv,
                                      actionText: 'DTH',
                                    ),
                                    _QuickActionWidget(
                                      iconData: Icons.camera_outlined,
                                      actionText: 'Gold',
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    _QuickActionWidget(
                                      iconData: Icons.phone_outlined,
                                      actionText: 'Postpaid',
                                    ),
                                    _QuickActionWidget(
                                      iconData: Icons.play_arrow_outlined,
                                      actionText: 'G Play',
                                    ),
                                    _QuickActionWidget(
                                      iconData: Icons.umbrella_outlined,
                                      actionText: 'Insurance',
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
    child: Icon(Icons.menu),
  );
}