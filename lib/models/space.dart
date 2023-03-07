class Space {
  late int id;
  late String name;
  late String imageUrl;
  late int price;
  late String city;
  late String country;
  late int rating;
  late String address;
  late String phone;
  late String mapUrl;
  late List photos;
  late int numberOfKitchens;
  late int numberOfBedrooms;
  late int numberOfCupboard;

  Space(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.price,
      required this.city,
      required this.rating,
      required this.country,
      required this.address,
      required this.phone,
      required this.mapUrl,
      required this.numberOfBedrooms,
      required this.numberOfCupboard,
      required this.numberOfKitchens,
      required this.photos});

  Space.fromJson(json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    price = json['price'];
    city = json['city'];
    rating = json['rating'];
    country = json['country'];
    address = json['address'];
    phone = json['phone'];
    photos = json['photos'];
    mapUrl = json['map_url'];
    numberOfBedrooms = json['number_of_bedrooms'];
    numberOfCupboard = json['number_of_cupboards'];
    numberOfKitchens = json['number_of_kitchens'];
  }
}
