import 'package:flutter/material.dart';
import 'package:qr_scanner/widgets/scan_list_tiles.dart';

class DirectionsPage extends StatelessWidget {
  const DirectionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScanListTiles(icon: Icons.directions, type: 'geo');
  }
}
