import 'package:flutter/material.dart';
import 'package:on_the_go/core/theme/app_theme.dart';

class BenefitCard extends StatelessWidget {
  final String title;
  final Widget icon;

  const BenefitCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF263238),
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(width: 40, height: 40, child: icon),
        ],
      ),
    );
  }
}
