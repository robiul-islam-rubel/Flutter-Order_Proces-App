


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:getx/screens/login/reset_password_screen.dart';
import 'package:getx/utils/colors.dart';
import 'package:getx/utils/custom_theme.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/app_theme.dart';



class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with TickerProviderStateMixin {
  late ThemeData theme;
  bool selectedmobiletooltip=false;
  bool selectedmobileerror=false;
CustomTheme customTheme=CustomTheme();

  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.shoppingTheme;
    //controller = FxControllerStore.put(ForgotPasswordController(this));
    outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: ListView(
        padding:
        FxSpacing.fromLTRB(20, FxSpacing.safeAreaTop(context) + 48, 20, 20),
        children: [
          FxText.displaySmall(
            'Forgot Password?',
            fontWeight: 500,
            textAlign: TextAlign.center,
          ),
          FxSpacing.height(20),
          FxText.bodyMedium(
            'Welcome to change password!!',
            muted: true,
            textAlign: TextAlign.center,
          ),
          FxSpacing.height(32),

          TextFormField(
            textInputAction: TextInputAction.next,
            validator: _validateforgetpassword,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
            style: FxTextStyle.bodyMedium(),
            decoration: InputDecoration(
                errorStyle: TextStyle(height: 0),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                isDense: true,
                fillColor: theme.cardTheme.color,
                prefixIcon: Icon(
                  FeatherIcons.mail,
                  color: selectedmobiletooltip ==true?Colors.red: theme.colorScheme.onBackground,
                ),
                suffixIcon: selectedmobiletooltip==true ? InkWell(
                  onTap: (){
                    setState(() {
                      selectedmobileerror=!selectedmobileerror;
                    });

                  },
                  child: Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ):null,
                hintText: "Enter an email",
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
                border: outlineInputBorder,
                contentPadding: FxSpacing.all(16),
                hintStyle: FxTextStyle.bodyMedium(),
                isCollapsed: true),
                 maxLines: 1,


          ),
          FxSpacing.height(20),
          FxButton.block(
            elevation: 0,
            borderRadiusAll: 4,
            onPressed: ()
            {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>ResetPasswordScreen ())
              );

            },
            splashColor: theme.colorScheme.onPrimary.withAlpha(30),
            backgroundColor:customTheme.buttonColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FxText.labelLarge(
                  "Submit",
                  fontWeight: 600,
                  color: Colors.black,
                  letterSpacing: 0.4,
                ),
                FxSpacing.width(8),

              ],
            ),
          ),
          FxSpacing.height(16),
          Center(
            child: FxButton.text(
              onPressed: () {

              },
              splashColor: theme.colorScheme.primary.withAlpha(40),
              child: FxText.labelLarge("I haven\'t an account",
                  decoration: TextDecoration.underline,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
  String? _validateforgetpassword(String? value) {
    if (value.isEmptyOrNull) {
      SchedulerBinding.instance.addPostFrameCallback((duration) {
       // controller.setpasswordtooltiplogin(true);
      }
      );
      return "";
    } else {
      SchedulerBinding.instance.addPostFrameCallback((duration) {
       // controller.setpasswordtooltiplogin(false);
      });
      return null;
    }
  }
}
