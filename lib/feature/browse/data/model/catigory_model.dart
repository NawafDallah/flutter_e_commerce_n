import '../../domain/entity/catigory_entity.dart';

class CatigoryModel extends CatigoryEntity {
  const CatigoryModel({
    required super.categoryId,
    required super.categoryNameEn,
    required super.categoryNameAr,
    required super.categoryImage,
  });

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'category_name_en': categoryNameEn,
      'category_name_ar': categoryNameAr,
      'category_image': categoryImage,
    };
  }

  factory CatigoryModel.fromJson(Map<String, dynamic> map) {
    return CatigoryModel(
      categoryId: map['category_id'] ?? 0,
      categoryNameEn: map['category_name_en'] ?? '',
      categoryNameAr: map['category_name_ar'] ?? '',
      categoryImage: map['category_image'] ?? '',
    );
  }

  factory CatigoryModel.fromEntity(CatigoryEntity entity) {
    return CatigoryModel(
      categoryNameEn: entity.categoryNameEn,
      categoryNameAr: entity.categoryNameAr,
      categoryImage: entity.categoryImage,
      categoryId: entity.categoryId,
    );
  }
}
