import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../../core/theme/app_theme.dart';

class HomeBannerCarousel extends StatefulWidget {
  const HomeBannerCarousel({super.key});

  @override
  State<HomeBannerCarousel> createState() => _HomeBannerCarouselState();
}

class _HomeBannerCarouselState extends State<HomeBannerCarousel> {
  int _currentIndex = 0;

  final List<Map<String, String>> _bannerData = [
    {
      'title': 'Buy Building Materials\nON The GO',
      'subtitle': 'Sale Upto 20 Off',
      'buttonText': 'Get Bulk Quote',
    },
    {
      'title': 'Best Quality Cement\nDirect From Factory',
      'subtitle': 'Starting from ₹299/bag',
      'buttonText': 'Order Now',
    },
    {
      'title': 'Premium Steel Rods\nFor Your Dream Home',
      'subtitle': 'Bulk Discounts Available',
      'buttonText': 'Get Quote',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextStyles.getTextTheme(context);
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 250.0,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: _bannerData.map((data) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: const AssetImage(
                              'assets/images/banner-1.png',
                            ),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withValues(alpha: 0.4),
                              BlendMode.darken,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              // Content
              Positioned(
                top: 32,
                left: 24,
                right: 24,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _bannerData[_currentIndex]['title']!,
                      style: textTheme.headlineLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _bannerData[_currentIndex]['subtitle']!,
                      style: textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.primaryDark,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        minimumSize: const Size(0, 48),
                      ),
                      child: Text(
                        _bannerData[_currentIndex]['buttonText']!,
                        style: textTheme.bodyLarge!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Search Icon overlay
              Positioned(
                right: 16,
                top: 32,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 28,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              // Indicators
              Positioned(
                bottom: 16,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _bannerData.asMap().entries.map((entry) {
                    return Container(
                      width: _currentIndex == entry.key ? 24.0 : 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: _currentIndex == entry.key
                            ? AppColors.primary
                            : Colors.white.withValues(alpha: 0.5),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
