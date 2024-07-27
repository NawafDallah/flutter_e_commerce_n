// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  FavoriteProductDao? _favoriteProductDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `favorite_product` (`itemId` INTEGER NOT NULL, `itemNameEn` TEXT NOT NULL, `itemNameAr` TEXT NOT NULL, `itemDescEn` TEXT NOT NULL, `itemDescAr` TEXT NOT NULL, `itemImage` TEXT NOT NULL, `itemActive` INTEGER NOT NULL, `itemCount` INTEGER NOT NULL, `itemPrice` REAL NOT NULL, `itemDescount` INTEGER NOT NULL, `catogaryId` INTEGER NOT NULL, `itemType` TEXT NOT NULL, `itemBrand` TEXT NOT NULL, PRIMARY KEY (`itemId`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  FavoriteProductDao get favoriteProductDao {
    return _favoriteProductDaoInstance ??=
        _$FavoriteProductDao(database, changeListener);
  }
}

class _$FavoriteProductDao extends FavoriteProductDao {
  _$FavoriteProductDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _favoriteProductModelInsertionAdapter = InsertionAdapter(
            database,
            'favorite_product',
            (FavoriteProductModel item) => <String, Object?>{
                  'itemId': item.itemId,
                  'itemNameEn': item.itemNameEn,
                  'itemNameAr': item.itemNameAr,
                  'itemDescEn': item.itemDescEn,
                  'itemDescAr': item.itemDescAr,
                  'itemImage': item.itemImage,
                  'itemActive': item.itemActive,
                  'itemCount': item.itemCount,
                  'itemPrice': item.itemPrice,
                  'itemDescount': item.itemDescount,
                  'catogaryId': item.catogaryId,
                  'itemType': item.itemType,
                  'itemBrand': item.itemBrand
                }),
        _favoriteProductModelDeletionAdapter = DeletionAdapter(
            database,
            'favorite_product',
            ['itemId'],
            (FavoriteProductModel item) => <String, Object?>{
                  'itemId': item.itemId,
                  'itemNameEn': item.itemNameEn,
                  'itemNameAr': item.itemNameAr,
                  'itemDescEn': item.itemDescEn,
                  'itemDescAr': item.itemDescAr,
                  'itemImage': item.itemImage,
                  'itemActive': item.itemActive,
                  'itemCount': item.itemCount,
                  'itemPrice': item.itemPrice,
                  'itemDescount': item.itemDescount,
                  'catogaryId': item.catogaryId,
                  'itemType': item.itemType,
                  'itemBrand': item.itemBrand
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FavoriteProductModel>
      _favoriteProductModelInsertionAdapter;

  final DeletionAdapter<FavoriteProductModel>
      _favoriteProductModelDeletionAdapter;

  @override
  Future<List<FavoriteProductModel>> getFavoriteProduct() async {
    return _queryAdapter.queryList('SELECT * FROM favorite_product',
        mapper: (Map<String, Object?> row) => FavoriteProductModel(
            itemId: row['itemId'] as int,
            itemNameEn: row['itemNameEn'] as String,
            itemNameAr: row['itemNameAr'] as String,
            itemDescEn: row['itemDescEn'] as String,
            itemDescAr: row['itemDescAr'] as String,
            itemImage: row['itemImage'] as String,
            itemActive: row['itemActive'] as int,
            itemCount: row['itemCount'] as int,
            itemPrice: row['itemPrice'] as double,
            itemDescount: row['itemDescount'] as int,
            catogaryId: row['catogaryId'] as int,
            itemType: row['itemType'] as String,
            itemBrand: row['itemBrand'] as String));
  }

  @override
  Future<void> addProductToFavorite(FavoriteProductModel product) async {
    await _favoriteProductModelInsertionAdapter.insert(
        product, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteFavoriteProducts(
      List<FavoriteProductModel> products) async {
    await _favoriteProductModelDeletionAdapter.deleteList(products);
  }

  @override
  Future<void> deleteFavoriteProduct(FavoriteProductModel product) async {
    await _favoriteProductModelDeletionAdapter.delete(product);
  }
}
