import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trust_develpoment/app/core/ui_helper/color/colors.dart';
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
    setState(() {
      _selectedIndex = index;
    });

    // TODO: navigation later if needed
    // if (index == 1) Navigator.pushNamed(context, Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.person, LocaleKeys.profile.tr(), 0),
          _navItem(Icons.home, LocaleKeys.home.tr(), 1),
          const SizedBox(width: 50),
          _navItem(Icons.local_offer, LocaleKeys.offers.tr(), 2),
          _navItem(Icons.menu, LocaleKeys.menu.tr(), 3),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
    final bool isSelected = _selectedIndex == index;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => _onItemTapped(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.darkRed : AppColors.textSecondary,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTextStyles.caption.copyWith(
                color: isSelected ? AppColors.darkRed : AppColors.textSecondary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
