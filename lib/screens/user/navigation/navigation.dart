import 'package:flutter/material.dart';
import 'package:kisan_saathi/providerModels/navigationProvider.dart';
import 'package:kisan_saathi/screens/user/navigation/navigationItem.dart';
import 'package:provider/provider.dart';

class AppNavigator extends StatelessWidget {
  final List<NavigationItem> items;

  const AppNavigator({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navigationProvider, _) {
        return Scaffold(
          body: IndexedStack(
            index: navigationProvider.currentIndex,
            children: items.map((item) => item.screen).toList(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navigationProvider.currentIndex,
            onTap: navigationProvider.setIndex,
            type: BottomNavigationBarType.fixed,
            items: items
                .map(
                  (item) => BottomNavigationBarItem(
                    icon: Icon(item.icon),
                    label: item.label,
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
