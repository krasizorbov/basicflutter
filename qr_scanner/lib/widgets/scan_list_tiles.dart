import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/utils/utils.dart';

class ScanListTiles extends StatelessWidget {
  final IconData icon;
  final String type;
  const ScanListTiles({Key? key, required this.icon, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    return ListView.builder(
        itemCount: scanListProvider.scans.length,
        itemBuilder: (context, index) => Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                scanListProvider
                    .deleteScanById(scanListProvider.scans[index].id!);
              },
              background: Container(
                color: Colors.red,
              ),
              child: ListTile(
                leading: Icon(
                  icon,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(scanListProvider.scans[index].value),
                subtitle: Text(scanListProvider.scans[index].id.toString()),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  launchURL(context, scanListProvider.scans[index]);
                },
              ),
            ));
  }
}
