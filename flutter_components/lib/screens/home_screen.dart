import 'package:flutter/material.dart';
import 'package:flutter_components/router/app_routes.dart';
import 'package:flutter_components/themes/app.theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Components in Flutter')),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(
                AppRoutes.menuOptions[index].icon,
                color: AppTheme.primary
                ),
              title: Text(AppRoutes.menuOptions[index].name),
              trailing: const Icon(Icons.arrow_circle_right_outlined,
                  color: AppTheme.primary),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.menuOptions[index].route);
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
          itemCount: AppRoutes.menuOptions.length),
    );
  }
}
