import 'package:get/get.dart';
import 'package:getx/screens/login/login_screen.dart';
import 'package:getx/screens/order_screen.dart';
import 'package:getx/screens/profile_page.dart';
import 'package:getx/screens/registration/registration_screen.dart';
import 'package:getx/screens/user_page.dart';
import 'package:getx/screens/shop_type_page.dart';
import 'package:getx/screens/splash_screen.dart';
import 'package:getx/utils/custom_widget/forms.dart';

import '../bindings/home_binding.dart';
import '../bindings/splash_binding.dart';
import '../screens/card_page.dart';
import '../screens/checkout_page.dart';
import '../screens/dashboard_page.dart';
import '../screens/invoice_card.dart';
import '../screens/order_place_screen.dart';
import '../screens/pack_page.dart';
import '../screens/package_details.dart';
import '../screens/read_me_page.dart';
import '../screens/salses_page.dart';
import '../splash/splash.dart';


class AppPages {
  static String INITIAL = '/splash';
  static String SLIDER='/slider';
  static String LOGIN='/login';
  static String REGISTER='/register';
  static String SHOPTYPE='/shoptype';
  static String USERTYPE='/usertype';
  static String PACKAGEDETAILS='/packagedetails';
  static String PACKPAGE='/packpage';
  static String CARDPAGE='/card';
  static String CHECKOUTPAGE='/checkout';
  static String TERMSANDCONDITIONS="/termsandcondition";
  static String ORDERCONFERM="/orderconform";
  static String ORDERSCREEN="/orderscreen";
  static String PROFILESCREEN="/profilescreen";
  static String DASHBOARD="/dashboard";
  static String FORMS="/forms";
  static String INVOICE="/invoice";
  static String SALES="/sales";

  static String getHomeRoute() => SLIDER;
  static String getLogInRoute() => LOGIN;
  static String getRegisterRoute()=>REGISTER;
  static String getShopTypeRoute()=>SHOPTYPE;
  static String getUserTypeRoute()=>USERTYPE;
  static String getPackageDetailsRoute()=>PACKAGEDETAILS;
  static String getPackPageRoute()=>PACKPAGE;
  static String getCardPageRoute()=>CARDPAGE;
  static String getCheckoutPageRoute()=>CHECKOUTPAGE;
  static String getTermsandConditionPageRoute()=>TERMSANDCONDITIONS;
  static String getOrderConformPageRoute()=>ORDERCONFERM;
  static String getDashBoardPageRoute()=>DASHBOARD;
  static String getProfilePageRoute()=>PROFILESCREEN;
  static String getOrderPageRoute()=>ORDERSCREEN;
  static String getFormsPageRoute()=>FORMS;
  static String getInvoicePageRoute()=>INVOICE;
  static String getSalesPageRoute()=>SALES;
  static final routes = [
    GetPage(
        name: INITIAL, page: () => SplashScreen(),binding: SplashBinding(),
    ),
    GetPage(
      name: SLIDER, page: () => ShoppingOnboardingScreen(),binding: HomeBinding(),
    ),
    GetPage(
      name: LOGIN, page: () => LogInScreen(),binding: HomeBinding(),
    ),
    GetPage(
      name: REGISTER, page: () => RegistrationScreen(),binding: HomeBinding(),
    ),
    GetPage(
      name: SHOPTYPE, page: () => ShopType(),binding: HomeBinding(),
    ),
    GetPage(
      name: USERTYPE, page: () => SelectUser(),binding: HomeBinding(),
    ),
    GetPage(
      name: PACKAGEDETAILS, page: () => PackageDetails(),binding: HomeBinding(),
    ),
    GetPage(
      name: PACKPAGE, page: () => PackPage(),binding: HomeBinding(),
    ),
    GetPage(
      name: CARDPAGE, page: () => CardPage(),binding: HomeBinding(),
    ),
    GetPage(
      name: CHECKOUTPAGE, page: () => CheckoutPage(),binding: HomeBinding(),
    ),
    GetPage(
      name: TERMSANDCONDITIONS, page: () => TermsandConditionPage(),binding: HomeBinding(),
    ),
    GetPage(
      name: ORDERCONFERM, page: () => OrderConformScreen(),binding: HomeBinding(),
    ),
    GetPage(
      name: DASHBOARD, page: () => DashboardScreen(),binding: HomeBinding(),
    ),
    GetPage(
      name: PROFILESCREEN, page: () => ProfileScreen(),binding: HomeBinding(),
    ),
    GetPage(
      name: ORDERSCREEN, page: () => OrdersScreen(),binding: HomeBinding(),
    ),
    GetPage(
      name: FORMS, page: () => Forms(),binding: HomeBinding(),
    ),
    GetPage(
      name: INVOICE, page: () => IvoiceCard(),binding: HomeBinding(),
    ),
    GetPage(
      name: SALES, page: () => SalesScreen(),binding: HomeBinding(),
    ),

  ];
}
