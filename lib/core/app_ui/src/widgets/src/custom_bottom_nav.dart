import 'package:flutter/material.dart';
import 'package:personal/core/models/models.dart';

class CustomBottomNav extends StatelessWidget {
  final List<BottomNavModel> bottomNavList;
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const CustomBottomNav({
    super.key,
    required this.bottomNavList,
    this.currentIndex = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items:
          bottomNavList.map((item) {
            return BottomNavigationBarItem(
              icon: Icon(item.icon),
              label: item.label,
            );
          }).toList(),
    );
  }
}
