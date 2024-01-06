class TicketListResponse {
  bool? success;
  List<Data>? data;

  TicketListResponse({this.success, this.data});

  TicketListResponse.fromJson(Map<String, dynamic> json) {
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
  int? ticketId;
  int? ticketCategoryId;
  String? ticketName;
  int? price;
  int? noOfTicket;
  String? cover;
  int? noOfPeople;
  String? description;
  int? createdBy;
  String? createdOn;
  String? colorCode;

  Data(
      {this.ticketId,
        this.ticketCategoryId,
        this.ticketName,
        this.price,
        this.noOfTicket,
        this.cover,
        this.noOfPeople,
        this.description,
        this.createdBy,
        this.createdOn,
        this.colorCode,
      });

  Data.fromJson(Map<String, dynamic> json) {
    ticketId = json['ticket_id'];
    ticketCategoryId = json['ticket_category_id'];
    ticketName = json['ticket_name'];
    price = json['price'];
    noOfTicket = json['no_of_ticket'];
    cover = json['cover'];
    noOfPeople = json['no_of_people'];
    description = json['description'];
    createdBy = json['created_by'];
    createdOn = json['created_on'];
    colorCode = json['color_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticket_id'] = this.ticketId;
    data['ticket_category_id'] = this.ticketCategoryId;
    data['ticket_name'] = this.ticketName;
    data['price'] = this.price;
    data['no_of_ticket'] = this.noOfTicket;
    data['cover'] = this.cover;
    data['no_of_people'] = this.noOfPeople;
    data['description'] = this.description;
    data['created_by'] = this.createdBy;
    data['created_on'] = this.createdOn;
    data['color_code'] = this.colorCode;
    return data;
  }
}