import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shahin_task/manager/home_cubit.dart/home_model.dart';

class LocalDatabaseHelper {
  static final LocalDatabaseHelper _instance = LocalDatabaseHelper._internal();
  factory LocalDatabaseHelper() => _instance;
  LocalDatabaseHelper._internal();

  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDatabase();
    return _db!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'products.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE products(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            imagePath TEXT,
            newPrice TEXT,
            oldPrice TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertProduct(HomeModel product) async {
    final db = await database;
    return await db.insert('products', product.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> insertProducts(List<HomeModel> products) async {
    final db = await database;
    final batch = db.batch();
    for (var product in products) {
      batch.insert('products', product.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit(noResult: true);
  }

  Future<List<HomeModel>> getProducts() async {
    final db = await database;
    final result = await db.query('products');
    return result.map((e) => HomeModel.fromJson(e)).toList();
  }

  Future<void> clearProducts() async {
    final db = await database;
    await db.delete('products');
  }

  Future<void> deleteDatabaseFile() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'products.db');
    await deleteDatabase(path);
  }
}
