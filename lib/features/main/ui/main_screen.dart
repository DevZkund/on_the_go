import 'package:flutter/material.dart';
import 'package:on_the_go/core/theme/app_theme.dart';
import 'package:on_the_go/features/home/ui/drawer/home_drawer.dart';
import 'package:on_the_go/features/home/ui/mobile_home_view.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 2;

  final List<Widget> _pages = [
    const PlaceholderPage(title: 'Orders'),
    const PlaceholderPage(title: 'Cart'),
    const MobileHomeView(),
    const PlaceholderPage(title: 'Quotes'),
    const PlaceholderPage(title: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 75,
        items: [
          CurvedNavigationBarItem(
            child: _buildIcon('assets/icons/orders-2.png', 0),
            label: 'Orders',
            labelStyle: _labelStyle(0),
          ),
          CurvedNavigationBarItem(
            child: _buildIcon('assets/icons/cart.png', 1),
            label: 'Cart',
            labelStyle: _labelStyle(1),
          ),
          CurvedNavigationBarItem(
            child: _buildIcon('assets/icons/home-2.png', 2),
            label: 'Home',
            labelStyle: _labelStyle(2),
          ),
          CurvedNavigationBarItem(
            child: _buildIcon('assets/icons/quotes.png', 3),
            label: 'Quotes',
            labelStyle: _labelStyle(3),
          ),
          CurvedNavigationBarItem(
            child: _buildIcon('assets/icons/profile.png', 4),
            label: 'Profile',
            labelStyle: _labelStyle(4),
          ),
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
    );
  }

  Widget _buildIcon(String asset, int index) {
    return Image.asset(
      asset,
      width: 26,
      height: 26,
      color: _currentIndex == index ? AppColors.primary : AppColors.primaryDark,
    );
  }

  TextStyle _labelStyle(int index) {
    return TextStyle(
      fontSize: 12,
      fontWeight: _currentIndex == index ? FontWeight.bold : FontWeight.normal,
      color: AppColors.primaryDark,
      fontFamily: 'Poppins',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _getIconForTitle(title),
              size: 80,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 16),
            Text(
              '$title Page',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('This is a placeholder for future implementation.'),
          ],
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
