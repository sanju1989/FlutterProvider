class LoginResponse {
  bool? success;
  String? message;
  String? error;
  List<Data>? data;

  LoginResponse({this.success, this.message,this.error, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    error=json['error'];
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
    data['message'] = this.message;
    data['error']=this.error;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? userId;
  String? userName;
  String? userPhone;
  String? userEmail;
  int? businessId;
  String? businessName;

  Data(
      {this.userId,
        this.userName,
        this.userPhone,
        this.userEmail,
        this.businessId,
        this.businessName,
        });

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userPhone = json['user_phone'];
    userEmail = json['user_email'];
    businessId = json['business_id'];
    businessName = json['business_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_phone'] = this.userPhone;
    data['user_email'] = this.userEmail;
    data['business_id'] = this.businessId;
    data['business_name'] = this.businessName;
    return data;
  }
}