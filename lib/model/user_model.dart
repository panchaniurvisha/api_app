// To parse this JSON data, do
//     final userModel = userModelFromJson(jsonString);
import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company:
            json["company"] == null ? null : Company.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": address?.toJson(),
        "phone": phone,
        "website": website,
        "company": company?.toJson(),
      };
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: json["geo"] == null ? null : Geo.fromJson(json["geo"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo?.toJson(),
      };
}

class Geo {
  String? lat;
  String? lng;

  Geo({
    this.lat,
    this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}

// To parse this JSON data, do
//
//     final userModelTwo = userModelTwoFromJson(jsonString);

// To parse this JSON data, do
//
//     final userModelTwo = userModelTwoFromJson(jsonString);

List<UserModelTwo> userModelTwoFromJson(String str) => List<UserModelTwo>.from(
    json.decode(str).map((x) => UserModelTwo.fromJson(x)));

String userModelTwoToJson(List<UserModelTwo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModelTwo {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  UserModelTwo({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory UserModelTwo.fromJson(Map<String, dynamic> json) => UserModelTwo(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating?.toJson(),
      };
}

class Rating {
  double? rate;
  int? count;

  Rating({
    this.rate,
    this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}
// To parse this JSON data, do
//
//     final userModelThree = userModelThreeFromJson(jsonString);

UserModelThree userModelThreeFromJson(String str) =>
    UserModelThree.fromJson(json.decode(str));

String userModelThreeToJson(UserModelThree data) => json.encode(data.toJson());

class UserModelThree {
  String? id;
  String? createdAt;

  UserModelThree({
    this.id,
    this.createdAt,
  });

  factory UserModelThree.fromJson(Map<String, dynamic> json) => UserModelThree(
        id: json["id"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt,
      };
}
