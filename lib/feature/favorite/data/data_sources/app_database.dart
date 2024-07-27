import 'package:floor/floor.dart';

import '../model/favorite_product_model.dart';
import 'DAO/favorite_product_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'app_database.g.dart';

@Database(version: 1, entities: [FavoriteProductModel])
abstract class AppDatabase extends FloorDatabase {
  FavoriteProductDao get favoriteProductDao;
}
