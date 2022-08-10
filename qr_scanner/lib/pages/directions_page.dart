import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';

class DirectionsPage extends StatelessWidget {
  const DirectionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    return ListView.builder(
      itemCount: scanListProvider.scans.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(
          Icons.map,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(scanListProvider.scans[index].value),
        subtitle: Text(scanListProvider.scans[index].id.toString()),
        trailing: const Icon(Icons.keyboard_arrow_right),
        onTap: () {
          print('open something');
        },
      ),
    );
  }
}
