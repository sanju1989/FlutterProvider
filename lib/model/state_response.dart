class StateResponse {
  bool? success;
  List<Data>? data;

  StateResponse({this.success, this.data});

  StateResponse.fromJson(Map<String, dynamic> json) {
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
  int? stateId;
  String? state;
  int? countryId;
  int? isActive;

  Data({this.stateId, this.state, this.countryId, this.isActive});

  Data.fromJson(Map<String, dynamic> json) {
    stateId = json['state_id'];
    state = json['state'];
    countryId = json['country_id'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state_id'] = this.stateId;
    data['state'] = this.state;
    data['country_id'] = this.countryId;
    data['is_active'] = this.isActive;
    return data;
  }
}