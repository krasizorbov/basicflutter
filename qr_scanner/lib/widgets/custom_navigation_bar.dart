import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);
    int currentIndex = uiProvider.selectedMenuItem;
    return BottomNavigationBar(
      onTap: (value) => uiProvider.selectedMenuItem = value,
      elevation: 0,
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
        BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration), label: 'Directions'),
      ],
    );
  }
}
