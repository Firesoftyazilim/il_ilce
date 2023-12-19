import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:il_ilce/model/city.dart';
import 'package:select_dialog/select_dialog.dart';

class IlIlceDialog{

  IlIlceDialog._();

  static  IlIlceDialog? _instance;

  static get instance{
    _instance ??= IlIlceDialog._();
    return _instance;
  }

  /// müşteri seç
  Future<String?> selectIl(BuildContext context) async {
    String? il;
      await  SelectDialog.showModal<String>(
      context,
      label: "İl Ara",
      items: City.list().map((e) => e.city).toList(),
      searchBoxDecoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "İl Ara",
        hintText: "İl Adı",
        prefixIcon: Icon(Icons.search),
      ),
      loadingBuilder: (e) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      emptyBuilder: (e) {
        return Center(
          child: Text("İl Bulunamadı"),
        );
      },
      errorBuilder: (e, t) {
        return Center(
          child: Text("Hata"),
        );
      },
      itemBuilder: (context, item, isSelected) {
        return SizedBox(
          child: ListTile(
            title: Text('$item '),
            trailing: isSelected ? Icon(Icons.check) : null,
          ),
        );
      },
        onChange: (String? selected) {
          il = selected;
        }
    );


    return il;
  }

  Future<String?> selectIlce(BuildContext context,{required String il}) async {
    if(City.list().where((element) => element.city==il).length==0){
      throw Exception('Gönderilen il bulunamadı');
    }

    City city = City.list().where((element) => element.city==il).first;
    String? ilce;
    await SelectDialog.showModal<String?>(
      context,
      label: "İlçe Ara (${city.city})",
      items: city.districts,
      searchBoxDecoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "İlçe Ara",
        hintText: "İlçe Adı",
        prefixIcon: Icon(Icons.search),
      ),
      loadingBuilder: (e) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      emptyBuilder: (e) {
        return Center(
          child: Text("İlçe Bulunamadı"),
        );
      },
      errorBuilder: (e, t) {
        return Center(
          child: Text("Hata"),
        );
      },
      itemBuilder: (context, item, isSelected) {
        return SizedBox(
          child: ListTile(
            title: Text('$item '),
            trailing: isSelected ? Icon(Icons.check) : null,
          ),
        );
      },
      onChange: (String? selected) {
        ilce = selected;
      }
    );

    return ilce;
  }


}