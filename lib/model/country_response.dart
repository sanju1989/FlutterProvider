class CountryResponse {
  bool? success;
  List<Data>? data;

  CountryResponse({this.success, this.data});

  CountryResponse.fromJson(Map<String, dynamic> json) {
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
  int? countryId;
  String? country;
  int? isActive;

  Data({this.countryId, this.country, this.isActive});

  Data.fromJson(Map<String, dynamic> json) {
    countryId = json['country_id'];
    country = json['country'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_id'] = this.countryId;
    data['country'] = this.country;
    data['is_active'] = this.isActive;
    return data;
  }
}
