import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:on_the_go/core/theme/app_theme.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.primaryDark,
      pinned: true,
      forceElevated: false,
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
        icon: SizedBox(
          width: 26,
          height: 20,
          child: SvgPicture.asset(
            'assets/icons/menu.svg',
            colorFilter: const ColorFilter.mode(
              AppColors.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
      actions: [
        InkWell(
          onTap: () {},
          child: Badge(
            backgroundColor: Colors.transparent,
            label: Container(
              width: 18,
              height: 18,
              decoration: const ShapeDecoration(
                color: AppColors.primaryDark,
                shape: OvalBorder(
                  side: BorderSide(width: 2, color: AppColors.primary),
                ),
              ),
              child: const Center(
                child: Text(
                  '3',
                  style: TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 10,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              'assets/icons/shopping-bag.svg',
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        const SizedBox(width: 24),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/icons/person.svg',
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
              height: 24,
              width: 24,
            ),
            SizedBox(height: 2),
            Text(
              "Hi Guest",
              style: TextStyle(
                color: AppColors.textGrey,
                fontSize: 13,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
      title: Container(
        color: AppColors.primaryDark,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Hi, ',
                          style: TextStyle(
                            color: AppColors.textGrey,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const TextSpan(
                          text: 'Good Day!',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 14,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        "Noida Sec 62...",
                        style: TextStyle(
                          color: AppColors.textGrey,
                          fontSize: 12,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        size: 14,
                        color: AppColors.textGrey,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floating: true,
    );
  }
}
