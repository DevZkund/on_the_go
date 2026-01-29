import 'package:flutter/material.dart';
import '../../../core/responsive/responsive_layout.dart';
import 'mobile_home_view.dart';
import 'tablet_home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: MobileHomeView(),
      tablet: TabletHomeView(),
    );
  }
}
