import 'dart:async';

import 'package:flutter/material.dart';
import 'package:il_ilce/conttroler/il_ilce_conttroler.dart';
import 'package:il_ilce/model/city.dart';

import 'package:flutter/material.dart';

/// IlIlceDropDown ekranı
class IlIlceDropDown extends StatefulWidget {
  /// IlIlceDropDown ekranı
  const IlIlceDropDown(
      {required this.controller,
      this.backgroundColor,
      this.textColor,
      super.key});

  final IlIlceController controller;

  final Color? backgroundColor;

  final Color? textColor;

  @override
  State<IlIlceDropDown> createState() => _IlIlceDropDownState();
}

class _IlIlceDropDownState extends State<IlIlceDropDown> {
  /// city
  late City city;

  /// cityList
  late List<City> cityList;

  /// state
  String district = '';

  late Color backgroundColor;

  late Color textColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cityList = City.list();
    city = cityList.first;
    district = city.districts.first;
  }

  @override
  Widget build(BuildContext context) {
    backgroundColor =
        widget.backgroundColor ?? Theme.of(context).colorScheme.primary;
    textColor = widget.textColor ?? Theme.of(context).colorScheme.background;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: backgroundColor,
                  ),
                  child: ListTile(
                    title: Text(
                      "İl",
                      style: TextStyle(color: textColor),
                    ),
                    subtitle: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Divider(
                          color: textColor,
                        ),
                        DropdownButton<City>(
                          isExpanded: true,
                          value: city,
                          style: TextStyle(color: textColor),
                          underline: Container(),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: textColor,
                          ),
                          dropdownColor:
                              Theme.of(context).colorScheme.primary,
                          items: cityList.map((e) {
                            return DropdownMenuItem<City>(
                              value: e,
                              child: Text(e.city),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              widget.controller.changeCity(value?.city);
                              city = value!;
                              district = city.districts.first;
                              widget.controller.changeDistrict(district);
                            });
                          },
                        ),
                      ],
                    ),
                  )),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: backgroundColor,
                  ),
                  child: ListTile(
                    title: Text(
                      "İlçe",
                      style: TextStyle(color: textColor),
                    ),
                    subtitle: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Divider(
                          color: textColor,
                        ),
                        DropdownButton<String>(
                          isExpanded: true,
                          value: district,
                          style: TextStyle(color: textColor),
                          underline: Container(),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: textColor,
                          ),
                          dropdownColor:
                              Theme.of(context).colorScheme.primary,
                          items: city.districts.map((e) {
                            return DropdownMenuItem<String>(
                              value: e,
                              child: Text(e),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              widget.controller.changeDistrict(value);
                              district = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
