import 'package:flutter/material.dart';

import 'widgets/custom_bottom_nav_bar.dart';

class HomeLayoutView extends StatelessWidget {
  const HomeLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: CustomBottomNavBar());
  }
}
