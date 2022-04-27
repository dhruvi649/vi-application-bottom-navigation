import 'package:flutter/material.dart';
import 'package:vi_application/widgets/body.dart';
import 'package:vi_application/widgets/bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: Body(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
