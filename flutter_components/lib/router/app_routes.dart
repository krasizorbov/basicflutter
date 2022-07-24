import 'package:flutter/material.dart';
import '../models/models.dart';
import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';
  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'listview1', name: 'List View type 1', screen: const Listview1Screen(), icon: Icons.list_alt_rounded),
    MenuOption(
        route: 'listview2', name: 'List View type 2', screen: const Listview2Screen(), icon: Icons.list_alt_rounded),
    MenuOption(route: 'alert', name: 'Alert', screen: const AlertScreen(), icon: Icons.dangerous_outlined),
    MenuOption(route: 'card', name: 'Card', screen: const CardScreen(), icon: Icons.card_membership_rounded),
    MenuOption(
        route: 'avatar', name: 'Avatar', screen: const AvatarScreen(), icon: Icons.supervised_user_circle_outlined),
    MenuOption(
        route: 'animated',
        name: 'Animated Container',
        screen: const AnimatedScreen(),
        icon: Icons.play_circle_outline_rounded),
    MenuOption(route: 'inputs', name: 'Text Inputs', screen: const InputsScreen(), icon: Icons.input_rounded),
    MenuOption(route: 'slider', name: 'Slider and Checks', screen: const SliderScreen(), icon: Icons.reorder_rounded),
    MenuOption(
        route: 'listviewbuilder',
        name: 'Infinite Scroll And Pull Refresh',
        screen: const ListViewBuilderScreen(),
        icon: Icons.reorder_rounded),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});

    for (final element in menuOptions) {
      appRoutes.addAll({element.route: (BuildContext context) => element.screen});
    }
    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const Listview2Screen());
  }
}
