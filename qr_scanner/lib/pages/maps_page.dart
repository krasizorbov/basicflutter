import 'package:flutter/material.dart';
import 'package:qr_scanner/widgets/scan_list_tiles.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScanListTiles(icon: Icons.map_rounded, type: 'http');
  }
}
