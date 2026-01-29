import 'package:flutter/material.dart';
import 'package:on_the_go/features/home/ui/widgets/search_bar_widget.dart';
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

class MobileHomeView extends StatelessWidget {
  const MobileHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const HomeAppBar(),
        const HomeBannerCarousel(),
        SliverToBoxAdapter(
          child: Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 24),
                SizedBox(
                  height: 140,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _categories.length,
                    separatorBuilder: (_, _) => const SizedBox(width: 22),
                    itemBuilder: (context, index) => _categories[index],
                  ),
                ),
                // Search Bar
                const SearchBarWidget(),
                const SizedBox(height: 16),
                // Track Your Order
                const TrackOrderCard(),
                const SizedBox(height: 16),
                // Feature Cards
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: FeatureCard(
                          title: 'Bulk\nConstruction',
                          imageUrl: 'assets/images/card-1.png',
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: FeatureCard(
                          title: 'Tools &\nConsumables',
                          imageUrl: 'assets/images/card-2.png',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Shop By Category
                SectionHeader(title: 'Shop By Category', onViewAll: () {}),
                SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: const [
                      CategoryShopItem(
                        title: 'Cement',
                        imageUrl: 'assets/images/card-1.png',
                      ),
                      SizedBox(width: 16),
                      CategoryShopItem(
                        title: 'Steel & TMT Bars',
                        imageUrl: 'assets/images/steel_cat.png',
                      ),
                      SizedBox(width: 16),
                      CategoryShopItem(
                        title: 'Bricks & Blocks',
                        imageUrl: 'assets/images/bricks_cat.png',
                      ),
                    ],
                  ),
                ),

                // Bulk Quote Banner
                const BulkQuoteBanner(),

                // Benefits Grid
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 2.3,
                    children: [
                      BenefitCard(
                        title: 'Assured 2-Hour\nSite Delivery',
                        icon: Image.asset(
                          'assets/icons/delivery.png',
                          width: 32,
                          height: 32,
                        ),
                      ),
                      BenefitCard(
                        title: 'Verified Quality\nMaterials',
                        icon: Image.asset(
                          'assets/icons/verified.png',
                          width: 32,
                          height: 32,
                        ),
                      ),
                      BenefitCard(
                        title: 'Smart\nTracking',
                        icon: Image.asset(
                          'assets/icons/tracking.png',
                          width: 32,
                          height: 32,
                        ),
                      ),
                      BenefitCard(
                        title: 'Instant\nSupport',
                        icon: Image.asset(
                          'assets/icons/support.png',
                          width: 32,
                          height: 32,
                        ),
                      ),
                    ],
                  ),
                ),

                // Best Selling Brands
                SectionHeader(title: 'Best Selling Brands', onViewAll: () {}),
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
      ],
    );
  }
}
