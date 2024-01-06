class AddTicketResponse {
  String? ticketCategoryId;
  String? ticketName;
  String? price;
  String? noOfTickets;
  String? cover;
  String? numberOfPeople;
  String? describe;
  String? userId;

  AddTicketResponse(
      {this.ticketCategoryId,
        this.ticketName,
        this.price,
        this.noOfTickets,
        this.cover,
        this.numberOfPeople,
        this.describe,
        this.userId});

  AddTicketResponse.fromJson(Map<String, dynamic> json) {
    ticketCategoryId = json['ticket_category_id'];
    ticketName = json['ticket_name'];
    price = json['price'];
    noOfTickets = json['no_of_tickets'];
    cover = json['cover'];
    numberOfPeople = json['number_of_people'];
    describe = json['describe'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticket_category_id'] = this.ticketCategoryId;
    data['ticket_name'] = this.ticketName;
    data['price'] = this.price;
    data['no_of_tickets'] = this.noOfTickets;
    data['cover'] = this.cover;
    data['number_of_people'] = this.numberOfPeople;
    data['describe'] = this.describe;
    data['user_id'] = this.userId;
    return data;
  }
}