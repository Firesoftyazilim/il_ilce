import 'dart:async';

import 'package:flutter/material.dart';
import 'package:il_ilce/conttroler/il_ilce_conttroler.dart';
import 'package:il_ilce/model/city.dart';

import 'package:flutter/material.dart';

/// DropDown ekranı
class DropDown extends StatefulWidget {
  /// DropDown ekranı
  const DropDown({required this.controller,super.key});

  final IlIlceController controller;

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown>{

  /// city
  late City city;

  /// cityList
  late List<City> cityList;


  /// state
  String district = '';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            const Text('İl'),
            Padding(
              padding: const EdgeInsets.all(10),
              child: DropdownButton<City>(
                value: city,
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
                  });
                },
              ),
            ),
          ],
        ),
        Column(
          children: [
            const Text('İlçe'),
            Padding(
              padding: const EdgeInsets.all(10),
              child: DropdownButton<String>(
                value: district,
                items: city.districts.map((e) {
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    widget.controller.changeCity(value);
                    district = value!;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

