class Hotel {
  final String id;
  final String name;
  final String description;
  final List<String> images;
  final double rating;
  final int reviewCount;
  final int pricePerNight;
  final Location location;
  final int maxOccupancy;
  final String city;
  final String country;
  final String address;
  final BedType bedType;
  final List<String> amenities;

  Hotel({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.rating,
    required this.reviewCount,
    required this.pricePerNight,
    required this.location,
    required this.maxOccupancy,
    required this.city,
    required this.country,
    required this.address,
    required this.bedType,
    required this.amenities,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    images: List<String>.from(json["images"].map((x) => x)),
    rating: json["rating"].toDouble(),
    reviewCount: json["reviewCount"],
    pricePerNight: json["pricePerNight"],
    location: Location.fromJson(json["location"]),
    maxOccupancy: json["maxOccupancy"],
    city: json["city"],
    country: json["country"],
    address: json["address"],
    bedType: BedType.fromJson(json["bedType"]),
    amenities: List<String>.from(json["amenities"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "images": List<dynamic>.from(images.map((x) => x)),
    "rating": rating,
    "reviewCount": reviewCount,
    "pricePerNight": pricePerNight,
    "location": location.toJson(),
    "maxOccupancy": maxOccupancy,
    "city": city,
    "country": country,
    "address": address,
    "bedType": bedType.toJson(),
    "amenities": List<dynamic>.from(amenities.map((x) => x)),
  };
}

class BedType {
  final String type;
  final int count;
  final String details;

  BedType({required this.type, required this.count, required this.details});

  factory BedType.fromJson(Map<String, dynamic> json) => BedType(
    type: json["type"],
    count: json["count"],
    details: json["details"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "count": count,
    "details": details,
  };
}

class Location {
  final double latitude;
  final double longitude;

  Location({required this.latitude, required this.longitude});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}
