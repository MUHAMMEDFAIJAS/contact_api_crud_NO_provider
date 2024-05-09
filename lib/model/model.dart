class ApiModel {
  String? name;
  String? email;
  String? address;
  dynamic phone;
  String? id;

  ApiModel({this.name, this.email, this.address, this.phone, this.id});

  ApiModel.fromJsom(Map<String, dynamic> json) {
    name = json["name"];

    email = json["email"];
    address = json["address"];
    phone = json["phone"];
    id = json["_id"];
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "address": address,
      "email": email,
      "phone": phone,
      "_id": id,
    };
  }
}
