import 'package:equatable/equatable.dart';

class BannerEntity extends Equatable {
  final String bannerName;
  final String bannerImage;
  final String bannerSection;

  const BannerEntity({
    required this.bannerName,
    required this.bannerImage,
    required this.bannerSection,
  });

  @override
  List<Object?> get props => [bannerImage];
}
