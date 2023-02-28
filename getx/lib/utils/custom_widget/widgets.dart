
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Widget DropdownButtonSearch(List<String> items, dynamic hint, dynamic searchHint, Function(String?) onChanged,
    {
      String? value
    }
    ) {
  return DropdownSearch<String>(
    selectedItem: value,
    popupProps: PopupProps.dialog(
        dialogProps: DialogProps(actions: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
                height: 40.0,
                width: 80.0,
                child: const Center(
                  child: Text(
                    'Close',
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                )
            ),
          )
        ]
        ),
        title: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.all(10.0),
          child: Text(
            '$searchHint',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
        ),
        showSearchBox: true,
        searchDelay: Duration(milliseconds: 100),
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
              hintText: "Search here..",
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
              contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
              prefixIcon: Icon(Icons.search, color: Colors.black)
          ),
        ),
        itemBuilder: (context, item, isSelected) {
          return Padding(
            padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            child: Container(
              height: 40.0,
              alignment: Alignment.centerLeft,
              child: (Text(item.toString(),
                style: TextStyle(fontSize: 15.0),
              )),
            ),
          );
        }),
    dropdownDecoratorProps: DropDownDecoratorProps(
      textAlign: TextAlign.left,
      textAlignVertical: TextAlignVertical.center,
      dropdownSearchDecoration: InputDecoration(
        hintStyle:TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500) ,
        //prefixIcon: Icon(Icons.search),
          hintText: "$hint",
          border: InputBorder.none),
    ),
    items: items,
    onChanged: onChanged,
  );
}
Widget singleActivityWidget(
    {required String subtitle,
      required Color color,
      IconData? iconData,
      required String title,
      required String description}) {
  return  FxContainer.bordered(
    color: Colors.red[50],
    paddingAll: 3,
    borderRadiusAll: 5,
    child: Row(
      children: [
        FxSpacing.width(10),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.error,color: Colors.red,)
            ],
          ),
        ),
        FxSpacing.width(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FxText.bodySmall(
                "${title}",
                fontSize: 10,
              ),

              FxText.bodySmall(
                "${description}",
                fontSize: 10,
              ),

              FxText.bodySmall(
                "${subtitle}",
                fontSize: 10,
              ),

            ],
          ),
        ),
        InkWell(
          onTap: (){
           Get.back();
          },
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.cancel,color: Colors.red,)
              ],
            ),
          ),
        ),
        FxSpacing.width(10),


      ],
    ),
  );
}


Widget DropDownWithoutSearch(List<String> items,dynamic hint,Function(String?) onChanged,{
String? value
}
)
{
  return DropdownButton<String>(
    underline:SizedBox(),
    hint:Text("$hint"),
    value: value,
    style: const TextStyle(color: Colors.black),
    onChanged: onChanged,
    items: items.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }
    ).toList(),
  );
}
BoxDecoration CustomBoxDecoraTion(
    {Color? bordercolor, double? borderwidth, double? borderradius}) {
  return BoxDecoration(
      border: Border.all(color: bordercolor!, width: borderwidth!),
      borderRadius: BorderRadius.circular(borderradius!));
}

