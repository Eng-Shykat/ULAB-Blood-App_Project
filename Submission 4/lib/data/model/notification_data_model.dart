class NotificationDataModel {
  NotificationDataModel({
    required this.id,
    required this.userId,
    required this.donorId,
    required this.userName,
    required this.location,
    required this.urgency,
    required this.bloodGroup,
    required this.amountOfBlood,
    required this.createdAt,
  });

  String? id;
  String userId;
  String donorId;
  String userName;
  String location;
  String urgency;
  String bloodGroup;
  String amountOfBlood;
  String createdAt;

  factory NotificationDataModel.fromMap(Map<String, dynamic> json) =>
      NotificationDataModel(
        id: json["id"],
        userId: json["userId"],
        donorId: json["donorId"],
        userName: json["userName"],
        location: json["location"],
        urgency: json["urgency"],
        bloodGroup: json["bloodGroup"],
        amountOfBlood: json["amountOfBlood"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "userId": userId,
        "donorId": donorId,
        "userName": userName,
        "location": location,
        "urgency": urgency,
        "bloodGroup": bloodGroup,
        "amountOfBlood": amountOfBlood,
        "createdAt": createdAt,
      };
}
