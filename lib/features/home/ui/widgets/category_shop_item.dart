import 'package:flutter/material.dart';

class CategoryShopItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double? width;

  const CategoryShopItem({
    super.key,
    required this.title,
    required this.imageUrl,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Container(
          width: width ??125,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: textTheme.bodyMedium?.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF263238),
          ),
        ),
      ],
    );
  }
}
