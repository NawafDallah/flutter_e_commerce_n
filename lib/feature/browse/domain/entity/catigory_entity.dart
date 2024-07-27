import 'package:equatable/equatable.dart';

class CatigoryEntity extends Equatable {
  final int categoryId;
  final String categoryNameEn;
  final String categoryNameAr;
  final String categoryImage;

  const CatigoryEntity({
    required this.categoryId,
    required this.categoryNameEn,
    required this.categoryNameAr,
    required this.categoryImage,
  });

  @override
  List<Object?> get props => [categoryId];
}
