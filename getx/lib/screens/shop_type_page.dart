import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getx/utils/colors.dart';
import 'package:getx/utils/custom_theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../controllers/home_controller.dart';
import '../../routes/app_pages.dart';
import '../../utils/app_theme.dart';
import '../utils/constant.dart';
import '../utils/custom_widget/custom_appbar.dart';
import '../utils/images.dart';
import 'package:flutx/flutx.dart';

import '../utils/single_grid_item.dart';
class TextIconItem {
  String text;
  IconData iconData;

  TextIconItem(this.text, this.iconData);
}

class ShopType extends GetView<HomeController> {
  @override





  ThemeData theme = AppTheme.shoppingTheme;
 CustomTheme customTheme =CustomTheme();
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(
      color: Colors.transparent,
    ),
  );

  @override
  Widget build(BuildContext context) {
    // setStatusBarColor(Colors.green.shade900);
    return Scaffold(
        appBar:    CustomAppBar(title:"Shop",height: 55,),
        body:  Obx(() =>ListView(
          padding: FxSpacing.fromLTRB(20, 20, 20, 20),
          children: [
            FxText.displaySmall(
              'Hello Again! \nWelcome \nback',
              fontWeight: 500,
              color: customTheme.appbarColor,
            ),
            FxSpacing.height(40),
            GridView.count(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                crossAxisCount: 2,
                padding: FxSpacing.zero,
                mainAxisSpacing: 20,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                children:  [
                    InkWell(
                    onTap: (){
                      controller.setSelectedRole(1);
                    },
                    child: SinglePageItem(
                      iconColor: customTheme.appbarColor,
                      borderColor:controller.selectedRole.value==1?customTheme.buttonColor:Colors.transparent,
                      iconData: MdiIcons.shoppingOutline,
                      title: "Medicine",
                    ),
                  ),

                  InkWell(
                    onTap: (){
                      controller.setSelectedRole(2);
                    },
                    child: SinglePageItem(
                      iconColor: customTheme.appbarColor,
                      borderColor:controller.selectedRole.value==2?customTheme.buttonColor:Colors.transparent,
                      title: "Inventory",
                     iconData: Icons.inventory,
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      controller.setSelectedRole(3);
                    },
                    child: SinglePageItem(
                      iconColor: customTheme.appbarColor,
                      borderColor:controller.selectedRole.value==3?customTheme.buttonColor:Colors.transparent,
                      iconData: Icons.restaurant_menu,
                      title: "Restaurent",
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      controller.setSelectedRole(4);
                    },
                    child: SinglePageItem(
                      iconColor: customTheme.appbarColor,
                      borderColor:controller.selectedRole.value==4?customTheme.buttonColor:Colors.transparent,
                      iconData: Icons.manage_accounts_outlined,
                      title: "Others",
                    ),
                  ),

                ]
            ),




          ],
        ),
        ),
      bottomNavigationBar:Padding(
        padding: FxSpacing.fromLTRB(20, 20, 20, 20),
        child: FxButton.block(
          backgroundColor: customTheme.buttonColor,
          elevation: 0,
          borderRadiusAll: 5,
          onPressed: ()
          {
            Get.toNamed(AppPages.getRegisterRoute());
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FxText.bodyMedium("NEXT",
                  fontWeight: 500,
                  color: Colors.black,
                  letterSpacing: 0.5),
              Container(
                margin: EdgeInsets.only(left: 16),
                child: Icon(
                  MdiIcons.chevronRight,
                  color: Colors.black,
                  size: 20,
                ),
              )
            ],
          ),
        ),
      ),

    );
  }

}