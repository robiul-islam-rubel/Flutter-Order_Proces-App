import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:getx/screens/login/login_screen.dart';
import 'package:getx/utils/colors.dart';
import 'package:getx/utils/custom_theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../utils/app_theme.dart';




class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen>
    with TickerProviderStateMixin {
  late ThemeData theme;
  bool _passwordVisible = false;
  bool _passwordVisible1 = false;
  late OutlineInputBorder outlineInputBorder;
  CustomTheme customTheme=CustomTheme();

  @override
  void initState() {
    super.initState();
    theme = AppTheme.shoppingTheme;


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
            'Reset Password',
            fontWeight: 500,
            textAlign: TextAlign.center,
          ),
          FxSpacing.height(20),
          FxText.bodyMedium(
            'Don\'t worry! \nNow you can reset your password easily',
            muted: true,
            textAlign: TextAlign.center,
          ),
          FxSpacing.height(32),


             Column(
              children: [
                TextFormField(
                  obscureText:_passwordVisible,
                  style: FxTextStyle.bodyMedium(),
                  decoration: InputDecoration(
                      floatingLabelBehavior:
                      FloatingLabelBehavior.never,
                      filled: true,
                      isDense: true,
                      fillColor: theme.cardTheme.color,
                      prefixIcon: Icon(
                        FeatherIcons.lock,
                        color: theme.colorScheme.onBackground,
                      ),
                      suffixIcon: InkWell(
                        onTap: (){
                          setState(() {
                            _passwordVisible=!_passwordVisible;
                          });
                        },
                          child: _passwordVisible?Icon(MdiIcons.eyeOutline,color: Colors.black,):Icon(MdiIcons.eyeOffOutline,color: Colors.black,)
                      ),
                      hintText: "Password",
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      border: outlineInputBorder,
                      contentPadding: FxSpacing.all(16),
                      hintStyle: FxTextStyle.bodyMedium(),
                      isCollapsed: true),
                      maxLines: 1,
                  cursorColor: theme.colorScheme.onBackground,
                ),
                SizedBox(height: 10,),
                TextFormField(
                  obscureText:_passwordVisible1,
                  style: FxTextStyle.bodyMedium(),
                  decoration: InputDecoration(
                      floatingLabelBehavior:
                      FloatingLabelBehavior.never,
                      filled: true,
                      isDense: true,
                      fillColor: theme.cardTheme.color,
                      prefixIcon: Icon(
                        FeatherIcons.lock,
                        color: theme.colorScheme.onBackground,
                      ),
                      suffixIcon: InkWell(
                          onTap: (){
                            setState(() {
                              _passwordVisible1=!_passwordVisible1;
                            });
                          },
                          child: _passwordVisible1?Icon(MdiIcons.eyeOutline,color: Colors.black,):Icon(MdiIcons.eyeOffOutline,color: Colors.black,)
                      ),
                      hintText: "Retype-password",
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      border: outlineInputBorder,
                      contentPadding: FxSpacing.all(16),
                      hintStyle: FxTextStyle.bodyMedium(),
                      isCollapsed: true),
                  maxLines: 1,
                  cursorColor: theme.colorScheme.onBackground,
                ),


              ],
            ),

          FxSpacing.height(20),
          FxButton.block(
            elevation: 0,
            borderRadiusAll: 4,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInScreen()));

            },
            splashColor: theme.colorScheme.onPrimary.withAlpha(30),
            backgroundColor: customTheme.buttonColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FxText.labelLarge(
                  "Reset Password",
                  fontWeight: 600,
                  color: Colors.black,
                  letterSpacing: 0.4,
                ),
                FxSpacing.width(8),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
