
import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../controllers/home_controller.dart';
import '../utils/app_theme.dart';
import '../utils/custom_theme.dart';

class OrderConformScreen extends GetView<HomeController>{
  ThemeData theme = AppTheme.shoppingTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image(
                    image: AssetImage('./assets/shopping/order-confirm.png'),
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.width * 0.5,
                  ),
                ),
                FxSpacing.height(32),
                FxText.bodyMedium(
                  "Your order placed successfully",
                ),
                FxSpacing.height(16),

                FxSpacing.height(16),

              ],
            ),
          ),
        ));
  }
}

void get()
{

}