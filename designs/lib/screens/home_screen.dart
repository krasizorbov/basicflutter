import 'package:designs/widgets/background.dart';
import 'package:designs/widgets/card_table.dart';
import 'package:designs/widgets/custom_bottom_navigation_bar.dart';
import 'package:designs/widgets/page_title.dart';
import 'package:flutter/material.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [Background(), _HomeBody()],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          PageTitle(),
          CardTable()
        ],
      ),
    );
  }
}
