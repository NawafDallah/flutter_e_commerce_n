import '../../../../core/entities/products_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.itemId,
    required super.itemNameEn,
    required super.itemNameAr,
    required super.itemDescEn,
    required super.itemDescAr,
    required super.itemImage,
    required super.itemActive,
    required super.itemCount,
    required super.itemPrice,
    required super.itemDescount,
    required super.catogaryId,
    required super.itemType,
    required super.itemBrand,
  });

  Map<String, dynamic> toJson() {
    return {
      'item_id': itemId,
      'item_name_en': itemNameEn,
      'item_name_ar': itemNameAr,
      'item_desc_en': itemDescEn,
      'item_desc_ar': itemDescAr,
      'item_image': itemImage,
      'item_active': itemActive,
      'item_count': itemCount,
      'item_price': itemPrice,
      'item_descount': itemDescount,
      'catogary_id': catogaryId,
      'item_type': itemType,
      'item_brand': itemBrand,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      itemId: map['item_id'] ?? 0,
      itemNameEn: map['item_name_en'] ?? '',
      itemNameAr: map['item_name_ar'] ?? '',
      itemDescEn: map['item_desc_en'] ?? '',
      itemDescAr: map['item_desc_ar'] ?? '',
      itemImage: map['item_image'] ?? '',
      itemActive: map['item_active'] ?? 0,
      itemCount: map['item_count'] ?? 0,
      itemPrice: map['item_price'] ?? 0.0,
      itemDescount: map['item_descount'] ?? 0,
      catogaryId: map['catogary_id'] ?? 0,
      itemType: map['item_type'] ?? '',
      itemBrand: map['item_brand'] ?? '',
    );
  }
}
