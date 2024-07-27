import '../../domain/entity/banners_entity.dart';

class BannerModel extends BannerEntity {
  const BannerModel({
    required super.bannerName,
    required super.bannerImage,
    required super.bannerSection,
  });

  Map<String, dynamic> toJson() {
    return {
      'banner_name': bannerName,
      'banner_image': bannerImage,
      'banner_section': bannerSection,
    };
  }

  factory BannerModel.fromJson(Map<String, dynamic> map) {
    return BannerModel(
      bannerName: map['banner_name'] ?? '',
      bannerImage: map['banner_image'] ?? '',
      bannerSection: map['banner_section'] ?? '',
    );
  }

  factory BannerModel.fromEntity(BannerEntity entity) {
    return BannerModel(
      bannerName: entity.bannerName,
      bannerImage: entity.bannerImage,
      bannerSection: entity.bannerSection,
    );
  }
}
