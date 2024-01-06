class TicketCategoryResponse {
  bool? success;
  List<Data>? data;

  TicketCategoryResponse({this.success, this.data});

  TicketCategoryResponse.fromJson(Map<String, dynamic> json) {
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
  int? ticketCategoryId;
  String? categoryName;
  int? isActive;

  Data({this.ticketCategoryId, this.categoryName, this.isActive});

  Data.fromJson(Map<String, dynamic> json) {
    ticketCategoryId = json['ticket_category_id'];
    categoryName = json['category_name'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticket_category_id'] = this.ticketCategoryId;
    data['category_name'] = this.categoryName;
    data['is_active'] = this.isActive;
    return data;
  }
}