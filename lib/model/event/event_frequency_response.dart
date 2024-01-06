class EventFrequencyResponse {
  bool? success;
  List<Data>? data;

  EventFrequencyResponse({this.success, this.data});

  EventFrequencyResponse.fromJson(Map<String, dynamic> json) {
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
  int? frequencyId;
  String? frequency;
  int? isActive;

  Data({this.frequencyId, this.frequency, this.isActive});

  Data.fromJson(Map<String, dynamic> json) {
    frequencyId = json['frequency_id'];
    frequency = json['frequency'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['frequency_id'] = this.frequencyId;
    data['frequency'] = this.frequency;
    data['is_active'] = this.isActive;
    return data;
  }
}