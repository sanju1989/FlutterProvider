class ProfileInfoResponse {
  bool? success;
  Data? data;

  ProfileInfoResponse({this.success, this.data});

  ProfileInfoResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  UserInfo? userInfo;
  VenueInfo? venueInfo;

  Data({this.userInfo, this.venueInfo});

  Data.fromJson(Map<String, dynamic> json) {
    userInfo = json['user-info'] != null
        ? new UserInfo.fromJson(json['user-info'])
        : null;
    venueInfo = json['venue-info'] != null
        ? new VenueInfo.fromJson(json['venue-info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userInfo != null) {
      data['user-info'] = this.userInfo!.toJson();
    }
    if (this.venueInfo != null) {
      data['venue-info'] = this.venueInfo!.toJson();
    }
    return data;
  }
}

class UserInfo {
  int? userId;
  String? userName;
  String? userEmail;
  String? userPhone;
  String? createdOn;
  int? businessId;
  String? businessName;

  UserInfo(
      {this.userId,
        this.userName,
        this.userEmail,
        this.userPhone,
        this.createdOn,
        this.businessId,
        this.businessName});

  UserInfo.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPhone = json['user_phone'];
    createdOn = json['created_on'];
    businessId = json['business_id'];
    businessName = json['business_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_email'] = this.userEmail;
    data['user_phone'] = this.userPhone;
    data['created_on'] = this.createdOn;
    data['business_id'] = this.businessId;
    data['business_name'] = this.businessName;
    return data;
  }
}

class VenueInfo {
  int? venueId;
  String? venueName;
  String? address1;
  String? address2;
  int? cityId;
  String? pincode;
  String? googleCoordinates;
  int? businessId;
  String? createdOn;

  VenueInfo(
      {this.venueId,
        this.venueName,
        this.address1,
        this.address2,
        this.cityId,
        this.pincode,
        this.googleCoordinates,
        this.businessId,
        this.createdOn});

  VenueInfo.fromJson(Map<String, dynamic> json) {
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