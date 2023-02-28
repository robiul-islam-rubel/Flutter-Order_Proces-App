import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutx/utils/validators/string_validator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:http/http.dart' as http;




class HomeController extends GetxController {
 // DatabaseHelper databaseHelper = DatabaseHelper.instance;
  var isLoadingItemTypes = false.obs;

  var isExpanded = false.obs;
  var selectedValue="".obs;


  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var agentBankName = Rxn<String>();
  var isExpand=false.obs;
  var selectedAddress=0.obs;
  var selectedPayment=0.obs;
  var currentIndex = 0.obs;
  var selectedRole=0.obs;
  var selectedUser=0.obs;
  var userType=1.obs;
  var focusShop=false.obs;
  var selectedshopnametooltip=false.obs;
  var selectedshopnameerror=false.obs;
  var selectedmobiletooltip=false.obs;
  var selectedmobileerror=false.obs;
  var selectedmobiletooltiplogin=false.obs;
  var selectedmobileerrorlogin=false.obs;
  var selectedpasswordtooltiplogin=false.obs;
  var selectedpassworderrorlogin=false.obs;
  var selectedPackage=0.obs;
  var selectedPackDuration=0.obs;
  var selectedPackType=0.obs;
  var ispaymentmethodTabbed=false.obs;
  var image=File('').obs;
  var isImageVisible=false.obs;
  var measurementCount=0.obs;
  var sizedeclarationCount=0.obs;

  List<bool> dataExpansionPanel = [false,false,false,false,false,false,false,false,false,false].obs;
  //var dataExpansionPanel =List<bool>.empty(growable: true).obs;
  var selectedoption=''.obs;
  Rx<List<String>> selectedOptionList = Rx<List<String>>([]);

  //var itemTypesList = List<ItemTypes>.empty(growable: true).obs;

  var isLoadingFinish = false.obs;

  List<DropdownMenuItem<String>> menuItemsCategory = [];
  var items = ["Apple","Banana","Cat","Dog","Fog"].obs;
  //List<DropdownMenuItem<Depots>> menuItemDepo=[];
  var catItemList = [].obs;

  var orderCount=0.obs;
  List<DropdownMenuItem<String>> menuItemsProducts = [];
  var productList = [].obs;
  var selectedProductName = Rxn<String>();


  List<DropdownMenuItem<String>> menuItemsAgentBankCode = [];
  var agentBankCodeList = [].obs;
  var selected = [].obs;

  List<DropdownMenuItem<String>>menuItemBranch=[];
  var BranchNameList=[].obs;
  var selectedBranchName=Rxn<String>();
  var selectedBarCode=Rxn<String>();


  List<DropdownMenuItem<String>> menuItemsNourishBankCode = [];
  var nourishBankCodeList = [].obs;

  List<DropdownMenuItem<String>> menuItemsbanks = [];

  var title="".obs;
  var subtitle="".obs;
  var description="".obs;

  var selectedCountry=Rxn<String>();
  var selectedCategory=Rxn<String>();
  var selectedBrand=Rxn<String>();
  var selectedUnit=Rxn<String>();
  /* TextEditingControllers */
  var salesNameController =TextEditingController();
  var salesCategoryController=TextEditingController();
  var salesBrandController=TextEditingController();

 var loginemailController =TextEditingController();
 var loginpasswordController=TextEditingController();
 var registernameController=TextEditingController();
  var registeremailController=TextEditingController();
  var registerpasswordController=TextEditingController();
  var registershopnameController=TextEditingController();
  var registermobileController=TextEditingController();
  var forgetpasswordController=TextEditingController();
  var resetpasswordController=TextEditingController();
  var againresetpasswordController=TextEditingController();
  var countryController=TextEditingController();
  var registermobilecodeController=TextEditingController();
  var registeraddressController=TextEditingController();
  var dateController=TextEditingController();
  var timeController=TextEditingController();
  var imagePickerController = TextEditingController();
  var purchasePriceController=TextEditingController();
  var salesPriceController=TextEditingController();
  var discountPriceController=TextEditingController();
  var barCode=TextEditingController();
  var textEditingController = TextEditingController();
  var tempList=["Dhaka","Bangladesh","India","Thiland"].obs;
  var productInfoList = [].obs;
  var paymentInfoList=[].obs;
  var timeList = ["All time", "Yesterday", "This week", "7 days ago"].obs;
  String time="All time";
  String searchValue = '';
  var isExpand1=false.obs;




  var newProductList = [].obs;



  @override
  void onInit() {
    super.onInit();

  }

  void dispose(){

  }


  @override
  void onClose() {
    super.onClose();
  }
  void setSelectedValue(var value)
  {
    this.selectedValue.value=value;
  }
  void setIncreaseMeasuremntCount(var value)
  {
    this.measurementCount.value=value;
  }
  void setIncreaseSizeDeclaration(var value)
  {
    this.sizedeclarationCount.value=value;
  }
  void setExpanded(value)
  {
    this.isExpanded.value=value;
  }
  void setExpand(value)
  {
    this.isExpand.value=value;
  }
  void setExpand1(value)
  {
    this.isExpand1.value=value;
  }
  void setUserType(var value)
  {
    this.userType.value=value;
  }
  void setImageVisible(var value)
  {
    this.isImageVisible.value=value;
  }
  void setCurrentIndex(var value)
  {
    this.currentIndex.value=value;
    this.currentIndex.refresh();

  }
  void setBrand(var value)
  {
    this.selectedBrand.value=value;
  }
  void setUnit(var value)
  {
    this.selectedUnit.value=value;
  }
void setPaymentMethod(var value)
{

  this.selectedPayment.value=value;
}
void setCategory(var value)
{
  this.selectedCategory.value=value;
}
void setPaymentMethodTabbed(var value)
{
  this.ispaymentmethodTabbed.value=true;
}
void setAddress(var value)
{
  this.selectedAddress.value=value;
}
void setSelectedPackDuration(var value)
{
  this.selectedPackDuration.value=value;
}
  void setSelectedPackType(var value)
  {
    this.selectedPackType.value=value;
  }

  void setSelectedPackage(var value)
  {
    this.selectedPackage.value=value;
  }
  void setshopnametooltip(var value)
  {
    this.selectedshopnametooltip.value=value;
  }
  void setshoperror(var value)
  {
    this.selectedshopnameerror.value=value;
  }
  void setmobiletooltip(var value)
  {
    this.selectedmobiletooltip.value=value;
  }
  void setmobilerror(var value)
  {
    this.selectedmobileerror.value=value;
  }
  void setmobiletooltiplogin(var value)
  {
    this.selectedmobiletooltiplogin.value=value;
  }
  void setmobilerrorlogin(var value)
  {
    this.selectedmobileerrorlogin.value=value;
  }
  void setpasswordtooltiplogin(var value)
  {
    this.selectedpasswordtooltiplogin.value=value;
  }
  void setpassworderrorlogin(var value)
  {
    this.selectedpassworderrorlogin.value=value;
  }

  void setCountry(var value)
  {
    this.selectedCountry.value=value;
  }
  void setShopFocus(var value)
  {
    this.focusShop.value=value;
  }
  void setSelectedRole(var value)
  {
    this.selectedRole.value=value;
  }
  void setSelectedUser(var value)
  {
    this.selectedUser.value=value;
  }
  void openEndDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }
  void closeEndDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }
  String? validatePassword(String? text) {
    if (text == null || text.isEmpty) {


      return "Please enter password";
    } else if (!FxStringValidator.validateStringRange(
      text,
    )) {

      return "Password length must between 8 and 20";
    }
    return null;
  }
  String? validateEmail(String text) {
    if (text == null || text.isEmpty) {

      return "Please enter email";
    } else if (FxStringValidator.isEmail(text)) {


      return "Please enter valid email";
    }
    return null;

  }
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("USA"), value: "USA"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItems;
  }



}
