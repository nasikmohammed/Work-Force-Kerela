class UserModel {
  String? id;
  String? firstname;
  String? email;
  String? lastname;
  String? country;
  String? address;
  String? martialstatus;
  String? aadharnumber;
  String? city;
  String? contactnumber;

  UserModel({
    this.firstname,
    this.email,
    this.lastname,
    this.address,
    this.city,
    this.aadharnumber,
    this.martialstatus,
    this.country,
    this.contactnumber,
    this.id,
  });

  Map<String, dynamic> toJson(docId) => {
        "firstname": firstname,
        "lastname": lastname,
        "country": country,
        "id": docId,
        "address": address,
        "city": city,
        "email": email,
        "aahaarnumber": aadharnumber,
        "martialstatus": martialstatus,
        "contactnumber": contactnumber
      };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        contactnumber: json["contactnumber"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        country: json["country"],
        address: json["address"],
        city: json["city"],
        email: json["email"],
        aadharnumber: json["aahaarnumber"],
        martialstatus: json["martialstatus"],
        id: json["id"]);
  }
}
