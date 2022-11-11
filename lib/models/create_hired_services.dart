class CreateHiredServices {
  int id;
  int customerId;
  int serviceId;
  int amount;
  int price;
  String scheduledDate;
  String status;
  CreateHiredServices({
    required this.id,
    required this.customerId,
    required this.serviceId,
    required this.amount,
    required this.price,
    required this.scheduledDate,
    required this.status
  });

  factory CreateHiredServices.fromJson(Map json) {
    return CreateHiredServices(
      id: json["id"],
      customerId: json['customerId'],
      serviceId: json['serviceId'],
      amount: json['amount'],
      price: json['price'],
      scheduledDate: json['scheduledDate'],
      status: json['status'],
    );
  }
}