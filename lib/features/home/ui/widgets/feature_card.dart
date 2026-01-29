import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const FeatureCard({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Container(
        height: 85,
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(1.00, 0.50),
            end: Alignment(-0.00, 0.50),
            colors: [Colors.black.withValues(alpha: 0), Colors.black],
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.fill),
          shadows: [
            BoxShadow(
              color: Color(0xDDDDDDDD),
              blurRadius: 12,
              offset: Offset(0, 0),
              spreadRadius: 0,
            ),
          ],
        ),

        child: Container(
          padding: const EdgeInsets.all(12),
          alignment: Alignment.bottomLeft,
          child: Text(
            title,
            style: textTheme.bodyMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
