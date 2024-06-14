import '../../domain/entity/user.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.userName,
    required super.userEmail,
    required super.userPhone,
    required super.userPassword,
    super.userId,
    super.userApproved,
    super.userDateCreate,
  });

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'user_name': userName,
      'user_email': userEmail,
      'user_phone': userPhone,
      'user_password': userPassword,
      'user_approved': userApproved,
      'user_date_create': userDateCreate
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'] ?? 0,
      userName: json['user_name'] ?? '',
      userEmail: json['user_email'] ?? '',
      userPhone: json['user_phone'] ?? 0,
      userPassword: json['user_password'] ?? '',
      userApproved: json['user_approved'] ?? 0,
      userDateCreate: json['user_date_create'] ?? '',
    );
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      userId: entity.userId,
      userName: entity.userName,
      userEmail: entity.userEmail,
      userPhone: entity.userPhone,
      userPassword: entity.userPassword,
      userApproved: entity.userApproved,
      userDateCreate: entity.userDateCreate,
    );
  }
}
