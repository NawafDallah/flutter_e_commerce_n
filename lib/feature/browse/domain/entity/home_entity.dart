import 'package:equatable/equatable.dart';

import 'banners_entity.dart';
import 'catigory_entity.dart';
import '../../../../core/entities/products_entity.dart';

class HomeEntity extends Equatable {
  final List<BannerEntity> banners;
  final List<CatigoryEntity> catigories;
  final List<ProductEntity> featured;
  final List<ProductEntity> popular;

  const HomeEntity({
    required this.banners,
    required this.catigories,
    required this.featured,
    required this.popular,
  });
  @override
  List<Object?> get props => [banners, catigories];
}
