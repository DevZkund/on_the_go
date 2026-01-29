import 'package:flutter/material.dart';
import 'package:on_the_go/features/main/ui/main_screen.dart';
import '../../../core/responsive/responsive_layout.dart';
import 'tablet_home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: MainScreen(),
      tablet: TabletHomeView(),
    );
  }
}
