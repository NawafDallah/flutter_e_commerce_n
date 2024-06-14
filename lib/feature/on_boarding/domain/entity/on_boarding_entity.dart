import 'package:equatable/equatable.dart';

class OnBoardingEntity extends Equatable {
  final String title;
  final String image;
  final String content;

  const OnBoardingEntity({
    required this.title,
    required this.image,
    required this.content,
  });
  
  @override
  List<Object?> get props => [title, image, content];
}
