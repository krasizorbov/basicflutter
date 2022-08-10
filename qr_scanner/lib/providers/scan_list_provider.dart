import 'package:flutter/material.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:qr_scanner/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier{
  List<ScanModel> scans = [];
  String selectedType = '';

  Future<ScanModel> newScan( String value ) async {
    final newScan = ScanModel(value: value);
    final id = await DBProvider.db.newScan(newScan);
    // Assign the value of the id to the model
    newScan.id = id;

    if ( selectedType == newScan.type ) {
      scans.add(newScan);
      notifyListeners();
    }
    return newScan;
  }

  getScans() async {
    List<ScanModel> allScans = await DBProvider.db.getAllScans();
    scans = [...allScans];
    notifyListeners();
  }

  getScanByType( String type ) async {
    List<ScanModel> allScans = await DBProvider.db.getScansByType(type);
    scans = [...allScans];
    selectedType = type;
    notifyListeners();
  }

  deleteAll() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  deleteScanById( int id ) async {
    await DBProvider.db.deleteScan(id);
  }

}