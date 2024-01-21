class UserModel {
  String? userId;
  String? email;
  String? name;
  String? phone;
  String? pic;
  bool isEmailVerified;

  UserModel({
    this.userId,
    this.name,
    this.email,
    this.phone,
    this.pic,
    bool? isEmailVerified,
  }) : isEmailVerified = isEmailVerified ?? false;

  UserModel.fromJson(Map<String, dynamic> map)
      : userId = map['userId'],
        email = map['email'],
        name = map['name'],
        pic = map['pic'],
        phone = map['phone'],
        isEmailVerified = map['isEmailVerified'] ?? false;

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
      'phone': phone,
      'isEmailVerified': isEmailVerified,
    };
  }
}
