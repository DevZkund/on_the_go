import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.only(
              top: 60,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=1974&auto=format&fit=crop',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Kundan',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(width: 4),
                          SvgPicture.asset(
                            'assets/icons/edit.svg',
                            width: 18,
                            height: 18,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '+91 999999999',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Navigation Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(
                  iconPath: 'assets/icons/home.svg',
                  label: 'Home',
                  isSelected: true,
                  onTap: () => Navigator.pop(context),
                ),
                _buildDrawerItem(
                  iconPath: 'assets/icons/order.svg',
                  label: 'Orders',
                  onTap: () {},
                ),
                _buildDrawerItem(
                  icon: Icons.location_on_outlined,
                  label: 'Change address',
                  onTap: () {},
                ),
                _buildDrawerItem(
                  icon: Icons.info_outline,
                  label: 'About',
                  onTap: () {},
                ),
                _buildDrawerItem(
                  icon: Icons.policy_outlined,
                  label: 'Privacy Policy',
                  onTap: () {},
                ),
                _buildDrawerItem(
                  icon: Icons.headset_mic_outlined,
                  label: 'Help',
                  onTap: () {},
                ),
                _buildDrawerItem(
                  iconPath: 'assets/icons/setting.svg',
                  label: 'Settings',
                  onTap: () {},
                ),
                const Divider(),
                _buildDrawerItem(
                  icon: Icons.power_settings_new,
                  label: 'Logout',
                  textColor: Colors.red,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    String? iconPath,
    IconData? icon,
    required String label,
    required VoidCallback onTap,
    bool isSelected = false,
    Color? textColor,
  }) {
    return Container(
      color: isSelected ? Colors.grey[100] : Colors.transparent,
      child: ListTile(
        leading: iconPath != null
            ? SvgPicture.asset(
                iconPath,
                width: 22,
                height: 22,
                colorFilter: ColorFilter.mode(
                  textColor ??
                      (isSelected ? Colors.black87 : Colors.grey[700]!),
                  BlendMode.srcIn,
                ),
              )
            : Icon(icon, color: textColor ?? Colors.grey[700]),
        title: Text(
          label,
          style: TextStyle(
            color: textColor ?? Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        onTap: onTap,
        dense: true,
      ),
    );
  }
}
