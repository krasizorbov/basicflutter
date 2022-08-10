import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScannButton extends StatelessWidget {
  const ScannButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus), onPressed: () async {
        //String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancel', false, ScanMode.QR );
        const barcodeScanRes = 'https://fernando-herrera.com';
        // final barcodeScanRes = 'geo:45.287135,-75.920226';

        if ( barcodeScanRes == '-1' ) {
          return;
        }
      },
    );
  }
}
