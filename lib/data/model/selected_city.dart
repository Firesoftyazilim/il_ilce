class SelectedCity{


  String city;
  String district;
  SelectedCity({
    required this.city,
    required this.district,
  });

  factory SelectedCity.fromJson(Map<dynamic, dynamic> json) {
    return SelectedCity(
      city: json['city'] as String,
      district: json['district'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': this.city,
      'district': this.district,
    };
  }
}