import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/categories_sections/nav_item.dart';
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
          NavItem(
            icon: Icons.person,
            label: LocaleKeys.profile.tr(),
            isSelected: _selectedIndex == 0,
            onTap: () => _onItemTapped(0),
          ),
          NavItem(
            icon: Icons.home,
            label: LocaleKeys.home.tr(),
            isSelected: _selectedIndex == 1,
            onTap: () => _onItemTapped(1),
          ),
          const SizedBox(width: 50),
          NavItem(
            icon: Icons.local_offer,
            label: LocaleKeys.offers.tr(),
            isSelected: _selectedIndex == 2,
            onTap: () => _onItemTapped(2),
          ),
          NavItem(
            icon: Icons.menu,
            label: LocaleKeys.menu.tr(),
            isSelected: _selectedIndex == 3,
            onTap: () => _onItemTapped(3),
          ),
        ],
      ),
    );
  }
}
