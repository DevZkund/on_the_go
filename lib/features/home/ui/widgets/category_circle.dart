import 'package:flutter/material.dart';
import 'package:on_the_go/core/theme/app_theme.dart';

class CategoryCircle extends StatelessWidget {
  final String title;
  final String? imageUrl;
  final VoidCallback? onTap;

  const CategoryCircle({
    super.key,
    required this.title,
    this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextStyles.getTextTheme(context);
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 85,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 75,
              height: 75,
              decoration: ShapeDecoration(
                color: const Color(0xFFF5F5F5),
                image: DecorationImage(
                  image: AssetImage(imageUrl!),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(39),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.visible,
              style: textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
