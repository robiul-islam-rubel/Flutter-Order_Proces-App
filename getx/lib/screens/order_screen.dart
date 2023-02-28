import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:getx/utils/images.dart';
import 'package:intl/intl.dart';

import '../utils/app_theme.dart';
import '../utils/constant.dart';


class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  late ThemeData theme;
  //late OrdersController controller;
  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.shoppingManagerTheme;
    //controller = FxControllerStore.putOrFind(OrdersController());
    outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide.none,
    );
  }

  @override
  Widget build(BuildContext context) {

          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                padding: FxSpacing.fromLTRB(
                    20, FxSpacing.safeAreaTop(context) + 16, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleRow(),
                    FxSpacing.height(16),
                    status(),
                    FxSpacing.height(16),
                    ordersView()
                  ],
                ),
              ),
            ),
          );
        }



  Widget titleRow() {
    return Row(
      children: [
        FxContainer(
          width: 10,
          height: 24,
          color: theme.colorScheme.primaryContainer,
          borderRadiusAll: 2,
        ),
        FxSpacing.width(8),
        FxText.titleMedium(
          "Orders",
          fontWeight: 600,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FxContainer(
                color:
                     theme.colorScheme.primaryContainer,

                paddingAll: 8,
                onTap: () {
                 // controller.changeOrderView(OrderViewType.active);
                },
                child: FxText.bodySmall(
                  "ACTIVE",
                  fontSize: 11,
                  fontWeight: 700,
                  color:
                       theme.colorScheme.onPrimaryContainer,

                ),
              ),
              // FxSpacing.width(8),
              FxContainer(
                color:
                     theme.colorScheme.primaryContainer,

                paddingAll: 8,
                onTap: () {
                  //controller.changeOrderView(OrderViewType.past);
                },
                child: FxText.bodySmall(
                  "PAST",
                  fontSize: 11,
                  fontWeight: 700,
                  color:  theme.colorScheme.onBackground,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget status() {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: FxContainer.bordered(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.titleMedium(
                    'Completed',
                    fontWeight: 700,
                  ),
                  FxSpacing.height(8),
                  FxText.titleSmall(
                    '128',
                    fontWeight: 700,
                  ),
                  FxSpacing.height(12),
                  FxText.bodySmall(
                    'Progress',
                    fontWeight: 600,
                    muted: true,
                  ),
                  FxSpacing.height(6),
                  FxProgressBar(
                    width: 140,
                    inactiveColor: Constant.softColors.green.color,
                    activeColor: Constant.softColors.green.onColor,
                    height: 4,
                    progress: 0.4,
                  ),
                ],
              ),
            ),
          ),
          FxSpacing.width(16),
          Expanded(
            child: FxContainer.bordered(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.titleMedium(
                    'Past',
                    fontWeight: 700,
                  ),
                  FxSpacing.height(8),
                  FxText.titleSmall(
                    '245',
                    fontWeight: 700,
                  ),
                  FxSpacing.height(12),
                  FxText.bodySmall(
                    'Progress',
                    fontWeight: 600,
                    muted: true,
                  ),
                  FxSpacing.height(6),
                  FxProgressBar(
                    width: 140,
                    inactiveColor: theme.colorScheme.secondaryContainer,
                    activeColor: theme.colorScheme.onSecondaryContainer,
                    height: 4,
                    progress: 0.7,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ordersView() {
    return Column(
     // children: [...controller.orders.map((order) => orderView(order))],
    );
  }

  Widget orderView() {
    return FxContainer(
      onTap: () {
       // controller.goToOrder(order);
      },
      margin: FxSpacing.bottom(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FxText.bodySmall(
                "Order - " + "1",
                fontWeight: 700,
              ),
              FxText.bodySmall("15 Jan"+
                    ", " +
                    "3:45 PM",
                fontWeight: 600,
                muted: true,
              ),
            ],
          ),
          FxSpacing.height(12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FxContainer.none(
                borderRadiusAll: Constant.containerRadius.small,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image(
                  image: AssetImage(Images.logo3),
                  height: 48,
                  fit: BoxFit.cover,
                ),
              ),
              FxSpacing.width(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText.bodySmall(
                      "RBS",
                      fontWeight: 600,
                    ),
                    FxSpacing.height(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FxText.bodySmall(
                          '\$' +"123",
                          fontWeight: 700,
                        ),
                        FxContainer(
                          borderRadiusAll: Constant.containerRadius.xs,
                          padding: FxSpacing.fromLTRB(8, 3, 8, 5),
                          color: Colors.red,
                          child: FxText.bodySmall("Pull",
                            fontSize: 10,
                            color: Colors.blue,
                            fontWeight: 600,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
