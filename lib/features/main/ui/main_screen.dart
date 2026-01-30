import 'package:flutter/material.dart';
import 'package:on_the_go/core/theme/app_theme.dart';
import 'package:on_the_go/features/home/ui/drawer/home_drawer.dart';
import 'package:on_the_go/features/home/ui/mobile_home_view.dart';
import 'package:on_the_go/features/home/ui/tablet_home_view.dart';
import 'package:on_the_go/core/responsive/responsive_layout.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 2;

  Widget _buildPage(int index, bool isTablet) {
    switch (index) {
      case 0:
        return const PlaceholderPage(title: 'Orders');
      case 1:
        return const PlaceholderPage(title: 'Cart');
      case 2:
        return isTablet ? const TabletHomeView() : const MobileHomeView();
      case 3:
        return const PlaceholderPage(title: 'Quotes');
      case 4:
        return const PlaceholderPage(title: 'Profile');
      default:
        return const MobileHomeView();
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet = ResponsiveLayout.isTablet(context);

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.background,
      drawer: const HomeDrawer(),
      body: SafeArea(top: false, child: _buildPage(_currentIndex, isTablet)),
      bottomNavigationBar: SafeArea(
        top: false,
        child: CurvedNavigationBar(
          index: _currentIndex,
          height: isTablet ? 85 : 75,
          items: [
            _buildNavItem('assets/icons/orders-2.png', 'Orders', 0),
            _buildNavItem('assets/icons/cart.png', 'Cart', 1),
            _buildNavItem('assets/icons/home-2.png', 'Home', 2),
            _buildNavItem('assets/icons/quotes.png', 'Quotes', 3),
            _buildNavItem('assets/icons/profile.png', 'Profile', 4),
          ],
          color: AppColors.primary,
          buttonBackgroundColor: AppColors.primaryDark,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }

  CurvedNavigationBarItem _buildNavItem(String asset, String label, int index) {
    return CurvedNavigationBarItem(
      child: Image.asset(
        asset,
        width: 26,
        height: 26,
        color: _currentIndex == index
            ? AppColors.primary
            : AppColors.primaryDark,
      ),
      label: label,
      labelStyle: TextStyle(
        fontSize: 12,
        fontWeight: _currentIndex == index
            ? FontWeight.bold
            : FontWeight.normal,
        color: AppColors.primaryDark,
        fontFamily: 'Poppins',
      ),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  final String title;

  const PlaceholderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _getIconForTitle(title),
                size: 48,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 16),
              Text(
                '$title Page',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(
                'This is a placeholder for future implementation.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIconForTitle(String title) {
    switch (title) {
      case 'Orders':
        return Icons.list_alt;
      case 'Cart':
        return Icons.shopping_cart;
      case 'Quotes':
        return Icons.format_quote;
      case 'Profile':
        return Icons.person;
      default:
        return Icons.pages;
    }
  }
}
