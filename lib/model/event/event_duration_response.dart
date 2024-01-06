class EventDurationResponse {
  bool? success;
  List<Data>? data;

  EventDurationResponse({this.success, this.data});

  EventDurationResponse.fromJson(Map<String, dynamic> json) {
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
  int? durationId;
  String? duration;
  int? isActive;

  Data({this.durationId, this.duration, this.isActive});

  Data.fromJson(Map<String, dynamic> json) {
    durationId = json['duration_id'];
    duration = json['duration'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['duration_id'] = this.durationId;
    data['duration'] = this.duration;
    data['is_active'] = this.isActive;
    return data;
  }
}