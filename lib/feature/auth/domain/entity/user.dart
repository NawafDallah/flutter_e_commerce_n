import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? userId;
  final String userName;
  final String userEmail;
  final int userPhone;
  final String userPassword;
  final int? userApproved;
  final String? userDateCreate;

  const UserEntity({
    this.userId,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.userPassword,
    this.userApproved,
    this.userDateCreate,
  });

  @override
  List<Object?> get props => [userId, userEmail, userPhone];
}
