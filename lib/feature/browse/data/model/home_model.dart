import '../../domain/entity/home_entity.dart';
import 'banner_model.dart';
import 'catigory_model.dart';
import 'product_model.dart';

class HomeModel extends HomeEntity {
  const HomeModel({
    required super.banners,
    required super.catigories,
    required super.featured,
    required super.popular,
  });

  factory HomeModel.fromJson(Map<String, dynamic> map) {
    return HomeModel(
      banners: List<BannerModel>.from(
          map['banners']?.map((x) => BannerModel.fromJson(x))),
      catigories: List<CatigoryModel>.from(
          map['catigories']?.map((x) => CatigoryModel.fromJson(x))),
      featured: List<ProductModel>.from(
          map['featured']?.map((x) => ProductModel.fromJson(x))),
      popular: List<ProductModel>.from(
          map['popular']?.map((x) => ProductModel.fromJson(x))),
    );
  }
}
