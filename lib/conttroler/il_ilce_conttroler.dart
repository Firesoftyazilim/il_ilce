import 'dart:async';

import 'package:il_ilce/model/selected_city.dart';

class IlIlceController {
  // Bu controller, bir string değeri içerir
  final StreamController<SelectedCity> _controller = StreamController<SelectedCity>();

  // Dışarıdan erişim için bir stream ve sink sağlar
  Stream<SelectedCity> get stream => _controller.stream;
  Sink<SelectedCity> get sink => _controller.sink;

  SelectedCity selectedCity = SelectedCity(city: "", district: "");



  void changeCity(String? city) {
    selectedCity.city = city??"";
    sink.add(selectedCity);
  }

  void changeDistrict(String? district) {
    selectedCity.district = district??"";
    sink.add(selectedCity);
  }


  // Özellikle dispose edilmesi gereken durumları yönetmek için bir metot
  void dispose() {
    _controller.close();
  }

}
