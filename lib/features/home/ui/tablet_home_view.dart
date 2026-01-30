import 'package:flutter/material.dart';

import 'widgets/home_app_bar.dart';
import 'widgets/home_banner_carousel.dart';
import 'widgets/category_circle.dart';
import 'widgets/track_order_card.dart';
import 'widgets/feature_card.dart';
import 'widgets/section_header.dart';
import 'widgets/category_shop_item.dart';
import 'widgets/bulk_quote_banner.dart';
import 'widgets/benefit_card.dart';
import 'widgets/product_card.dart';
import 'widgets/search_bar_widget.dart';

const List<CategoryCircle> _categories = [
  CategoryCircle(
    title: "Site Supplies",
    imageUrl: "assets/images/circle_img-1.png",
  ),
  CategoryCircle(title: "RCC", imageUrl: "assets/images/circle_img-2.png"),
  CategoryCircle(
    title: "Finishing",
    imageUrl: "assets/images/circle_img-3.png",
  ),
  CategoryCircle(title: "MEP", imageUrl: "assets/images/circle_img-4.png"),
  CategoryCircle(title: "Safety", imageUrl: "assets/images/circle_img-1.png"),
  CategoryCircle(
    title: "Interiors",
    imageUrl: "assets/images/circle_img-2.png",
  ),
];

class TabletHomeView extends StatelessWidget {
  const TabletHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF5F6FA,
      ), // 🔴 important: visible background
      body: CustomScrollView(
        slivers: [
          const HomeAppBar(),
          const HomeBannerCarousel(),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      const SizedBox(height: 32),

                      /// Categories
                      SizedBox(
                        height: 160,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          itemCount: _categories.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 32),
                          itemBuilder: (context, index) => _categories[index],
                        ),
                      ),

                      const SizedBox(height: 24),

                      /// Search Bar
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: SearchBarWidget(),
                      ),

                      const SizedBox(height: 32),

                      /// Feature Cards (FIXED OVERFLOW)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(child: TrackOrderCard()),
                            const SizedBox(width: 24),
                            const Expanded(
                              child: Column(
                                children: [
                                  FeatureCard(
                                    title: 'Bulk\nConstruction',
                                    imageUrl: 'assets/images/card-1.png',
                                  ),
                                  SizedBox(height: 24),
                                  FeatureCard(
                                    title: 'Tools &\nConsumables',
                                    imageUrl: 'assets/images/card-2.png',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),

                      /// Shop by Category
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: SectionHeader(
                          title: 'Shop By Category',
                          onViewAll: () {},
                        ),
                      ),

                      SizedBox(
                        height: 110,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          shrinkWrap: true,

                          children: [
                            CategoryShopItem(
                              title: 'Cement',
                              imageUrl: 'assets/images/card-1.png',
                              width: 200,
                            ),
                            const SizedBox(width: 24),
                            CategoryShopItem(
                              title: 'Steel & TMT Bars',
                              imageUrl: 'assets/images/steel_cat.png',
                              width: 200,
                            ),
                            const SizedBox(width: 24),
                            CategoryShopItem(
                              title: 'Bricks & Blocks',
                              imageUrl: 'assets/images/bricks_cat.png',
                              width: 200,
                            ),
                            const SizedBox(width: 24),
                            CategoryShopItem(
                              title: 'Bricks & Blocks',
                              imageUrl: 'assets/images/bricks_cat.png',
                              width: 200,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),

                      /// Bulk Quote
                      const BulkQuoteBanner(),

                      const SizedBox(height: 40),

                      /// Benefits
                      SizedBox(
                        height: 90,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          children: [
                            BenefitCard(
                              title: 'Assured 2-Hour\nSite Delivery',
                              icon: Image.asset(
                                'assets/icons/delivery.png',
                                width: 40,
                              ),
                            ),
                            const SizedBox(width: 24),
                            BenefitCard(
                              title: 'Verified Quality\nMaterials',
                              icon: Image.asset(
                                'assets/icons/verified.png',
                                width: 40,
                              ),
                            ),
                            const SizedBox(width: 24),
                            BenefitCard(
                              title: 'Smart\nTracking',
                              icon: Image.asset(
                                'assets/icons/tracking.png',
                                width: 40,
                              ),
                            ),
                            const SizedBox(width: 24),
                            BenefitCard(
                              title: 'Instant\nSupport',
                              icon: Image.asset(
                                'assets/icons/support.png',
                                width: 40,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),

                      /// Best Selling
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: SectionHeader(
                          title: 'Best Selling Brands',
                          onViewAll: () {},
                        ),
                      ),
                      SizedBox(
                        height: 290,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          children: const [
                            ProductCard(
                              category: 'CEMENT, PPC CEMENT',
                              title: 'Shree PPC Cement',
                              price: '₹310.00/Bag',
                              imageUrl: 'assets/images/cement_cat.png',
                              width: 185,
                            ),
                            ProductCard(
                              category: 'CEMENT, PPC CEMENT',
                              title: 'Shree PPC Cement',
                              price: '₹310.00/Bag',
                              imageUrl: 'assets/images/cement_cat.png',
                              width: 185,
                            ),
                            ProductCard(
                              category: 'CEMENT, PPC CEMENT',
                              title: 'Shree PPC Cement',
                              price: '₹310.00/Bag',
                              imageUrl: 'assets/images/cement_cat.png',
                              width: 185,
                            ),
                            ProductCard(
                              category: 'CEMENT, PPC CEMENT',
                              title: 'Shree PPC Cement',
                              price: '₹310.00/Bag',
                              imageUrl: 'assets/images/cement_cat.png',
                              width: 185,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 120),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
