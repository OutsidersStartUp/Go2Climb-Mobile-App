class CreateService {
  int id;
  int agencyId;
  String name;
  //int score;
  int price;
  int newPrice;
  String location;
  String creationDate;
  String photos;
  String description;
  bool isOffer;
  CreateService({
    required this.id,
    required this.agencyId,
    required this.name,
    //required this.score,
    required this.price,
    required this.newPrice,
    required this.location,
    required this.creationDate,
    required this.photos,
    required this.description,
    required this.isOffer
  });

  factory CreateService.fromJson(Map json) {
    return CreateService(
      id: json["id"],
      agencyId: json['agencyId'],
      name: json['name'],
      //score: json['score'],
      price: json['price'],
      newPrice: json['newPrice'] as int,
      location: json['location'],
      creationDate: json['creationDate'],
      photos: json['photos'],
      description: json['description'],
      isOffer: json['isOffer'] as bool,
    );
  }
}
