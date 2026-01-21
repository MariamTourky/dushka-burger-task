import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trust_develpoment/app/core/ui_helper/style/font_style.dart';
import 'package:trust_develpoment/generated/locale_keys.g.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).bottomNavigationBarTheme;

    return BottomAppBar(
      color: theme.backgroundColor,
      shape: const CircularNotchedRectangle(),
      notchMargin: 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          navItem(context, Icons.person, LocaleKeys.profile.tr(), 0),
          navItem(context, Icons.home, LocaleKeys.home.tr(), 1),
          const SizedBox(width: 50),
          navItem(context, Icons.local_offer, LocaleKeys.offers.tr(), 2),
          navItem(context, Icons.menu, LocaleKeys.menu.tr(), 3),
        ],
      ),
    );
  }

  Widget navItem(BuildContext context, IconData icon, String label, int index) {
    final theme = Theme.of(context).bottomNavigationBarTheme;
    final bool isSelected = _selectedIndex == index;

    final Color iconColor = isSelected
        ? theme.selectedItemColor!
        : theme.unselectedItemColor!;

    final bool showLabel = isSelected
        ? theme.showSelectedLabels ?? true
        : theme.showUnselectedLabels ?? true;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => _onItemTapped(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: iconColor),
            if (showLabel) ...[
              const SizedBox(height: 4),
              Text(
                label,
                style: AppTextStyles.caption.copyWith(
                  color: iconColor,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
