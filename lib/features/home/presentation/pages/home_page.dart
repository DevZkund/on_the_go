import 'package:flutter/material.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/constants/app_constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: MobileHomeView(),
      tablet: TabletHomeView(),
      desktop: DesktopHomeView(),
    );
  }
}

class MobileHomeView extends StatelessWidget {
  const MobileHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobile Home')),
      body: ListView(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        children: List.generate(
          10,
          (index) => Card(
            child: ListTile(
              title: Text('Item $index'),
              subtitle: const Text('This is a mobile view'),
            ),
          ),
        ),
      ),
    );
  }
}

class TabletHomeView extends StatelessWidget {
  const TabletHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tablet Home')),
      body: GridView.builder(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: AppConstants.paddingMedium,
          mainAxisSpacing: AppConstants.paddingMedium,
        ),
        itemCount: 10,
        itemBuilder: (context, index) =>
            Card(child: Center(child: Text('Grid Item $index'))),
      ),
    );
  }
}

class DesktopHomeView extends StatelessWidget {
  const DesktopHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Desktop Home')),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: AppConstants.maxContentWidth,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: ListView(
                  padding: const EdgeInsets.all(AppConstants.paddingMedium),
                  children: List.generate(
                    10,
                    (index) => Card(
                      child: ListTile(
                        title: Text('Desktop Item $index'),
                        subtitle: const Text('Main content area'),
                      ),
                    ),
                  ),
                ),
              ),
              const VerticalDivider(width: 1),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(AppConstants.paddingMedium),
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sidebar',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: AppConstants.paddingMedium),
                      Text('This is a desktop-only sidebar.'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
