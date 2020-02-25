class Neighborhood {
  String id;
  String neighborhoodname;
  String address;

  Neighborhood({
    this.id,
    this.neighborhoodname,
    this.address,
  });

  factory Neighborhood.fromJson(Map<String, dynamic> json) => Neighborhood(
        id: json["_id"],
        neighborhoodname: json["neighborhoodname"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "neighborhoodname": neighborhoodname,
        "address": address,
      };
}
