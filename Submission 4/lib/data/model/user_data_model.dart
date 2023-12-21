class UserDataModel {
  String? id;
  String name;
  String email;
  String phone;
  String gender;
  String dateOfBirth;
  String address;
  String bloodGroup;
  bool? donatedBefore;
  String? lastDonatedDate;
  bool hasAnyBloodDiseaseBefore;

  UserDataModel({this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.dateOfBirth,
    required this.address,
    required this.bloodGroup,
    this.donatedBefore,
    this.lastDonatedDate,
    required this.hasAnyBloodDiseaseBefore});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "gender": gender,
      "dateOfBirth": dateOfBirth,
      "address": address,
      "bloodGroup": bloodGroup,
      "donatedBefore": donatedBefore,
      "lastDonatedDate": lastDonatedDate,
      "hasAnyBloodDiseaseBefore": hasAnyBloodDiseaseBefore,
    };
  }

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      gender: json['gender'],
      dateOfBirth: json['dateOfBirth'],
      lastDonatedDate: json['lastDonatedDate'],
      address: json['address'],
      bloodGroup: json['bloodGroup'],
      hasAnyBloodDiseaseBefore: json['hasAnyBloodDiseaseBefore'],
    );
  }
}
