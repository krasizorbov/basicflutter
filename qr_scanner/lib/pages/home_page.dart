import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:qr_scanner/pages/directions_page.dart';
import 'package:qr_scanner/pages/maps_page.dart';
import 'package:qr_scanner/providers/db_provider.dart';
import 'package:qr_scanner/widgets/custom_navigation_bar.dart';
import 'package:qr_scanner/widgets/scann_button.dart';

import '../providers/ui_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('History'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: const _HomeBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScannButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);
    int currentIndex = uiProvider.selectedMenuItem;
    // Read database
    final tempScan = ScanModel(value: 'https://krasizorbov.com');
    //DBProvider.db.newScan(tempScan);
    //DBProvider.db.getAllScans().then((value) => print(value.toString()));
    switch (currentIndex) {
      case 0:
        return const MapsPage();
      case 1:
        return const DirectionsPage();
      default:
        return const MapsPage();
    }
  }
}
