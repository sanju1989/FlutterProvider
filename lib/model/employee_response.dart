class EmployeeTypeResponse {
  bool? success;
  List<Data>? data;

  EmployeeTypeResponse({this.success, this.data});

  EmployeeTypeResponse.fromJson(Map<String, dynamic> json) {
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
  int? employeTypeId;
  String? employeType;
  int? isActive;

  Data({this.employeTypeId, this.employeType, this.isActive});

  Data.fromJson(Map<String, dynamic> json) {
    employeTypeId = json['employe_type_id'];
    employeType = json['employe_type'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employe_type_id'] = this.employeTypeId;
    data['employe_type'] = this.employeType;
    data['is_active'] = this.isActive;
    return data;
  }
}