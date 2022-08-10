
import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';




class DBProvider {

  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database?> get database async {
    if ( _database != null ) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async{
    // Phisical path to the database using path provider dependency
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join( documentsDirectory.path, 'ScansDB.db' );
    print( path );

    // Create database using SQFlite dependency
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) { },
      onCreate: ( Database db, int version ) async {
        await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            type TEXT,
            value TEXT
          )
        ''');
      }
    );
  }

  // First way of adding an entity to the database
  Future<int> newScanRaw( ScanModel newScan ) async {
    final id    = newScan.id;
    final type  = newScan.type;
    final value = newScan.value;

    // Verify the database
    final db = await database;

    final res = await db!.rawInsert('''
      INSERT INTO Scans( id, type, value )
        VALUES( $id, '$type', '$value' )
    ''');
    return res;
  }

  // Second way of adding an entity to the database
  Future<int> newScan( ScanModel newScan ) async {
    final db = await database;
    final res = await db!.insert('Scans', newScan.toJson() );
    // Returns the last id of the entity created;
    return res;
  }

  Future<ScanModel?> getScanById( int id ) async {

    final db  = await database;
    final res = await db!.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? ScanModel.fromJson( res.first ) : null;
  }

  Future<List<ScanModel>> getAllScans() async {
    final db  = await database;
    final res = await db!.query('Scans');

    return res.isNotEmpty ? res.map( (s) => ScanModel.fromJson(s) ).toList() : [];
  }

  Future<List<ScanModel>> getScansByType( String type ) async {
    final db  = await database;
    final res = await db!.rawQuery('''
      SELECT * FROM Scans WHERE type = '$type'    
    ''');

    return res.isNotEmpty ? res.map( (s) => ScanModel.fromJson(s) ).toList() : [];
  }

  Future<int> updateScan( ScanModel newScan ) async {
    final db  = await database;
    final res = await db!.update('Scans', newScan.toJson(), where: 'id = ?', whereArgs: [ newScan.id ] );
    return res;
  }

  Future<int> deleteScan( int id ) async {
    final db  = await database;
    final res = await db!.delete( 'Scans', where: 'id = ?', whereArgs: [id] );
    return res;
  }

  Future<int> deleteAllScans() async {
    final db  = await database;
    final res = await db!.rawDelete('''
      DELETE FROM Scans    
    ''');
    return res;
  }
}