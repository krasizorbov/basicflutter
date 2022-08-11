import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';

import '../utils/utils.dart';

class ScannButton extends StatelessWidget {
  const ScannButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus), onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancel', false, ScanMode.QR );
        // const barcodeScanRes = 'https://flutter.dev/';
        // final barcodeScanRes = 'geo:41.927134,25.911652';

        if ( barcodeScanRes == '-1' ) {
          return;
        }
        // ignore: use_build_context_synchronously
        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
        
        final newScan = await scanListProvider.newScan(barcodeScanRes);

        // ignore: use_build_context_synchronously
        launchURL(context, newScan);
      },
    );
  }
}
