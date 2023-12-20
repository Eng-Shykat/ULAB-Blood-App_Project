class PostDataModel {
   String? id;
   String userName;
   String location;
   String urgency;
   String bloodGroup;
   String amountOfBlood;
   String userId;
  //  String imageUrl;
   String createdAt;

  PostDataModel({
    this.id,
    required this.userName,
    required this.location,
    required this.urgency,
    required this.bloodGroup,
    required this.amountOfBlood,
    required this.userId,
    // required this.imageUrl,
    required this.createdAt,
  });

  factory PostDataModel.fromJson(Map<String, dynamic> json) {
    return PostDataModel(
      id: json['id'],
      userName: json['userName'],
      location: json['location'],
      urgency: json['urgency'],
      bloodGroup: json['bloodGroup'],
      amountOfBlood: json['amountOfBlood'],
      userId: json['userId'],
      // imageUrl: json['imageUrl'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'location': location,
      'urgency': urgency,
      'bloodGroup': bloodGroup,
      'amountOfBlood': amountOfBlood,
      'userId': userId,
      // 'imageUrl': imageUrl,
      'createdAt': createdAt,
    };
  }
}
