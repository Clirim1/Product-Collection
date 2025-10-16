import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    const int selectedIndex = 1;

    final List<_NavItem> items = [
      _NavItem(icon: "assets/images/scan.png", label: "Scan"),
      _NavItem(icon: "assets/images/collection.png", label: "Collection"),
      _NavItem(icon: "assets/images/shop.png", label: "Shop"),
      _NavItem(icon: "assets/images/settings.png", label: "Settings"),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 16),
      decoration: const BoxDecoration(
        color: Color(0xFF0D151A),
        border: Border(top: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final bool isSelected = index == selectedIndex;

          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  items[index].icon,
                  width: 24,
                  height: 24,
                  color: isSelected ? Colors.white : Colors.grey[600],
                ),
                const SizedBox(height: 8),
                Text(
                  items[index].label,
                  style: GoogleFonts.lato(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: isSelected ? Colors.white : Colors.grey[600],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _NavItem {
  final String icon;
  final String label;

  const _NavItem({required this.icon, required this.label});
}
