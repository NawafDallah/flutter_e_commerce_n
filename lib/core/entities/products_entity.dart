import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int itemId;
  final String itemNameEn;
  final String itemNameAr;
  final String itemDescEn;
  final String itemDescAr;
  final String itemImage;
  final int itemActive;
  final int itemCount;
  final double itemPrice;
  final int itemDescount;
  final int catogaryId;
  final String itemType;
  final String itemBrand;

  const ProductEntity({
    required this.itemId,
    required this.itemNameEn,
    required this.itemNameAr,
    required this.itemDescEn,
    required this.itemDescAr,
    required this.itemImage,
    required this.itemActive,
    required this.itemCount,
    required this.itemPrice,
    required this.itemDescount,
    required this.catogaryId,
    required this.itemType,
    required this.itemBrand,
  });

  @override
  List<Object?> get props => [itemId];
}
