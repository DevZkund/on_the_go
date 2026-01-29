import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';

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
