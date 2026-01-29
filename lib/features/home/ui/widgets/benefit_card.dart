import 'package:flutter/material.dart';

class BenefitCard extends StatelessWidget {
  final String title;
  final Widget icon;

  const BenefitCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 7,
          child: Container(
            width: 190,
            height: 72,
            decoration: ShapeDecoration(
              color: const Color(0xFF404040),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        Container(
          width: 190,
          height: 72,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
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
        ),
      ],
    );
  }
}
