class VenueResponse {
  bool? success;
  List<Data>? data;

  VenueResponse({this.success, this.data});

  VenueResponse.fromJson(Map<String, dynamic> json) {
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
  int? venueId;
  String? venueName;
  String? address1;
  String? address2;
  int? cityId;
  String? pincode;
  String? googleCoordinates;
  int? businessId;
  String? createdOn;

  Data(
      {this.venueId,
        this.venueName,
        this.address1,
        this.address2,
        this.cityId,
        this.pincode,
        this.googleCoordinates,
        this.businessId,
        this.createdOn});

  Data.fromJson(Map<String, dynamic> json) {
    venueId = json['venue_id'];
    venueName = json['venue_name'];
    address1 = json['address1'];
    address2 = json['address2'];
    cityId = json['city_id'];
    pincode = json['pincode'];
    googleCoordinates = json['google_coordinates'];
    businessId = json['business_id'];
    createdOn = json['created_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['venue_id'] = this.venueId;
    data['venue_name'] = this.venueName;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['city_id'] = this.cityId;
    data['pincode'] = this.pincode;
    data['google_coordinates'] = this.googleCoordinates;
    data['business_id'] = this.businessId;
    data['created_on'] = this.createdOn;
    return data;
  }
}