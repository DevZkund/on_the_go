import 'package:flutter/material.dart';
import 'package:on_the_go/core/theme/app_theme.dart';

class ProductCard extends StatelessWidget {
  final String category;
  final String title;
  final String price;
  final String imageUrl;
  final String discount;

  const ProductCard({
    super.key,
    required this.category,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.discount = '15%OFF',
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: 185,
      margin: const EdgeInsets.only(right: 16, bottom: 8),
      padding: const EdgeInsets.all(4),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(14),
        ),
        shadows: [
          BoxShadow(
            color: Color(0xDDDDDDDD),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    imageUrl,
                    height: 110,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF37474F),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      discount,
                      style: textTheme.bodySmall?.copyWith(
                        color: AppColors.primary,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            category,
            style: textTheme.bodySmall?.copyWith(
              color: Colors.grey[600],
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF263238),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            price,
            style: textTheme.bodyMedium?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF263238),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.black,
              minimumSize: const Size(double.infinity, 42),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.shopping_basket_outlined, size: 18),
                const SizedBox(width: 8),
                Text(
                  'Add To Cart',
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
