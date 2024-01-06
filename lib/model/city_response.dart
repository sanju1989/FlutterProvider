class CityResponse {
  bool? success;
  List<Data>? data;

  CityResponse({this.success, this.data});

  CityResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? cityId;
  String? city;
  int? stateId;
  int? isActive;

  Data({this.cityId, this.city, this.stateId, this.isActive});

  Data.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    city = json['city'];
    stateId = json['state_id'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_id'] = this.cityId;
    data['city'] = this.city;
    data['state_id'] = this.stateId;
    data['is_active'] = this.isActive;
    return data;
  }
}