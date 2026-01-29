import 'package:flutter/material.dart';
import 'package:on_the_go/core/theme/app_theme.dart';

class TrackOrderCard extends StatelessWidget {
  const TrackOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE5E5E5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Track Your Order',
            style: textTheme.headlineLarge?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF263238),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 54,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.only(left: 16, right: 4),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Order ID',
                      hintStyle: textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
                Container(
                  height: 46,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Track',
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Get live updates of your ongoing orders',
            style: textTheme.bodyMedium?.copyWith(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
