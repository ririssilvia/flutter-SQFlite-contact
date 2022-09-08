import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:sqlite_crud/models/kontak.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper._internal();
  static Database? _database;

  // inisialisasi beberapa variabel yang dibutuhkan
  final String tableName = 'tableKontak';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnMobileNo = 'mobileNo';
  final String columnEmail = 'email';
  final String columnCompany = 'company';

  DbHelper._internal();
  factory DbHelper() => _instance;

  // cek apakah database ada
  Future<Database?> get _db async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDb();
    return _database;
  }

  // Pembuatan database dengan nama kontak.db, SQLite versi 1, query onCreate
  Future<Database?> _initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'kontak.db');

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  // Membuat tabel dan field-fieldnya
  Future<void> _onCreate(Database db, int version) async {
    var sql = "CREATE TABLE $tableName"
        "($columnId INTEGER PRIMARY KEY, "
        "$columnName TEXT,"
        "$columnMobileNo TEXT, "
        "$columnEmail TEXT,"
        "$columnCompany TEXT)";
    await db.execute(sql);
  }

  // Insert data ke dalam tabel database
  Future<int?> saveKontak(Kontak kontak) async {
    var dbClient = await _db;
    var result = await dbClient!.insert(tableName, kontak.toMap());
    return result;
  }

  // Read data dari tabel database
  Future<List?> getAllKontak() async {
    var dbClient = await _db;
    var result = await dbClient!.query(tableName, columns: [
      columnId,
      columnName,
      columnMobileNo,
      columnEmail,
      columnCompany
    ]);
    return result.toList();
  }

  // update data berdasarkan id
  Future<int?> updateKontak(Kontak kontak) async {
    var dbClient = await _db;
    return await dbClient!.update(tableName, kontak.toMap(),
        where: '$columnId = ?', whereArgs: [kontak.id]);
  }

  // Hapus data berdasarkan id
  Future<int?> deleteKontak(int id) async {
    var dbClient = await _db;
    return await dbClient!
        .delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}